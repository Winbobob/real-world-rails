#
# Copyright (C) 2013 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../cassandra_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe "GradeChangeAudit API", type: :request do
  context "not configured" do
    before do
      allow(Canvas::Cassandra::DatabaseBuilder).to receive(:configured?).with('auditors').and_return(false)
      user_with_pseudonym(account: Account.default)
      @user.account_users.create(account: Account.default)
    end

    it "should 404" 

  end

  context "configured" do
    include_examples "cassandra audit logs"

    before do
      @request_id = SecureRandom.uuid
      allow(RequestContextGenerator).to receive_messages( :request_id => @request_id )

      @domain_root_account = Account.default
      @viewing_user = user_with_pseudonym(account: @domain_root_account)
      @account_user = @viewing_user.account_users.create(account: @domain_root_account)

      course_with_teacher(account: @domain_root_account, user: user_with_pseudonym(account: @domain_root_account))
      student_in_course(user: user_with_pseudonym(account: @domain_root_account))

      @assignment = @course.assignments.create!(title: 'Assignment', points_possible: 10)
      @submission = @assignment.grade_student(@student, grade: 8, grader: @teacher).first
      @event = Auditors::GradeChange.record(@submission)
    end

    def fetch_for_context(context, options={})
      type = context.class.to_s.downcase unless type = options.delete(:type)
      user = options.delete(:user) || @viewing_user
      id = Shard.global_id_for(context).to_s

      arguments = { controller: :grade_change_audit_api, action: "for_#{type}", "#{type}_id": id, format: :json }
      query_string = []

      if per_page = options.delete(:per_page)
        arguments[:per_page] = per_page.to_s
        query_string << "per_page=#{arguments[:per_page]}"
      end

      if start_time = options.delete(:start_time)
        arguments[:start_time] = start_time.iso8601
        query_string << "start_time=#{arguments[:start_time]}"
      end

      if end_time = options.delete(:end_time)
        arguments[:end_time] = end_time.iso8601
        query_string << "end_time=#{arguments[:end_time]}"
      end

      if account = options.delete(:account)
        arguments[:account_id] = Shard.global_id_for(account).to_s
        query_string << "account_id=#{arguments[:account_id]}"
      end
      arguments[:include] = options.delete(:include) if options.key?(:include)

      path = "/api/v1/audit/grade_change/#{type.pluralize}/#{id}"
      path += "?" + query_string.join('&') if query_string.present?
      api_call_as_user(user, :get, path, arguments, {}, {}, options.slice(:expected_status))
    end

    def fetch_for_course_and_other_contexts(contexts, options={})
      expected_contexts = [:course, :assignment, :grader, :student].freeze
      sorted_contexts = contexts.select { |key,_| expected_contexts.include?(key) }.
        sort_by { |key, _| expected_contexts.index(key) }

      arguments = sorted_contexts.map { |key, value| ["#{key}_id".to_sym, value.id] }.to_h
      arguments.merge!({
        controller: :grade_change_audit_api,
        action: :for_course_and_other_parameters,
        format: :json
      })

      query_string = []

      per_page = options.delete(:per_page)
      if per_page
        arguments[:per_page] = per_page.to_s
        query_string << "per_page=#{arguments[:per_page]}"
      end

      start_time = options.delete(:start_time)
      if start_time
        arguments[:start_time] = start_time.iso8601
        query_string << "start_time=#{arguments[:start_time]}"
      end

      end_time = options.delete(:end_time)
      if end_time
        arguments[:end_time] = end_time.iso8601
        query_string << "end_time=#{arguments[:end_time]}"
      end

      account = options.delete(:account)
      if account
        arguments[:account_id] = Shard.global_id_for(account).to_s
        query_string << "account_id=#{arguments[:account_id]}"
      end

      user = options[:user] || @viewing_user

      path_args = sorted_contexts.map { |key, value| "#{key.to_s.pluralize}/#{value.id}" }.join('/')

      path = "/api/v1/audit/grade_change/#{path_args}"
      path += "?" + query_string.join('&') if query_string.present?
      api_call_as_user(user, :get, path, arguments, {}, {}, options.slice(:expected_status))
    end

    def events_for_context(context, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      json['events'].map { |e| [e['id'], e['event_type']] }
    end

    def expect_event_for_context(context, event, options={})
      json = fetch_for_context(context, options)
      events = events_for_context(context, options.merge(json: json))
      expect(events).to include([event.id, event.event_type])
      json
    end

    def events_for_course_and_contexts(contexts, options)
      json = options.delete(:json)
      json ||= fetch_for_course_and_other_contexts(contexts, options)
      json['events'].map{ |e| [e['id'], e['event_type']] }
    end

    def expect_event_for_course_and_contexts(contexts, event, options={})
      json = fetch_for_course_and_other_contexts(contexts, options)
      events = events_for_course_and_contexts(contexts, options.merge(json: json))
      expect(events).to include([event.id, event.event_type])
      json
    end

    def forbid_event_for_context(context, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
                    .not_to include([event.id, event.event_type])
      json
    end

    def forbid_event_for_course_and_contexts(contexts, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_course_and_contexts(contexts, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
        .not_to include([event.id, event.event_type])
      json
    end

    def test_course_and_contexts(student: @student)
      # course assignment
      contexts = { course: @course, assignment: @assignment }
      yield(contexts)
      # course assignment grader
      contexts[:grader] = @teacher
      yield(contexts)
      # course assignment grader student
      contexts[:student] = student
      yield(contexts)
      # course assignment student
      contexts.delete(:grader)
      yield(contexts)
      # course student
      contexts.delete(:assignment)
      yield(contexts)
      # course grader
      contexts = { course: @course, grader: @teacher}
      yield(contexts)
      # course grader student
      contexts[:student] = student
      yield(contexts)
    end

    context "nominal cases" do
      it "should include events at context endpoint" 

    end

    context "section visibility" do
      before do
        new_section = @course.course_sections.create!
        @ta = User.create
        @course.enroll_user(@ta, "TaEnrollment", limit_privileges_to_course_section: true, section: new_section)
        @student_in_new_section = User.create!
        @course.enroll_user(@student_in_new_section, "StudentEnrollment", enrollment_state: "active", section: new_section)
        submission = @assignment.grade_student(@student_in_new_section, grade: 8, grader: @teacher).first
        @event_visible_to_ta = Auditors::GradeChange.record(submission)
      end

      context "course" do
        it "returns grade change events for students within the current user's section visibility" 


        it "returns grade change events for rejected enrollments" 


        it "returns grade change events for deleted enrollments" 


        it "does not return grade change events for students outside of the current user's section visibility" 

      end

      context "course + other context" do
        it "returns grade change events for students within the current user's section visibility" 


        it "does not return grade change events for students outside of the current user's section visibility" 

      end
    end

    describe "arguments" do
      before do
        record = Auditors::GradeChange::Record.new(
          'created_at' => 1.day.ago,
          'submission' => @submission,
        )
        @event2 = Auditors::GradeChange::Stream.insert(record)
      end

      it "recognizes :start_time" 


      it "recognizes :end_time" 


      it "includes a grade_current key when passed 'current_grade' in the include param" 


      it "returns a grade_current of 'N/A' if a grade is not available" 


      it "does not include a grade_current key when 'current_grade' is not in the include param" 


      it "does not include a grade_current key in the absence of an include param" 


    end

    context "deleted entities" do
      it "should 404 for inactive assignments" 


      it "should allow inactive assignments when used with a course" 


      it "should allow inactive courses" 


      it "should 404 for inactive students" 


      it "should allow inactive students when used with a course" 


      it "should 404 for inactive grader" 


      it "should allow inactive graders when used with a course" 

    end

    describe "courses not found" do
      context "for_course" do
        let(:nonexistent_course) { -1 }
        let(:params) do
          {
            assignment_id: @assignment.id,
            course_id: nonexistent_course,
            controller: :grade_change_audit_api,
            action: :for_course,
            format: :json
          }
        end
        let(:path) { "/api/v1/audit/grade_change/courses/#{nonexistent_course}" }

        it "returns a 404 when admin" 


        it "returns a 401 when teacher" 


        it "returns a 401 when not a teacher nor admin" 

      end

      context "for_course_and_other_parameters" do
        let(:nonexistent_course) { -1 }
        let(:params) do
          {
            assignment_id: @assignment.id,
            course_id: nonexistent_course,
            controller: :grade_change_audit_api,
            action: :for_course_and_other_parameters,
            format: :json
          }
        end
        let(:path) { "/api/v1/audit/grade_change/courses/#{nonexistent_course}/assignments/#{@assignment.id}" }

        it "returns a 404 when admin" 


        it "returns a 401 when teacher" 


        it "returns a 401 when not teacher nor admin" 

      end
    end

    describe "permissions" do
      it "should not authorize the endpoints with no permissions" 


      it "should not authorize the endpoints with :view_all_grades, :view_grade_changes and :manage_grades revoked" 


      it "should not allow other account models" 


      context "for teachers" do
        it "returns a 401 on for_assignment" 


        it "returns a 401 on for_student" 


        it "returns a 401 on for_grader" 


        it "returns a 200 on for_course" 


        it "returns a 200 on for_course for a concluded course" 


        it "returns a 200 on for_course_and_other_parameters" 


        it "returns a 401 on for_course when not teacher in that course" 


        it "returns a 401 on for_course_and_other_parameters when not teacher in that course" 

      end

      context "sharding" do
        specs_require_sharding

        before do
          @new_root_account = @shard2.activate{ Account.create!(name: 'New Account') }
          allow(LoadAccount).to receive(:default_domain_root_account).and_return(@new_root_account)
          allow(@new_root_account).to receive(:grants_right?).and_return(true)
          @viewing_user = user_with_pseudonym(account: @new_root_account)
        end

        it "should 404 if nothing matches the type" 


        it "should work for teachers" 


        it "should work for students" 

      end
    end

    describe "pagination" do
      before do
        Auditors::GradeChange.record(@submission)
        Auditors::GradeChange.record(@submission)
        @json = fetch_for_context(@student, per_page: 2, type: "student")
      end

      it "should only return one page of results" 


      it "should have pagination headers" 

    end
  end
end

