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

describe "CourseAudit API", type: :request do
  context "not configured" do
    before do
      allow(Canvas::Cassandra::DatabaseBuilder).to receive(:configured?).with('auditors').and_return(false)
      course_factory
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
      @account_user = @viewing_user.account_users.create(:account => @domain_root_account)

      course_with_teacher(account: @domain_root_account)

      @course.name = "Course 1"
      @course.start_at = Date.today
      @course.conclude_at = @course.start_at + 7.days

      @event = Auditors::Course.record_updated(@course, @teacher, @course.changes)
    end

    def fetch_for_context(context, options={})
      type = context.class.to_s.downcase unless type = options.delete(:type)
      id = context.id.to_s

      arguments = { controller: 'course_audit_api', action: "for_#{type}", :"#{type}_id" => id, format: 'json' }
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

      path = "/api/v1/audit/course/#{type.pluralize}/#{id}"
      path += "?" + query_string.join('&') if query_string.present?
      api_call_as_user(@viewing_user, :get, path, arguments, {}, {}, options.slice(:expected_status))
    end

    def expect_event_for_context(context, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
                    .to include([event.id, event.event_type])
      json
    end

    def forbid_event_for_context(context, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
                    .not_to include([event.id, event.event_type])
      json
    end

    context "nominal cases" do
      it "should include events at context endpoint" 

    end

    describe "arguments" do
      before do
        record = Auditors::Course::Record.new(
          'course' => @course,
          'user' => @teacher,
          'event_type' => 'updated',
          'event_data' => @course.changes,
          'created_at' => 1.day.ago
        )
        @event2 = Auditors::Course::Stream.insert(record)
      end

      it "should recognize :start_time" 


      it "should recognize :end_time" 

    end

    context "deleted entities" do
      it "should 200 for inactive courses" 

    end

    describe "permissions" do
      it "should not authorize the endpoints with no permissions" 


      it "should not authorize the endpoints with revoking the :view_course_changes permission" 


      it "should not allow other account models" 

    end

    describe "pagination" do
      before do
        Auditors::Course.record_updated(@course, @teacher, @course.changes)
        Auditors::Course.record_updated(@course, @teacher, @course.changes)
        @json = fetch_for_context(@course, per_page: 2)
      end

      it "should only return one page of results" 


      it "should have pagination headers" 

    end
  end
end

