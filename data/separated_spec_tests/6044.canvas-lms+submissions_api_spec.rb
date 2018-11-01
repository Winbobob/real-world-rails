#
# Copyright (C) 2011 - present Instructure, Inc.
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

require_relative '../api_spec_helper'
require_relative '../file_uploads_spec_helper'

describe 'Submissions API', type: :request do
  include Api::V1::User

  let(:params) { {} }

  before :each do
    allow(HostUrl).to receive(:file_host_with_shard).and_return(["www.example.com", Shard.default])
  end

  def submit_homework(assignment, student, opts = {:body => "test!"})
    @submit_homework_time ||= Time.zone.at(0)
    @submit_homework_time += 1.hour # each submission in a test is separated by an hour
    sub = assignment.find_or_create_submission(student)
    if sub.versions.size == 1
      Version.where(:id => sub.versions.first).update_all(:created_at => @submit_homework_time)
    end
    sub.workflow_state = 'submitted'
    yield(sub) if block_given?
    sub.with_versioning(:explicit => true) do
      update_with_protected_attributes!(sub, { :submitted_at => @submit_homework_time, :created_at => @submit_homework_time }.merge(opts))
    end
    sub.versions.reload.each { |v| Version.where(:id => v).update_all(:created_at => v.model.created_at) }
    sub
  end

  describe "using section ids" do
    before :once do
      @student1 = user_factory(active_all: true)
      course_with_teacher(:active_all => true)
      @default_section = @course.default_section
      @section = factory_with_protected_attributes(@course.course_sections, :sis_source_id => 'my-section-sis-id', :name => 'section2')
      @course.enroll_user(@student1, 'StudentEnrollment', :section => @section).accept!

      quiz = Quizzes::Quiz.create!(:title => 'quiz1', :context => @course)
      quiz.did_edit!
      quiz.offer!
      @a1 = quiz.assignment
      sub = @a1.find_or_create_submission(@student1)
      sub.submission_type = 'online_quiz'
      sub.workflow_state = 'submitted'
      sub.save!
    end

    it "lists submissions" 


    it 'returns submissions based on workflow_state' 


    shared_examples_for 'enrollment_state' do
      it 'should scope call to enrollment_state' 

    end

    context 'active enrollment_state with active and concluded enrollments' do
      include_examples 'enrollment_state'
      before do
        e = @course.enroll_user(@student1, 'StudentEnrollment', section: @default_section)
        e.conclude
        @enrollment_state = 'concluded'
        @active_count = 1
        @concluded_count = 1
      end
    end

    context 'active enrollment_state' do
      include_examples 'enrollment_state'
      before do
        @enrollment_state = 'active'
        @active_count = 1
        @concluded_count = 0
      end
    end

    context 'active enrollment_state state_based_on_date=false' do
      include_examples 'enrollment_state'
      before do
        @course.start_at = 10.days.ago
        @course.conclude_at = 2.days.ago
        @course.restrict_enrollments_to_course_dates = true
        @course.save!

        @state_based_on_date = false
        @enrollment_state = 'active'
        @active_count = 1
        @concluded_count = 0
      end
    end

    context 'conclude enrollment_state' do
      include_examples 'enrollment_state'
      before do
        @state_based_on_date = true
        @enrollment_state = 'concluded'
        @active_count = 0
        @concluded_count = 1
      end
    end

    context 'conclude enrollment_state state_based_on_date=false' do
      include_examples 'enrollment_state'
      before do
        @course.start_at = 10.days.ago
        @course.conclude_at = 2.days.ago
        @course.restrict_enrollments_to_course_dates = true
        @course.save!

        @state_based_on_date = false
        @enrollment_state = 'concluded'
        @active_count = 0
        @concluded_count = 1
      end
    end

    context 'empty enrollment_state' do
      include_examples 'enrollment_state'
      before do
        @enrollment_state = ''
        @active_count = 1
        @concluded_count = 1
      end
    end

    it 'should raise on invalid enrollment_state' 


    it 'returns submissions based on assignments.post_to_sis' 


    it 'returns submissions based on submitted_since' 


    it 'returns submissions based on graded_since' 


    it 'does not returns submissions based on graded_since' 


    it 'should scope call to enrollment_state with post_to_sis' 


    it 'returns filter submissions to enrollments from sis for post_to_sis' 


    it "includes user" 


    it "returns assignment_visible" 


    it "posts to submissions" 


    it "returns assignment_visible after posting to submissions" 


    it "should be able to handle an update without visibility when DA is on" 


    it "returns submissions for a section" 


    it "does not show grades or hidden comments to students on muted assignments" 


    context 'for a submission with a draft comment and a published comment' do
      before(:once) do
        @a1.update_submission(@student1, draft_comment: true, comment: 'Draft Answer: forty-one')
        @a1.update_submission(@student1, comment: 'Answer: forty-two')
      end

      before(:each) do
        @user = @student1

        @json = api_call(:get,
          "/api/v1/sections/sis_section_id:my-section-sis-id/assignments/#{@a1.id}/submissions/#{@student1.id}",
          { :controller => 'submissions_api', :action => 'show',
            :format => 'json', :section_id => 'sis_section_id:my-section-sis-id',
            :assignment_id => @a1.id.to_s, :user_id => @student1.id.to_s },
          { :include => %w(submission_comments) })
      end

      it 'returns only published comments' 

    end

    it "does not show rubric assessments to students on muted assignments" 


    it "does not find sections in other root accounts" 


    context 'submission comment attachments' do
      before :once do
        course_with_student(active_all: true)
        @assignment = @course.assignments.create! name: "blah",
          submission_types: "online_upload"
        @attachment = Attachment.create! context: @assignment,
          user: @student,
          filename: "cats.jpg",
          uploaded_data: StringIO.new("meow?")
      end

      def put_comment_attachment
        raw_api_call :put,
          "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions/#{@student.id}/",
          {controller: 'submissions_api', action: 'update', format: 'json',
           course_id: @course.to_param, assignment_id: @assignment.to_param,
           user_id: @student.to_param},
          comment: {file_ids: [@attachment.id]}
      end

      it "doesn't let you attach files you don't have permission for" 


      it 'works' 

    end
  end

  it "returns student discussion entries for discussion_topic assignments" 


  it "returns student discussion entries from child topics for group discussion_topic assignments" 


  def submission_with_comment
    @student = user_factory(active_all: true)
    course_with_teacher(:active_all => true)
    @course.enroll_student(@student).accept!
    @quiz = Quizzes::Quiz.create!(:title => 'quiz1', :context => @course)
    @quiz.did_edit!
    @quiz.offer!
    @assignment = @quiz.assignment
    @submission = @assignment.find_or_create_submission(@student)
    @submission.submission_type = 'online_quiz'
    @submission.workflow_state = 'submitted'
    @submission.save!
    @assignment.update_submission(@student, :comment => "i am a comment")
  end

  it "returns user display info along with submission comments" 


  it 'does not return user display info with anonymous submission comments' 


  it "returns comment id along with submission comments" 


  it "returns a valid preview url for quiz submissions" 


  it "returns a correct submission_history for quiz submissions" 


  it "returns the correct submitted_at date for each quiz submission" 


  it "allows students to retrieve their own submission" 


  it "returns grading information for observers" 


  it "should api translate online_text_entry submissions" 


  it "allows retrieving attachments without a session" 


  it "allows retrieving media comments without a session" 


  it "returns all submissions for an assignment" 


  it "paginates submissions" 


  it "returns nothing if no assignments in the course" 


  it "returns sis_user_id for user when grouped" 


  it "returns integration_id for the user when grouped" 


  it "returns vericite data if present and vericite is enabled for the assignment" 


  it "returns turnitin data if present and turnitin is enabled for the assignment" 


  describe "#for_students" do
    before(:once) do
      @student1 = user_factory(active_all: true)
      @student2 = user_with_pseudonym(:active_all => true)
      @student2.pseudonym.update_attribute(:sis_user_id, 'my-student-id')

      course_with_teacher(:active_all => true)

      @course.enroll_student(@student1).accept!
      @course.enroll_student(@student2).accept!

      @a1 = @course.assignments.create!(:title => 'assignment1', :grading_type => 'letter_grade', :points_possible => 15)
      @a2 = @course.assignments.create!(:title => 'assignment2', :grading_type => 'letter_grade', :points_possible => 25)

      submit_homework(@a1, @student1)
      submit_homework(@a2, @student1)
      submit_homework(@a1, @student2)
    end

    it "returns all submissions for a student", priority: "1", test_id: 2989898 do
      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param] })

      expect(json.size).to eq 2
      json.each { |submission| expect(submission['user_id']).to eq @student1.id }

      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param, @student2.to_param] })

      expect(json.size).to eq 4

      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param, @student2.to_param],
              :assignment_ids => [@a1.to_param] })

      expect(json.size).to eq 2
      expect(json.all? { |submission| expect(submission['assignment_id']).to eq @a1.id }).to be_truthy

      # by sis user id!
      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param, 'sis_user_id:my-student-id'],
              :assignment_ids => [@a1.to_param] })

      expect(json.size).to eq 2
      expect(json.all? { |submission| expect(submission['assignment_id']).to eq @a1.id }).to be_truthy

      # by sis login id!
      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param, "sis_login_id:#{@student2.pseudonym.unique_id}"],
              :assignment_ids => [@a1.to_param] })

      expect(json.size).to eq 2
      expect(json.all? { |submission| expect(submission['assignment_id']).to eq @a1.id }).to be_truthy

      # concluded enrollments!
      @student2.enrollments.first.conclude
      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { :controller => 'submissions_api', :action => 'for_students',
              :format => 'json', :course_id => @course.to_param },
            { :student_ids => [@student1.to_param, "sis_login_id:#{@student2.pseudonym.unique_id}"],
              :assignment_ids => [@a1.to_param] })

      expect(json.size).to eq 2
      expect(json.all? { |submission| expect(submission['assignment_id']).to eq @a1.id }).to be_truthy
    end

    it "can return assignments based on graded_at time", priority: "1", test_id: 2989899 do
      @a2.grade_student @student1, grade: 10, grader: @teacher
      @a1.grade_student @student1, grade: 5, grader: @teacher
      @a3 = @course.assignments.create! title: "a3"
      @a3.submit_homework @student1, body: "hello"
      Submission.where(assignment_id: @a2).update_all(graded_at: 1.hour.from_now)
      json = api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { controller: 'submissions_api', action: 'for_students',
              format: 'json', course_id: @course.to_param },
            { student_ids: [@student1.to_param],
              order: "graded_at", order_direction: "descending" })
      expect(json.map { |a| a["assignment_id"] }).to eq [@a2.id, @a1.id, @a3.id]
    end

    it "errors when asking for assignments in other courses" 


    context 'OriginalityReport' do
      it 'includes has_originality_report if the submission has an originality_report' 


      it 'does not include has_originality_report if the submission has no originality_report' 

    end
  end

  context "moderated assignments" do
    before do
      student_in_course(active_all: true)
      course_with_teacher_logged_in(course: @course)
      @assignment = @course.assignments.create!(
        title: 'an assignment',
        grading_type: 'letter_grade',
        points_possible: 10
      )
      @assignment.update_attribute(:moderated_grading, true)
      @assignment.update_attribute(:grader_count, 2)
      submission = @assignment.submit_homework(@student, body: 'nice work')
      @provisional_grade = submission.provisional_grades.build do |grade|
        grade.scorer = @teacher
      end
      @provisional_grade.save!
    end

    context "when teacher can view provisional grades" do
      it "displays grades" 


      it "can include users" 

    end

    context "when a TA cannot view provisional grades" do
      before do
        course_with_ta(course: @course)
        user_session(@ta)
      end
      it "only shows caller's provisional grade" 

    end
  end

  context "for_students (differentiated_assignments)" do
    before do
      # set up course with DA and submit homework for an assignment
      # that is only visible to overrides for @section1
      @student = user_factory(active_all: true)
      course_with_teacher(:active_all => true)
      @section1 = @course.course_sections.create!(name: "test section")
      @section2 = @course.course_sections.create!(name: "test section")
      student_in_section(@section1, user: @student)
      @assignment = @course.assignments.create!(:title => 'assignment1', :grading_type => 'letter_grade', :points_possible => 15, :only_visible_to_overrides => true)
      create_section_override_for_assignment(@assignment, course_section: @section1)
      submit_homework(@assignment, @student)

      user_session(@student)
    end

    def call_to_for_students(opts={})
      helper_method = if opts[:as_student]
                        [:api_call_as_user, @student]
                      elsif opts[:as_observer]
                        [:api_call_as_user, @observer]
                      else
                        [:api_call]
                      end
      args = helper_method + [:get,
                        "/api/v1/courses/#{@course.id}/students/submissions.json",
                        { :controller => 'submissions_api', :action => 'for_students',
                          :format => 'json', :course_id => @course.to_param },
                        { :student_ids => [@student.to_param] }]
      self.send(*args)
    end

    context "as student" do
      context "differentiated_assignments" do
        it "returns the submissons if the student is in the overriden section" 


        it "does not return the submissons if the student is not in the overriden section and has a submission with no grade" 


        it "returns the submissons if the student is not in the overriden section but has a graded submission" 

      end
    end

    context "as an observer" do
      before {
        @observer = User.create
        observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active')
        observer_enrollment.update_attribute(:associated_user_id, @student.id)
      }
      context "differentiated_assignments on" do
        it "returns the submissons if the observed student is in the overriden section" 


        it "does not return the submissons if the observed student is not in the overriden section and has a submission with no grade" 


        it "returns the submissons if the observed student is not in the overriden section but has a graded submission" 

      end
    end

    context "as teacher" do
      context "differentiated_assignments on" do
        it "returns the submissons if the student is in the overriden section" 


        it "does not return the submisson if the student is not in the overriden section" 

      end
    end
  end

  context "show (differentiated_assignments)" do
    before do
      # set up course with DA and submit homework for an assignment
      # that is only visible to overrides for @section1
      # move student to a section that cannot see assignment by default
      @student = user_factory(active_all: true)
      course_with_teacher(:active_all => true)
      @section1 = @course.course_sections.create!(name: "test section")
      @section2 = @course.course_sections.create!(name: "test section")
      student_in_section(@section1, user: @student)
      @assignment = @course.assignments.create!(:title => 'assignment1', :grading_type => 'letter_grade', :points_possible => 15, :only_visible_to_overrides => true)
      create_section_override_for_assignment(@assignment, course_section: @section1)
      submit_homework(@assignment, @student)
      Score.where(enrollment_id: @student.enrollments).each(&:destroy_permanently!)
      @student.enrollments.each(&:destroy_permanently!)
      student_in_section(@section2, user: @student)

      user_session(@student)
    end

    def call_to_submissions_show(opts={})
      includes = %w(submission_comments rubric_assessment)
      includes.concat(opts[:includes]) if opts[:includes]
      helper_method = opts[:as_student] ? [:api_call_as_user, @student] : [:api_call]
      args = helper_method + [:get,
            "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions/#{@student.id}.json",
            { :controller => 'submissions_api', :action => 'show',
              :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.id.to_s, :user_id => @student.id.to_s },
            { :include => includes }]
      self.send(*args)
    end

    context "as teacher" do
      context "with differentiated_assignments" do
        it "returns the assignment" 


        it "returns assignment_visible" 

      end
    end

    context "as student in a section without an override" do
      context "with differentiated_assignments" do
        it "returns an unauthorized error" 


        it "returns the submission if it is graded" 


        it "returns assignment_visible false" 

      end
    end
  end

  context "grouped submissions" do
    before :once do
      @student1 = user_factory(active_all: true)
      @student2 = user_with_pseudonym(:active_all => true)

      course_with_teacher(active_all: true)
      ta_in_course

      @course.enroll_student(@student1).accept!
      @course.enroll_student(@student2).accept!

      @a1 = @course.assignments.create!(
        title: 'assignment1', grading_type: 'letter_grade',
        points_possible: 15
      )
      @a2 = @course.assignments.create!(
        title: 'assignment2', grading_type: 'letter_grade',
        points_possible: 25, muted: true
      )

      @a1.grade_student(@student1, grader: @teacher, grade: 15)
      @a2.grade_student(@student1, grader: @teacher, grade: 5)
      @a1.grade_student(@student2, grader: @teacher, excused: true)
    end

    it "returns student submissions grouped by student" 


    it "paginates" 


    describe "current and final scores" do
      context "when accessing as a teacher with default permissions" do
        let(:json) do
          api_call(:get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { controller: 'submissions_api', action: 'for_students',
              format: 'json', course_id: @course.to_param },
            { student_ids: [@student1.to_param], include: ['total_scores'], grouped: '1' })
        end

        it "returns a single record" 


        it "returns the computed_current_score" 


        it "returns the unposted_current_score" 


        it "returns the computed_final_score" 


        it "returns the unposted_final_score" 

      end

      context "when the requester does not have permissions to see unposted scores" do
        let(:json) do
          api_call_as_user(@student1, :get,
           "/api/v1/courses/#{@course.id}/students/submissions.json",
           { controller: 'submissions_api', action: 'for_students',
             format: 'json', course_id: @course.to_param },
           { student_ids: [@student1.to_param], include: ['total_scores'], grouped: '1' })
        end

        it "returns a single record" 


        it "returns the computed_current_score" 


        it "omits the unposted_current_score" 


        it "returns the computed_final_score" 


        it "omits the unposted_final_score" 

      end

      context "when the requester can manage grades" do
        before(:once) do
          @course.root_account.role_overrides.create!(permission: 'view_all_grades', role: ta_role, enabled: false)
          @course.root_account.role_overrides.create!(permission: 'manage_grades', role: ta_role, enabled: true)
        end

        let(:json) do
          api_call_as_user(@ta, :get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { controller: 'submissions_api', action: 'for_students',
              format: 'json', course_id: @course.to_param },
            { student_ids: [@student1.to_param], include: ['total_scores'], grouped: '1' })
        end

        it "returns a single record" 


        it "returns the computed_current_score" 


        it "returns the unposted_current_score" 


        it "returns the computed_final_score" 


        it "returns the unposted_final_score" 

      end

      context "when the requester can view all grades" do
        before(:once) do
          @course.root_account.role_overrides.create!(permission: 'view_all_grades', role: designer_role, enabled: true)
          @course.root_account.role_overrides.create!(permission: 'manage_grades', role: designer_role, enabled: false)

          course_with_designer(course: @course)
        end

        let(:json) do
          api_call_as_user(@designer, :get,
            "/api/v1/courses/#{@course.id}/students/submissions.json",
            { controller: 'submissions_api', action: 'for_students',
              format: 'json', course_id: @course.to_param },
            { student_ids: [@student1.to_param], include: ['total_scores'], grouped: '1' })
        end

        it "returns a single record" 


        it "returns the computed_current_score" 


        it "returns the unposted_current_score" 


        it "returns the computed_final_score" 


        it "returns the unposted_final_score" 

      end
    end
  end

  context "with grading periods" do
    before :once do
      @student1 = user_factory(active_all: true)
      @student2 = user_with_pseudonym(:active_all => true)

      course_with_teacher(:active_all => true)

      @course.enroll_student(@student1).accept!
      @course.enroll_student(@student2).accept!

      gpg = Factories::GradingPeriodGroupHelper.new.legacy_create_for_course(@course)
      @gp1 = gpg.grading_periods.create!(
        title: 'first',
        weight: 50,
        start_date: 2.days.ago,
        end_date: 1.day.from_now
      )
      @gp2 = gpg.grading_periods.create!(
        title: 'second',
        weight: 50,
        start_date: 2.days.from_now,
        end_date: 1.month.from_now
      )
      a1 = @course.assignments.create!(due_at: 1.minute.from_now, :submission_types => 'online_text_entry')
      a2 = @course.assignments.create!(due_at: 1.week.from_now, :submission_types => 'online_text_entry')

      submit_homework(a1, @student1)
      submit_homework(a2, @student1) # only one in current grading period
      submit_homework(a1, @student2)
    end

    it "filters by grading period" 


    it "does not return an error when no grading_period_id is provided" 

  end

  context "with late policies" do
    before :once do
      student_in_course(active_all: true)
      teacher_in_course(active_all: true)
      @late_policy = late_policy_factory(course: @course, deduct: 10, every: :day, down_to: 30)
      @late_assignment = @course.assignments.create!(
        title: "assignment1",
        due_at: 47.hours.ago,
        points_possible: 10,
        submission_types: 'online_text_entry'
      )
    end

    let(:late_submission_api_header) do
      {
        controller: "submissions_api",
        action: "update",
        format: "json",
        course_id: @course.id.to_s,
        assignment_id: @late_assignment.id.to_s,
        user_id: @student.id.to_s
      }
    end

    it "applies late policy when grading the submission twice with the same raw score" 

  end

  describe "for_students non-admin" do
    before :once do
      course_with_student :active_all => true
      @student1 = @student
      @student2 = student_in_course(:active_all => true).user
      @student3 = student_in_course(:active_all => true).user
      @assignment1 = @course.assignments.create! :title => 'assignment1', :grading_type => 'points', :points_possible => 15
      @assignment2 = @course.assignments.create! :title => 'assignment2', :grading_type => 'points', :points_possible => 25
      bare_submission_model @assignment1, @student1, grade: 15, grader_id: @teacher.id, score: 15
      bare_submission_model @assignment2, @student1, grade: 25, grader_id: @teacher.id, score: 25
      bare_submission_model @assignment1, @student2, grade: 10, grader_id: @teacher.id, score: 10
      bare_submission_model @assignment2, @student2, grade: 20, grader_id: @teacher.id, score: 20
      bare_submission_model @assignment1, @student3, grade: 20, grader_id: @teacher.id, score: 20
    end

    context "teacher" do
      it "shows all submissions" 

    end

    context "students" do
      it "allows a student to view his own submissions" 


      it "assumes the calling user if student_ids is not provided" 


      it "shows all possible if student_ids is ['all']" 


      it "supports the 'grouped' argument" 


      it "does not allow a student to view another student's submissions" 


      it "errors if too many students requested" 


      it "allows concluded students to view their submission" 

    end

    context "observers" do
      before :once do
        @observer = user_factory :active_all => true
        @course.enroll_user(@observer, 'ObserverEnrollment', :associated_user_id => @student1.id)
        @course.enroll_user(@observer, 'ObserverEnrollment', :allow_multiple_enrollments => true, :associated_user_id => @student2.id)
      end

      it "allows an observer to view observed students' submissions" 


      it "allows an observer to view all observed students' submissions via student_ids[]=all" 


      context "observer that is a student" do
        before :once do
          @course.enroll_student(@observer, :allow_multiple_enrollments => true).accept!
          submit_homework(@assignment1, @observer)
          @assignment1.grade_student(@observer, grade: 5, grader: @teacher)
        end

        it "allows an observer that is a student to view his own and his observees submissions" 


        it "allows an observer that is a student to view his own and his observees submissions via student_ids[]=all" 

      end

      it "allows an observer to view observed students' submissions (grouped)" 


      it "does not allow an observer to view non-observed students' submissions" 


      it "does not work with a non-active ObserverEnrollment" 

    end

    context "logged out user" do
      it "renders api unauthenticated" 

    end
  end

  describe '#update' do
    before :once do
      student_in_course(:active_all => true)
      teacher_in_course(:active_all => true)
      @assignment = @course.assignments.create!(
        title: 'assignment1',
        grading_type: 'letter_grade',
        points_possible: 15
      )
    end

    it "allows grading an uncreated submission" 


    it "doesn't allow grading a deleted submission" 


    it "can excuse assignments" 


    it "can unexcuse assignments" 


    it "can set late policy status on a submission" 


    it "can set seconds_late_override on a submission along with the late_policy_status of late" 


    it "can set seconds_late_override on a submission that has a late_policy_status of 'late'" 


    it "ignores seconds_late_override if late_policy_status is not late" 


    it "can clear late_policy_status on a submission" 


    it "creates a provisional grade and comment" 


    it "creates a provisional grade and comment when no submission exists" 


    it "returns an error trying to grade a student not enrolled in the course" 


    it "allows a LTI launch URL to be assigned" 


    it 'does not allow a submission to be overwritten if type is a non-lti type' 

  end

  it "allows posting grade by sis id" 


  it "allows commenting by a student without trying to grade" 


  it "does not allow grading by a student" 


  it "does not allow rubricking by a student" 


  context "moderated grading" do
    before :each do
      student_in_course(active_all: true)
      teacher_in_course(active_all: true)
      @assignment = @course.assignments.create!(
        title: 'assignment1',
        moderated_grading: true,
        grades_published_at: nil,
        grader_count: 2,
        final_grader: @teacher
      )
    end

    it "allows posting grades of a non moderated assignment" 


    it "allows posting grades of an assignment whose grades have been published" 


    it "does not allow posting grades of a moderated assignment whose grades have not been published" 


    it "allows posting provisional grades of a moderated assignment whose grades have not been published" 

  end

  it "does not return submissions for no-longer-enrolled students" 


  it "allows updating the grade for an existing submission" 


  it "adds hidden comments if the assignment is muted" 


  it "does not hide student comments on muted assignments" 


  it "allows submitting points" 


  it "allows submitting points above points_possible (for extra credit)" 


  it "allows submitting percent to a points assignment" 


  it "allows submitting percent" 


  it "allows submitting points to a percent assignment" 


  it "allows submitting percent above points_possible (for extra credit)" 


  it "allows submitting letter_grade as a letter score" 


  it "allows submitting letter_grade as a numeric score" 


  it "allows submitting letter_grade as a percentage score" 


  it "rejects letter grades sent to a points assignment" 


  it "allows submitting pass_fail (pass)" 


  it "allows submitting pass_fail (fail)" 


  it "allows a points score for pass_fail, at full points" 


  it "allows a points score for pass_fail, at zero points" 


  it "allows a percentage score for pass_fail, at full points" 


  it "rejects any other type of score for a pass_fail assignment" 


  it "sets complete for zero point assignments" 


  def submit_with_grade(assignment_opts, param, score, grade)
    student = user_factory(active_all: true)
    course_with_teacher(:active_all => true)
    @course.enroll_student(student).accept!
    a1 = @course.assignments.create!({:title => 'assignment1'}.merge(assignment_opts))

    json = api_call(:put,
          "/api/v1/courses/#{@course.id}/assignments/#{a1.id}/submissions/#{student.id}.json",
          { :controller => 'submissions_api', :action => 'update',
            :format => 'json', :course_id => @course.id.to_s,
            :assignment_id => a1.id.to_s, :user_id => student.id.to_s },
          { :submission => { :posted_grade => param } })

    expect(Submission.count).to eq 1
    @submission = Submission.first

    expect(json['score']).to eq score
    expect(json['grade']).to eq grade
  end

  it "allows posting a rubric assessment" 


  it "validates the rubric assessment" 


  it "allows posting a comment on a submission" 


  it "allows posting a group comment on a submission" 


  it "allows posting a media comment on a submission, given a kaltura id" 


  it "allows commenting on an uncreated submission" 


  it "allows clearing out the current grade with a blank grade" 


  it "allows repeated changes to a submission to accumulate" 


  it "does not allow accessing other sections when limited" 


  context 'map_user_ids' do
    before do
      @controller = SubmissionsApiController.new
      @controller.instance_variable_set :@domain_root_account, Account.default
    end

    it 'maps an empty list' 


    it 'maps a list of AR ids' 


    it "bails on ids it can't figure out" 


    it "filters out sis ids that don't exist, but not filter out AR ids" 


    it "finds sis ids that exist" 


    it "does not find sis ids in other accounts" 

  end

  context "create" do
    before :once do
      course_with_student(:active_all => true)
      assignment_model(:course => @course, :submission_types => "online_url", :points_possible => 12)
      @url = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions"
      @args = { :controller => "submissions", :action => "create", :format => "json", :course_id => @course.id.to_s, :assignment_id => @assignment.id.to_s }
    end

    it "rejects a submission by a non-student" 


    it "rejects a request with an invalid submission_type" 


    it "rejects a submission_type not allowed by the assignment" 


    it "rejects mismatched submission_type and params" 


    it "works with section ids" 


    describe "valid submissions" do
      def do_submit(opts)
        json = api_call(:post, @url, @args, { :submission => opts })
        expect(response['Location']).to eq "http://www.example.com/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions/#{@user.id}"
        @submission = @assignment.submissions.find_by!(user: @user)
        expect(json.slice('user_id', 'assignment_id', 'score', 'grade')).to eq({
          'user_id' => @user.id,
          'assignment_id' => @assignment.id,
          'score' => nil,
          'grade' => nil,
        })
        json
      end

      it "creates a url submission" 


      it "creates with an initial comment" 


      it "creates a online text submission" 


      it "processs html content in body" 


      it "creates a file upload submission" 


      it "creates a media comment submission" 


      it "copys files to the submissions folder if they're not there already" 

    end

    context "submission file uploads" do
      before :once do
        @assignment.update_attributes(:submission_types => 'online_upload')
        @student1 = @student
        course_with_student(:course => @course)
        @context = @course
        @student2 = @student
        @user = @student1
      end

      include_examples "file uploads api"
      include_examples "file uploads api without quotas"

      # preflight_params has to be first and nameless to keep backwards compat with the include_examples
      def preflight(preflight_params, request_params: {}, api_url: nil)
        api_url ||= "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submissions/#{@student1.id}/files"

        api_call(
          :post,
          api_url,
          {
            controller: "submissions_api",
            action: "create_file",
            format: "json",
            course_id: @course.to_param,
            assignment_id: @assignment.to_param,
            user_id: @student1.to_param,
          }.merge(request_params),
          preflight_params
        )
      end

      def has_query_exemption?
        true
      end

      it "rejects uploading files to other students' submissions" 


      it "uploads to a student's Submissions folder" 


      context 'for url upload using DelayedJob' do
        let(:json_response) do
          preflight(url: 'http://example.com/test', filename: 'test.txt')
          JSON.parse(response.body)
        end

        before { allow(InstFS).to receive(:enabled?).and_return(false) }

        it "returns progress json" 

      end

      context 'for url upload using InstFS' do
        let(:json_response) do
          preflight(url: 'http://example.com/test')
          JSON.parse(response.body)
        end

        before { allow(InstFS).to receive(:enabled?).and_return(true) }

        context 'returns an upload_url with a token' do
          let(:token) { json_response['upload_url'].match(/\?token=(.+)&?/)[1] }
          let(:jwt) { Canvas::Security.decode_jwt(token) }

          it 'encodes capture_params in the token' 


          it "returns a valid upload url" 

        end

        it "returns upload_params" 


        it 'returns progress json' 

      end

      context 'for url upload using DelayedJob' do
        let(:json_response) do
          preflight(url: 'http://example.com/test', filename: 'test.txt')
          JSON.parse(response.body)
        end

        before { allow(InstFS).to receive(:enabled?).and_return(false) }

        it 'returns progress json' 


        it 'should enqueue the submit job' 

      end
    end

    it "rejects invalid urls" 


    it "rejects attachment ids not belonging to the user" 

  end

  context "draft assignments" do
    before :once do
      course_with_teacher(:active_all => true)
      student_in_course(:active_all => true)
      @a2 = @course.assignments.create!({:title => 'assignment2'})
      @a2.workflow_state = "unpublished"
      @a2.save!
    end

    it "does not allow comments (teachers)" 


    it "does not allow comments (students)" 


    it "does not allow group comments (students)" 


    it "does not allow grading with points" 


    it "does not mark as complete for zero credit assignments" 


    # Give this a hash of items to update with the API call
    def draft_assignment_update(opts)
      raw_api_call(
              :put,
              "/api/v1/courses/#{@course.id}/assignments/#{@a2.id}/submissions/#{@student.id}",
              {
                :controller => 'submissions_api',
                :action => 'update',
                :format => 'json',
                :course_id => @course.id.to_s,
                :assignment_id => @a2.id.to_s,
                :user_id => @student.id.to_s
              },
              opts)
      assert_status(401)
    end
  end

  it "includes preview urls for attachments" 


  it "includes anonymous instructor annotation parameters in the preview urls for attachments" 


  it "includes canvadoc_document_id when specified" 


  it "includes crocodoc whitelist ids in the preview url for attachments" 



  def course_with_student_and_submitted_homework
    course_with_teacher(:active_all => true)
    @teacher = @user
    student_in_course
    @student = @user
    @user = @teacher # @user needs to be the user making the api calls later
    @assignment = @course.assignments.create!(:title => "some assignment", :submission_types => "online_url,online_upload")
    @submission = @assignment.submit_homework(@student)
  end

  it 'marks as read' 


  it 'marks as unread' 


  context 'bulk update' do
    before :each do
      @student1 = user_factory(active_all: true)
      @student2 = user_factory(active_all: true)
      course_with_teacher(:active_all => true)
      @default_section = @course.default_section
      @section = @course.course_sections.create!(:name => "section2")
      @course.enroll_user(@student1, 'StudentEnrollment', :section => @section).accept!
      @course.enroll_user(@student2, 'StudentEnrollment').accept!
      @a1 = @course.assignments.create!({:title => 'assignment1', :grading_type => 'percent', :points_possible => 10})
    end

    it "queues bulk update through courses" 


    it "finds users through sis api ids" 


    it "restricts with differentiated assignments" 


    it "queues bulk update through sections" 


    it "allows bulk grading with rubric assessments" 


    it "requires authorization" 


    it "excuses assignments" 


    it "checks user ids for sections" 


    it "maintains grade when updating comments" 


    it "nils grade when receiving empty posted_grade" 

  end

  describe "list_gradeable_students" do
    before(:once) do
      course_with_teacher :active_all => true
      ta_in_course :active_all => true
      @student1 = student_in_course(:active_all => true).user
      @student2 = student_in_course(:active_all => true).user
      @assignment = @course.assignments.build
      @assignment.moderated_grading = true
      @assignment.grader_count = 1
      @assignment.save!
      @assignment.submit_homework @student1, :body => 'EHLO'
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/gradeable_students"
      @params = { :controller => 'submissions_api', :action => 'gradeable_students',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param }
    end

    it "requires grading rights" 


    it "lists students with and without submissions" 


    it "anonymizes student ids if anonymously grading" 


    it "returns default avatars if anonymously grading" 


    it "does not return identifiable attributes if anonymously grading" 


    it "paginates" 


    describe "include[]=provisional_grades" do
      before(:once) do
        @course.root_account.enable_service(:avatars)
        @course.root_account.save!
        @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/gradeable_students?include[]=provisional_grades"
        @params = { :controller => 'submissions_api', :action => 'gradeable_students',
                    :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param,
                    :include => [ 'provisional_grades' ] }
      end

      it "is unauthorized when the user is not the assigned final grader" 


      it "is unauthorized when the user is an account admin without 'Select Final Grade for Moderation' permission" 


      it "is authorized when the user is the final grader" 


      it "is authorized when the user is an account admin with 'Select Final Grade for Moderation' permission" 


      it "includes provisional grades with selections" 


      it "anonymizes speedgrader_url if anonymously grading" 


      it "anonymizes scorer id of provisional grade if grading double blind" 

    end
  end

  describe "list_gradeable_students_for_multiple_assignments" do
    before(:once) do
      course_with_teacher :active_all => true
      ta_in_course :active_all => true
      @student1 = student_in_course(:active_all => true).user
      @student2 = student_in_course(:active_all => true).user
      @assignment1 = @course.assignments.build
      @assignment1.moderated_grading = true
      @assignment1.grader_count = 1
      @assignment1.save!
      @assignment2 = @course.assignments.build
      @assignment2.save!
      @assignment_ids = [@assignment1.id, @assignment2.id]
      @path = "/api/v1/courses/#{@course.id}/assignments/gradeable_students"
      @params = { :controller => 'submissions_api', :action => 'multiple_gradeable_students',
                  :format => 'json', :course_id => @course.to_param,
                  :assignment_ids => [@assignment1.to_param, @assignment2.to_param] }
    end

    it "requires grading rights" 


    it "lists students" 


    it "paginates" 


    it "limits access to sections user is a part of" 


    it "respects differentiated assignments" 

  end

  describe '#index' do
    context 'grouped_submissions' do
      let(:course) { course_factory }
      let(:teacher)   { user_factory(active_all: true) }
      let(:student1)  { user_factory(active_all: true) }
      let(:student2)  { user_factory(active_all: true) }
      let(:group) do
        group_category = course.group_categories.create(name: 'Engineering')
        course.groups.create(name: 'Group1', group_category: group_category)
      end
      let(:assignment) do
        course.assignments.create!(
          title: 'group assignment',
          grading_type: 'points',
          points_possible: 10,
          submission_types: 'online_text_entry',
          group_category: group.group_category
        )
      end

      let!(:enroll_teacher_and_students) do
        course.enroll_teacher(teacher).accept!
        course.enroll_student(student1, enrollment_state: 'active')
        course.enroll_student(student2, enrollment_state: 'active')
      end
      let!(:add_students_to_group) do
        group.add_user(student1)
        group.add_user(student2)
      end
      let!(:submit_homework) { assignment.submit_homework(student1, submission_type: 'online_text_entry') }

      let(:path) { "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/submissions" }
      let(:params) do
        {
          controller: 'submissions_api', action: 'index',
          format: 'json', course_id: course.id.to_s,
          assignment_id: assignment.id.to_s
        }
      end

      it 'returns two assignment and submission objects for a user group' 


      it 'returns a single assignment and submission object per user group' 


      it 'includes the group_id and group_name if include[]=group is passed' 


      context "submission of type basic_lti_launch" do
        let(:external_tool_url) { 'http://www.test.com/basic-launch' }
        let(:assignment) do
          course.assignments.create!(
            title: 'group assignment',
            grading_type: 'points',
            points_possible: 10,
            submission_types: 'basic_lti_launch',
            group_category: group.group_category
          )
        end
        let!(:submit_homework) { assignment.submit_homework(student1, submission_type: 'basic_lti_launch', url: external_tool_url) }

        it 'includes the submission launch URL' 


        it 'includes the external tool URL' 

      end

      describe 'submission_status' do
        let(:field) { 'submission_status' }

        it "does not include label" 


        it "includes label when label is passed to the include param" 


        it "defaults to unsubmitted for newly created assignment" 

      end

      describe 'grading_status' do
        let(:field) { 'grading_status' }

        it "does not include action" 


        it "includes action when action is passed to the include param" 

      end
    end
  end

  describe '#submission_summary' do
    before(:once) do
      course_with_teacher :active_all => true
      @student1 = student_in_course(:active_all => true).user
      @student2 = student_in_course(:active_all => true).user
      @student3 = student_in_course(:active_all => true).user

      @section = @course.course_sections.build(:name => 'Another Section')
      @section.save
      @section.enroll_user(@student1, 'StudentEnrollment', 'active')
      @section.enroll_user(@student2, 'StudentEnrollment', 'active')
      @section.enroll_user(@student3, 'StudentEnrollment', 'active')

      @assignment = @course.assignments.create(points_possible: 100)
      @assignment.submit_homework @student1, :body => 'EHLO'
      @assignment.submit_homework @student2, :body => 'EHLO'
      @assignment.grade_student @student1, score: 99, grader: @teacher
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/submission_summary"
      @params = { :controller => 'submissions_api', :action => 'submission_summary',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param }
    end

    it 'summarizes submissions' 


    it 'summarizes submissions with multiple submissions by the same student' 


    it 'summarizes submissions with multiple submissions by the same student but one of them graded' 


    it 'summarizes submission with multiple submission where latest submission needs grading' 


    it 'doesnt count submissions where the grade was removed as graded' 


    it 'is unauthorized as a student' 


    it 'counts excused as graded' 


    it 'counts quiz submissions in pending_review as not_graded' 


    it 'returns a 404' 


    it 'doesnt show submissions from various inactive types of enrollments' 


    context 'group assignments' do
      it 'returns the summary grouped by groups' 


      it 'does not return the summary grouped by groups if the grouped param isnt sent' 


      it 'does not return the summary grouped by groups if grade_group_students_individually is true' 


      it 'does not return the summary grouped by groups if grade_group_students_individually is true without grouped param' 


      it 'doesnt error when the assignment isnt a group assignment' 

    end
  end
end

