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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')
require_relative '../../selenium/helpers/groups_common'

describe "/submissions/show" do
  include GroupsCommon

  before :once do
    course_with_student(active_all: true)
  end

  it "should render" 


  context 'when assignment is a group assignment' do
    before :once do
      @group_category = @course.group_categories.create!(name: "Test Group Set")
      @group = @course.groups.create!(name: "a group", group_category: @group_category)
      add_user_to_group(@user, @group, true)
      @assignment = @course.assignments.create!(assignment_valid_attributes.merge(
        group_category: @group_category,
        grade_group_students_individually: true,
      ))
      @submission = @assignment.submit_homework(@user)
    end

    before :each do
      view_context
      assign(:assignment, @assignment)
      assign(:submission, @submission)
    end

    it 'shows radio buttons for an individually graded group assignment' 


    it 'renders hidden checkbox for a group graded group assignment' 

  end

  context 'when assignment has deducted points' do
    it 'shows the deduction and "grade" as final grade when current_user is teacher' 


    it 'shows the deduction and "published_grade" as final grade when current_user is submission user' 


    context 'and is excused' do
      it 'hides the deduction' 

    end
  end

  describe "plagiarism report" do
    let(:teacher) do
      user = User.create
      @course.enroll_teacher(user)
      user
    end

    let(:html) do
      render "submissions/show"
      Nokogiri::HTML.fragment(response.body)
    end

    before :once do
      @assignment = @course.assignments.create!(
        assignment_valid_attributes.merge(submission_types: "online_upload,online_text_entry")
      )

      @submission = @assignment.submit_homework(@user, {body: "hello there", submission_type: 'online_text_entry'})
      @submission.turnitin_data = {
        "submission_#{@submission.id}" => {
          web_overlap: 92,
          error: true,
          publication_overlap: 0,
          state: "failure",
          object_id: "123456789",
          student_overlap: 90,
          similarity_score: 92
        }
      }
    end

    before :each do
      view_context(@course, teacher)
      assign(:assignment, @assignment)
      assign(:submission, @submission)
    end

    context "for turnitin" do
      it "is present when the plagiarism report is from turnitin" 


      it "is present when the plagiarism report is blank (defaults to turnitin)" 


      it "is not present when the plagiarism report is from vericite" 

    end

    context "for vericite" do
      before :each do
        @submission.turnitin_data[:provider] = 'vericite'
      end

      it "is present when the plagiarism report is from vericite" 


      it "is not present when the plagiarism report is from turnitin" 


      it "is not present when the plagiarism report is blank (defaults to turnitin)" 

    end
  end

  context 'comments sidebar' do
    before :each do
      course_with_teacher
      assignment_model(course: @course)
      @submission = @assignment.submit_homework(@user)
      view_context(@course, @teacher)
      assign(:assignment, @assignment)
      assign(:submission, @submission)
    end

    it "renders if assignment is not muted" 


    it "renders if assignment is muted but not anonymous or moderated" 


    describe 'non-owner comment visibility' do
      let(:student) { User.create! }
      let(:teacher) { User.create! }
      let(:course) { Course.create!(name: 'a course') }

      let(:muted_assignment) { course.assignments.create!(title: 'muted', muted: true) }
      let(:muted_submission) { muted_assignment.submission_for_student(student) }
      let(:unmuted_assignment) { course.assignments.create!(title: 'not muted') }
      let(:unmuted_submission) { unmuted_assignment.submission_for_student(student) }

      let(:comment_contents) do
        html = Nokogiri::HTML.fragment(response.body)
        comment_list = html.css('.submission-details-comments .comment_list')

        # Comments are structured as:
        # <div class="comment">
        #   <div class="comment">the actual comment text</div>
        #   <div class="author">author name</div>
        #   ... and so on
        # </div>
        comment_list.css('.comment .comment').map { |comment| comment.text.strip }
      end

      before(:each) do
        assign(:context, course)

        course.enroll_teacher(teacher).accept(true)
        course.enroll_student(student).accept(true)

        muted_submission.add_comment(author: student, comment: 'I did a great job!')
        muted_submission.add_comment(author: teacher, comment: 'No, you did not', hidden: true)

        unmuted_submission.add_comment(author: student, comment: 'I did a great job!')
        unmuted_submission.add_comment(author: teacher, comment: 'No, you did not')
      end

      it 'shows all comments when a teacher is viewing' 


      context 'when a student is viewing' do
        before(:each) do
          assign(:current_user, student)
        end

        it 'shows all comments if the assignment is not muted' 


        it 'shows only non-hidden comments if the assignment is muted' 


        context "for a moderated assignment" do
          let(:moderated_assignment) do
            course.assignments.create!(
              name: "moderated",
              moderated_grading: true,
              final_grader: teacher,
              grader_count: 2
            )
          end
          let(:moderated_submission) { moderated_assignment.submission_for_student(student) }
          let(:first_ta) { course_with_user("TaEnrollment", course: course, active_all: true).user }
          let(:second_ta) { course_with_user("TaEnrollment", course: course, active_all: true).user }

          before(:each) do
            moderated_submission.add_comment(author: student, comment: "I did a great job!")
            moderated_submission.add_comment(author: teacher, comment: "No, you did not.")
            moderated_submission.add_comment(author: first_ta, comment: "Maybe they did?")
            moderated_submission.add_comment(author: second_ta, comment: "Who cares?")
            moderated_assignment.grade_student(student, grade: 1, grader: second_ta, provisional: true)
            assign(:assignment, moderated_assignment)
            assign(:submission, moderated_submission)
          end

          it "shows only the student's comments while muted" 


          it "shows the student's, chosen grader's, and final grader's comments when unmuted" 

        end
      end
    end
  end

  context 'when assignment has a rubric' do
    before :once do
      assignment_model(course: @course)
      rubric_association_model association_object: @assignment, purpose: 'grading'
      @submission = @assignment.submit_homework(@user)
    end

    context 'when current_user is submission user' do
      it 'does not add assessing class to rendered rubric_container' 

    end

    context 'when current_user is teacher' do
      it 'adds assessing class to rubric_container' 

    end

    context 'when current_user is an observer' do
      before :once do
        course_with_observer(course: @course)
      end

      it 'does not add assessing class to the rendered rubric_container' 

    end

    context 'when current user is assessing student submission' do
      before :once do
        student_in_course(active_all: true)
        @course.workflow_state = 'available'
        @course.save!
        @assessment_request = @submission.assessment_requests.create!(
          assessor: @student,
          assessor_asset: @submission,
          user: @submission.user
        )
      end

      it 'shows the "Show Rubric" link after request is complete' 


      it 'adds assessing class to rubric_container' 

    end
  end

  describe "media comments" do
    let_once(:assignment) { @course.assignments.create! }
    let_once(:student) { course_with_user("StudentEnrollment", course: @course, name: "Stu", active_all: true).user }
    let_once(:sub) { assignment.submit_homework(student, body: "i did a thing") }
    let_once(:teacher) { course_with_user("TeacherEnrollment", course: @course, name: "Tom", active_all: true).user }

    before(:once) do
      @comment = sub.add_comment(author: teacher, comment: "comment", media_comment_id: 1, media_comment_type: "video")
    end

    before(:each) do
      assign(:assignment, assignment)
      assign(:context, @course)
      assign(:current_user, teacher)
      assign(:submission, sub)
    end

    it "passes comment author for the thumbnail" 


    it "passes comment creation time for the thumbnail" 

  end
end

