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

require_relative '../spec_helper'

describe SubmissionsController do
  it_behaves_like 'a submission update action', :submissions

  describe "POST create" do
    it "should require authorization" 


    it "should allow submitting homework" 


    it 'should only emit one live event' 


    it "should not double-send notifications to a teacher" 


    it "should allow submitting homework as attachments" 


    shared_examples "accepts 'eula_agreement_timestamp' params and persists it in the 'turnitin_data'" do
      let(:submission_type) { raise 'set in example' }
      let(:extra_params) { raise 'set in example' }
      let(:timestamp) { Time.now.to_i }

      it "accepts 'eula_agreement_timestamp' params and persists it in the 'turnitin_data'" 

    end

    context 'online upload' do
      it_behaves_like "accepts 'eula_agreement_timestamp' params and persists it in the 'turnitin_data'" do
        let(:submission_type) { 'online_upload' }
        let(:extra_params) do
          {
            :attachments => {
              "0" => { :uploaded_data => "" },
              "-1" => { :uploaded_data => "" }
            }
          }
        end
      end
    end

    context 'online text entry' do
      it_behaves_like "accepts 'eula_agreement_timestamp' params and persists it in the 'turnitin_data'" do
        let(:submission_type) { 'online_text_entry' }
        let(:extra_params) do
          {
            :submission => {
              submission_type: submission_type,
              eula_agreement_timestamp: timestamp,
              body: 'body text'
            }
          }
        end
      end
    end

    it "should copy attachments to the submissions folder if that feature is enabled" 


    it "should reject illegal file extensions from submission" 


    it "should use the appropriate group based on the assignment's category and the current user" 


    it "should not use a group if the assignment has no category" 


    it "should allow attaching multiple files to the submission" 


    it "should fail but not raise when the submission is invalid" 


    it "should strip leading/trailing whitespace off url submissions" 


    it 'must accept a basic_lti_launch url when any online submission type is allowed' 


    it 'accepts eula agreement timestamp when api submission' 


    it "should redirect to the assignment when locked in submit-at-deadline situation" 


    describe 'when submitting a text response for the answer' do
      let(:assignment) { @course.assignments.create!(:title => "some assignment", :submission_types => "online_text_entry") }
      let(:submission_params) { {:submission_type => "online_text_entry", :body => "My Answer"} }

      before do
        Setting.set('enable_page_views', 'db')
        course_with_student_logged_in :active_all => true
        @course.account.enable_service(:avatars)
        post 'create', params: {:course_id => @course.id, :assignment_id => assignment.id, :submission => submission_params}
      end

      after do
        Setting.set('enable_page_views', 'false')
      end

      it 'should redirect me to the course assignment' 


      it 'saves a submission object' 


      it 'logs an asset access for the assignment' 


      it 'registers a page view' 


    end

    it 'rejects an empty text response' 


    context "group comments" do
      before do
        course_with_student_logged_in(:active_all => true)
        @course.account.enable_service(:avatars)
        @u1 = @user
        student_in_course(:course => @course)
        @u2 = @user
        @assignment = @course.assignments.create!(
          title: "some assignment",
          submission_types: "online_text_entry",
          group_category: GroupCategory.create!(:name => "groups", :context => @course),
          grade_group_students_individually: false
        )
        @group = @assignment.group_category.groups.create!(:name => 'g1', :context => @course)
        @group.users << @u1
        @group.users << @user
      end

      it "should not send a comment to the entire group by default" 


      it "should not send a comment to the entire group when false" 


      it "should send a comment to the entire group if requested" 


      it "succeeds when commenting to the group from a student using PUT" 

    end

    context "google doc" do
      before(:each) do
        course_with_student_logged_in(active_all: true)
        @course.account.enable_service(:avatars)
        @assignment = @course.assignments.create!(title: 'some assignment', submission_types: 'online_upload')
      end

      it "should not save if domain restriction prevents it" 


      it "should use instfs to save google doc if instfs is enabled" 

    end
  end

  describe "GET zip" do
    it "should zip and download" 

  end

  describe "GET show" do
    before do
      course_with_student_and_submitted_homework
      @course.account.enable_service(:avatars)
      @context = @course
      @submission.update!(score: 10)
    end

    let(:body) { JSON.parse(response.body)['submission'] }

    it "redirects to login when logged out" 


    it "renders show template" 


    it "renders json with scores for teachers" 


    it "renders json with scores for students" 


    it "mark read if reading one's own submission" 


    it "don't mark read if reading someone else's submission" 


    it "renders json with scores for teachers on muted assignments" 


    it "renders json without scores for students on muted assignments" 


    it "renders the page for submitting student" 


    it "renders unauthorized for non-submitting student" 


    it "renders unauthorized for teacher" 


    it "renders unauthorized for admin" 


    it "renders the page for site admin" 


    context "with user id not present in course" do
      before(:once) do
        course_with_student(active_all: true)
        @course.account.enable_service(:avatars)
      end

      it "sets flash error" 


      it "should redirect to context assignment url" 

    end

    it "should show rubric assessments to peer reviewers" 

  end

 context 'originality report' do
  let(:test_course) do
    test_course = course_factory(active_course: true)
    test_course.account.enable_service(:avatars)
    test_course.enroll_teacher(test_teacher, enrollment_state: 'active')
    test_course.enroll_student(test_student, enrollment_state: 'active')
    test_course
  end

  let(:test_teacher) { User.create }
  let(:test_student) { User.create }
  let(:assignment) { Assignment.create!(title: 'test assignment', context: test_course) }
  let(:attachment) { attachment_model(filename: "submission.doc", context: test_student) }
  let(:submission) { assignment.submit_homework(test_student, attachments: [attachment]) }
  let!(:originality_report) do
    OriginalityReport.create!(attachment: attachment,
                              submission: submission,
                              originality_score: 0.5,
                              originality_report_url: 'http://www.instructure.com')
  end


  before :each do
    user_session(test_teacher)
  end


  describe 'GET originality_report' do
    it 'redirects to the originality report URL if it exists' 


    it 'returns 400 if submission_id is not integer' 


    it "returns unauthorized for users who can't read submission" 


    it 'gives error if no url is present for the OriginalityReport' 

  end

  describe 'POST resubmit_to_turnitin' do
    it 'returns 400 if assignment_id is not integer' 


    it "emits a 'plagiarism_resubmit' live event if originality report exists" 


    it "emits a 'plagiarism_resubmit' live event if originality report does not exists" 

  end

  it "redirects to speed grader when an anonymous submission id is used" 


  describe 'POST resubmit_to_vericite' do
    it "emits a 'plagiarism_resubmit' live event" 

  end
 end

  describe 'GET turnitin_report' do
    it 'returns 400 if submission_id is not integer' 

  end

  describe "GET audit_events" do
    before(:once) do
      @course = Course.create!
      @course.account.enable_service(:avatars)
      first_student = course_with_user("StudentEnrollment", course: @course, name: "First", active_all: true).user
      second_student = course_with_user("StudentEnrollment", course: @course, name: "Second", active_all: true).user
      @teacher = course_with_user("TeacherEnrollment", course: @course, name: "Teacher", active_all: true).user
      @assignment = @course.assignments.create!(name: "anonymous", anonymous_grading: true, updating_user: @teacher)
      @submission = @assignment.submissions.find_by!(user: first_student)
      @submission.submission_comments.create!(author: first_student, comment: "Student comment")
      @submission.submission_comments.create!(author: @teacher, comment: "Teacher comment")
      @unrelated_submission = @assignment.submissions.find_by!(user: second_student)
      @teacher.account.role_overrides.create!(permission: :view_audit_trail, role: teacher_role, enabled: true)
    end

    before(:each) do
      user_session(@teacher)
    end

    let(:params) do
      {
        assignment_id: @assignment.id,
        course_id: @course.id,
        submission_id: @submission.id
      }
    end

    it "renders unauthorized if user does not have view_audit_trail permission" 


    it "renders ok if user does have view_audit_trail permission" 


    it "returns only related audit events" 


    it "returns the assignment audit events" 


    it "returns the submission audit events" 


    it "returns the audit events in order of created at" 

  end

  describe "copy_attachments_to_submissions_folder" do
    before(:once) do
      course_with_student
      @course.account.enable_service(:avatars)
      attachment_model(context: @student)
    end

    it "copies a user attachment into the user's submissions folder" 


    it "leaves files already in submissions folders alone" 


    it "copies a group attachment into the group submission folder" 


    it "leaves files in non user/group context alone" 

  end
end

