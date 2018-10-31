#
# Copyright (C) 2017 - present Instructure, Inc.
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

require 'spec_helper'

describe Api::V1::Submission do
  subject(:fake_controller) do
    Class.new do
      include Api::V1::Submission
      include Rails.application.routes.url_helpers

      private

      def default_url_options
        {host: :localhost}
      end
    end.new
  end

  let(:user) { User.create! }
  let(:course) { Course.create! }
  let(:assignment) { course.assignments.create! }
  let(:teacher) {
    teacher = User.create!
    course.enroll_teacher(teacher)
    teacher
  }
  let(:session) { {} }
  let(:context) { nil }
  let(:params) { { includes: [field]} }
  let(:submission) { assignment.submissions.create!(user: user) }
  let(:provisional_grade) { submission.provisional_grades.create!(scorer: teacher) }

  describe '#provisional_grade_json' do
    describe 'speedgrader_url' do
      it "links to the speed grader for a student's submission" 


      it "links to the speed grader for a student's anonymous submission when grader cannot view student names" 

    end
  end

  describe '#submission_json' do
    describe 'anonymous_id' do
      let(:field) { 'anonymous_id' }
      let(:submission) { assignment.submissions.build(user: user) }
      let(:json) do
        fake_controller.submission_json(submission, assignment, user, session, context, [field], params)
      end

      context 'when not an account user' do
        it 'does not include anonymous_id' 

      end

      context 'when an account user' do
        let(:user) do
          user = User.create!
          Account.default.account_users.create!(user: user)
          user
        end

        it 'does include anonymous_id' 

      end
    end

    describe "submission status" do
      let(:field) { 'submission_status' }
      let(:submission) { assignment.submissions.build(user: user) }
      let(:submission_status) do
        -> (submission) do
          json = fake_controller.submission_json(submission, assignment, user, session, context, [field], params)
          json.fetch(field)
        end
      end

      it "can be Resubmitted" 


      it "can be Missing" 


      it "can be Late" 


      it "can be Unsubmitted by workflow state" 


      it "is Submitted by default" 


      it "can be Submitted by workflow state" 


      it "can be Submitted by submission type" 


      it "can be Submitted by quiz" 


      describe "ordinality" do
        describe "Resubmitted before all others," do
          it "is Resubmitted when it was first Missing" 


          it "is Resubmitted when it was first Late" 


          it "is Resubmitted when it was first Submitted" 


          it "is Resubmitted when it was first Unsubmitted" 

        end

        describe "Missing before Late, Unsubmitted, and Submitted" do
          it "is Missing when it was first Late" 


          it "is Missing when it was first Submitted" 


          it "is Missing when it was first Unsubmitted" 

        end

        describe "Late before Unsubmitted, and Submitted," do
          it "is Late when it was first Submitted" 


          it "is Late when it was first Unsubmitted" 

        end

        it "is Unsubmitted when it was first submitted" 

      end
    end

    describe "grading status" do
      let(:field) { 'grading_status' }
      let(:grading_status) do
        -> (submission) do
          json = fake_controller.submission_json(submission, assignment, user, session, context, [field], params)
          json.fetch(field)
        end
      end

      it "can be Excused" 


      it "can be Needs Review" 


      it "can be Needs Grading" 


      it "can be Graded" 


      it "otherwise returns nil" 


      describe "ordinality" do
        describe "Excused before all others," do
          it "is Excused when it was first Pending Review" 


          it "is Excused when it was first Needs Grading" 


          it "is Excused when it was first graded" 


          it "is Excused when it was first nil" 

        end

        describe "Needs Review before Needs Grading, Graded, and nil," do
          it "is Needs Review when it was first Needs Grading" 


          it "is Needs Review when it was first graded" 


          it "is Needs Review when it was first nil" 

        end

        describe "Needs Grading before Graded and nil," do
          it "is Needs Grading when it was first graded" 


          it "is Needs Grading when it was first nil" 

        end

        it "is Graded when it was first nil" 

      end
    end

    describe "canvadoc url" do
      let(:course) { Course.create! }
      let(:assignment) { course.assignments.create! }
      let(:teacher) { course_with_user("TeacherEnrollment", course: course, active_all: true, name: "Teacher").user }
      let(:student) { course_with_user("StudentEnrollment", course: course, active_all: true, name: "Student").user }
      let(:attachment) { attachment_model(content_type: "application/pdf", context: student) }
      let(:submission) { assignment.submit_homework(student, submission_type: 'online_upload', attachments: [attachment]) }
      let(:json) { fake_controller.submission_json(submission, assignment, teacher, session) }

      before(:each) do
        allow(Canvadocs).to receive(:annotations_supported?).and_return(true)
        allow(Canvadocs).to receive(:enabled?).and_return(true)
        Canvadoc.create!(document_id: "abc123#{attachment.id}", attachment_id: attachment.id)
      end

      it "includes the submission id in the attachment's preview url" 

    end
  end

  describe '#submission_zip' do
    let(:attachment) { fake_controller.submission_zip(assignment) }

    it 'locks the attachment if the assignment is anonymous and muted' 


    it 'does not lock the attachment if the assignment is anonymous and unmuted' 


    it 'does not lock the attachment if the assignment is not anonymous' 

  end
end

