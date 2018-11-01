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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RubricAssessmentsController do
  describe "POST 'create'" do
    it "should require authorization" 

    it "should assign variables" 


    it "should not pass invalid ids through to the database" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 


    it "should assign variables" 


    context 'setting a provisional grade to be final' do
      before(:once) do
        @course = Course.create!
        @teacher = User.create!
        other_teacher = User.create!
        student = User.create!
        @course.enroll_teacher(@teacher, enrollment_state: 'active')
        @course.enroll_teacher(other_teacher, enrollment_state: 'active')
        @course.enroll_student(student, enrollment_state: 'active')
        rubric = Rubric.create!(
          context: @course,
          data: [
            {
              description: 'Some criterion',
              points: 10,
              id: 'crit1',
              ratings: [
                { description: 'Good', points: 10, id: 'rat1', criterion_id: 'crit1' },
                { description: 'Medium', points: 5, id: 'rat2', criterion_id: 'crit1' },
                { description: 'Bad', points: 0, id: 'rat3', criterion_id: 'crit1' }
              ]
            }
          ]
        )
        assignment = @course.assignments.create!(moderated_grading: true, grader_count: 2, final_grader: @teacher)
        association_params = {
          hide_score_total: '0',
          purpose: 'grading',
          skip_updating_points_possible: false,
          update_if_existing: true,
          use_for_grading: '1',
          association_object: assignment
        }
        @rubric_association = RubricAssociation.generate(@teacher, rubric, @course, association_params)
        submission = assignment.submissions.find_by(user: student)
        submission.find_or_create_provisional_grade!(other_teacher)
        @assessment = @rubric_association.assess({
          user: student,
          assessor: @teacher,
          artifact: submission,
          assessment: { assessment_type: 'grading', criterion_crit1: { points: 5 } }
        })
      end

      let(:update_params) do
        {
          course_id: @course.id.to_s,
          final: true,
          id: @assessment.id.to_s,
          provisional: true,
          rubric_assessment: { user_id: @teacher.to_param, assessment_type: 'grading' },
          rubric_association_id: @rubric_association.id.to_s
        }
      end

      let(:provisonal_grade) do
        provisional_grade_id = json_parse(response.body).dig('artifact', 'provisional_grade_id')
        ModeratedGrading::ProvisionalGrade.find(provisional_grade_id)
      end

      it 'allows setting the provisional grade to final if the user is the final grader' 


      it 'allows setting the provisional grade to final if the user an admin who can select final grade' 


      it 'does not allow setting the provisional grade to final if the user an admin who cannot select final grade' 

    end

    context 'when assessing a moderated assignment as a provisional grader' do
      let(:course) { Course.create! }
      let(:assignment) do
        course.assignments.create!(
          moderated_grading: true,
          final_grader: teacher,
          grader_count: 1
        )
      end

      let(:teacher) { User.create! }
      let(:provisional_grader) { User.create! }
      let(:interloper) { User.create! }
      let(:student) { User.create! }

      let(:rubric) do
        Rubric.create!(
          context: course,
          data: [
            {
              description: 'Some criterion',
              points: 10,
              id: 'crit1',
              ratings: [
                { description: 'Good', points: 10, id: 'rat1', criterion_id: 'crit1' },
                { description: 'Bad', points: 0, id: 'rat2', criterion_id: 'crit1' }
              ]
            }
          ]
        )
      end

      let(:rubric_association) do
        association_params = {association_object: assignment, use_for_grading: '1', purpose: 'grading'}
        RubricAssociation.generate(teacher, rubric, course, association_params)
      end
      let(:slotted_grader_ids) { assignment.moderation_graders.with_slot_taken.pluck(:user_id) }

      def update_params(assessor:, assessment_type: 'grading')
        {
          course_id: course.id.to_s,
          id: '',
          provisional: true,
          rubric_assessment: { user_id: assessor.id.to_s, assessment_type: assessment_type },
          rubric_association_id: rubric_association.id.to_s
        }
      end

      before(:each) do
        course.enroll_teacher(teacher, enrollment_state: 'active')
        course.enroll_ta(provisional_grader, enrollment_state: 'active')
        course.enroll_ta(interloper, enrollment_state: 'active')
        course.enroll_student(student, enrollment_state: 'active')
      end

      context 'when submitting a grading assessment' do
        it 'claims a moderated grading slot for the submitter' 


        it 'does not occupy a slot if no slots are available' 


        it 'returns a MAX_GRADERS_REACHED error code if no slots are available' 

      end

      describe 'returned JSON' do
        before(:each) do
          assignment.moderation_graders.create!(user: provisional_grader, anonymous_id: 'noooo')
        end

        it 'includes the anonymous assessor ID if the caller cannot view grader names' 


        it 'omits the anonymous assessor ID if the caller can view grader names' 

      end
    end

    context 'when submitting an assessment for a non-assignment' do
      let(:course) { Course.create! }
      let(:teacher) { User.create! }

      let(:rubric) do
        Rubric.create!(
          context: course,
          data: [
            {
              description: 'Some criterion',
              points: 10,
              id: 'crit1',
              ratings: [
                { description: 'Good', points: 10, id: 'rat1', criterion_id: 'crit1' },
                { description: 'Bad', points: 0, id: 'rat2', criterion_id: 'crit1' }
              ]
            }
          ]
        )
      end

      let(:rubric_association) do
        association_params = {association_object: course, use_for_grading: '1', purpose: 'grading'}
        RubricAssociation.generate(teacher, rubric, course, association_params)
      end

      # This test is meant to provide some sort of blanket coverage for what
      # happens when we call the endpoint with a non-assignment association
      # object; namely, it crashes (and doesn't handle the error) because it
      # tries to call a method that only exists on Assignment.
      it 'fails with an unhandled error' 

    end
  end

  describe "POST 'remind'" do
    before do
      course_with_teacher(:active_all => true)
      rubric_association_model(:user => @user, :context => @course)
      assessor = User.create!
      @course.enroll_student(assessor)
      assessor_asset = @rubric_association.association_object.find_or_create_submission(assessor)
      user_asset = @rubric_association.association_object.find_or_create_submission(assessor)
      @assessment_request = @rubric_association.assessment_requests.create!(user: @user, asset: user_asset, assessor: assessor, assessor_asset: assessor_asset)
    end

    it "should require authorization" 

    it "should send reminder" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 

    it "should delete the assessment" 

  end

  describe "Assignment assessments" do
    it "should follow: actions from two teachers should only create one assessment" 


    it "should follow: multiple peer reviews for the same submission should work fine" 


    it "should follow: multiple peer reviews for the same submission should work fine, even with a teacher assessment in play" 


    it "should not allow assessing fellow students for a submission" 

  end

  describe 'user ID handling' do
    before(:each) do
      setup_course_assessment
      @assignment.find_or_create_submission(@student1).update!(anonymous_id: 'abcde')
    end

    let(:base_request_params) { { course_id: @course.id, rubric_association_id: @rubric_association.id } }

    context 'when updating an existing assessment' do
      it 'looks up the assessment by the passed-in ID' 

    end

    context 'when creating a new assessment' do
      it 'accepts user IDs in the user_id field' 


      it 'does not accept non-numerical IDs in the user_id field' 

    end

    context 'for anonymous IDs' do
      it 'accepts anonymous IDs matching a submission for the assignment' 


      it 'does not recognize anonymous IDs that do not match a submission for the assignment' 


      it 'does not recognize user IDs in the anonymous_id field' 

    end
  end

  def setup_course_assessment
    course_with_teacher_logged_in(:active_all => true)
    @student1 = factory_with_protected_attributes(User, :name => "student 1", :workflow_state => "registered")
    @student2 = factory_with_protected_attributes(User, :name => "student 2", :workflow_state => "registered")
    @student3 = factory_with_protected_attributes(User, :name => "student 3", :workflow_state => "registered")
    @teacher2 = factory_with_protected_attributes(User, :name => "teacher 2", :workflow_state => "registered")
    @course.enroll_student(@student1).accept!
    @course.enroll_student(@student2).accept!
    @course.enroll_student(@student3).accept!
    @course.enroll_teacher(@teacher2).accept!
    @assignment = @course.assignments.create!(:title => "Some Assignment")
    rubric_assessment_model(:user => @user, :context => @course, :association_object => @assignment, :purpose => 'grading')
    student1_asset = @assignment.find_or_create_submission(@student1)
    student2_asset = @assignment.find_or_create_submission(@student2)
    student3_asset = @assignment.find_or_create_submission(@student3)
    @rubric_association.assessment_requests.create!(user: @student1, asset: student1_asset, assessor: @student2, assessor_asset: student2_asset)
    @rubric_association.assessment_requests.create!(user: @student1, asset: student1_asset, assessor: @student3, assessor_asset: student3_asset)
  end
end

