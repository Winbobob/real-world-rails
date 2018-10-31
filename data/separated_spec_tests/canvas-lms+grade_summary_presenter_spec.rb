#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe GradeSummaryPresenter do
  describe '#courses_with_grades' do

    describe 'all on one shard' do
      let(:course) { Course.create! }
      let(:presenter) { GradeSummaryPresenter.new(course, @user, nil) }
      let(:assignment) { assignment_model(:course => course) }
      let(:enrollment) { course.enroll_student(@user, enrollment_state: 'active') }

      before :each do
        user_factory
        enrollment
        course.offer
      end

      it 'preloads the enrollment term for each course' 


      it 'preloads the legacy grading period groups for each course' 


      it 'includes courses where the user is enrolled' 


      it "includes concluded courses" 


      it "includes courses for concluded enrollments" 


      it "excludes soft-concluded courses where students are restricted after conclusion" 

    end

    describe 'across shards' do
      specs_require_sharding

      it 'can find courses when the user and course are on the same shard' 


      it 'can find courses when the user and course are on different shards' 


      describe 'courses for an observer across shards' do
        before :each do
          course_with_student(:active_all => true)
          @observer = user_factory(:active_all => true)
          @course.observer_enrollments.create!(:user_id => @observer, :associated_user_id => @student)

          @shard1.activate do
            account = Account.create!
            @course2 = account.courses.create!(:workflow_state => "available")
            StudentEnrollment.create!(:course => @course2, :user => @student, :workflow_state => 'active')
            @course2.observer_enrollments.create!(:user_id => @observer, :associated_user_id => @student)
          end

          @presenter = GradeSummaryPresenter.new(@course, @observer, @student.id)
        end

        it 'can find courses for an observer across shards' 


        it 'preloads the enrollment term for each course' 


        it 'preloads the legacy grading period groups for each course' 

      end
    end
  end

  describe '#students' do
    before(:once) do
      @course = Course.create!
      @student = User.create!
      @teacher = User.create!
      @course.enroll_teacher(@teacher, active_all: true)
      @course.enroll_student(@student, active_all: true)
    end

    it 'returns all of the observed students, if there are multiple' 


    it 'returns an array with a single student if there is only one student' 


    it 'returns an empty array if there are no students' 

  end

  describe '#assignment_stats' do
    before(:each) do
      teacher_in_course
    end

    it 'works' 


    it 'filters out test students and inactive enrollments' 


    it 'doesnt factor nil grades into the average or min' 


    it 'returns a count of submissions ignoring test students and inactive enrollments' 

  end

  describe '#submissions' do
    before(:once) do
      teacher_in_course
      student_in_course
    end

    it "doesn't return submissions for deleted assignments" 


    it "doesn't error on submissions for assignments not in the pre-loaded assignment list" 

  end

  describe '#assignments' do
    before(:once) do
      teacher_in_course
      student_in_course
    end

    let!(:published_assignment) { @course.assignments.create! }

    it "filters unpublished assignments" 


    it "filters wiki_page assignments" 

  end

  describe '#sort_options' do
    before(:once) do
      teacher_in_course
      student_in_course
    end

    let(:presenter) { GradeSummaryPresenter.new(@course, @teacher, @student.id) }
    let(:assignment_group_option) { ["Assignment Group", "assignment_group"] }
    let(:module_option) { ["Module", "module"] }

    it "returns the default sort options" 


    it "does not return 'Assignment Group' as an option if the course has no assignments" 


    it "does not return 'Assignment Group' as an option if all of the " \
    "assignments belong to the same assignment group" do
      @course.assignments.create!(title: "Math Assignment")
      @course.assignments.create!(title: "Science Assignment")
      expect(presenter.sort_options).to_not include assignment_group_option
    end

    it "returns 'Assignment Group' as an option if there are " \
    "assignments that belong to different assignment groups" do
      @course.assignments.create!(title: "Math Assignment")
      science_group = @course.assignment_groups.create!(name: "Science Assignments")
      @course.assignments.create!(title: "Science Assignment", assignment_group: science_group)
      expect(presenter.sort_options).to include assignment_group_option
    end

    it "does not return 'Module' as an option if the course does not have any modules" 


    it "returns 'Module' as an option if the course has any modules" 


    it 'localizes menu text' 


    it 'sorts menu items in a locale-aware way' 

  end

  describe '#sorted_assignments' do
    before(:once) do
      teacher_in_course
      student_in_course
    end

    let!(:assignment1) { @course.assignments.create!(title: 'Jalapeno', due_at: 2.days.ago, position: 1) }
    let!(:assignment2) { @course.assignments.create!(title: 'Jalapeño', due_at: 2.days.from_now, position: 2) }
    let!(:assignment3) { @course.assignments.create!(title: 'Jalapezo', due_at: 5.days.ago, position: 3) }
    let(:ordered_assignment_ids) { presenter.assignments.map(&:id) }

    it "assignment order defaults to due_at" 


    context "assignment order: due_at" do
      let(:presenter) { GradeSummaryPresenter.new(@course, @teacher, @student.id, assignment_order: :due_at) }

      it "sorts by due_at" 


      it "sorts assignments without due_ats after assignments with due_ats" 


      it "sorts by assignment title if due_ats are equal" 


      it "ignores case when comparing assignment titles" 

    end

    context "assignment order: title" do
      let(:presenter) { GradeSummaryPresenter.new(@course, @teacher, @student.id, assignment_order: :title) }

      it "sorts by title" 


      it "ignores case when sorting by title" 

    end

    context "assignment order: module" do
      let(:presenter) { GradeSummaryPresenter.new(@course, @teacher, @student.id, assignment_order: :module) }
      let!(:first_context_module) { @course.context_modules.create! }
      let!(:second_context_module) { @course.context_modules.create! }

      context "assignments not in modules" do
        it "sorts alphabetically for assignments not belonging to modules (ignoring case)" 

      end

      context "assignments in modules" do
        let!(:assignment1_tag) do
          a1_tag = assignment1.context_module_tags.new(context: @course, position: 1, tag_type: 'context_module')
          a1_tag.context_module = second_context_module
          a1_tag.save!
        end

        let!(:assignment2_tag) do
          a2_tag = assignment2.context_module_tags.new(context: @course, position: 3, tag_type: 'context_module')
          a2_tag.context_module = first_context_module
          a2_tag.save!
        end

        let!(:assignment3_tag) do
          a3_tag = assignment3.context_module_tags.new(context: @course, position: 2, tag_type: 'context_module')
          a3_tag.context_module = first_context_module
          a3_tag.save!
        end

        context "sorting assignments only (no quizzes or discussions)" do
          it "sorts by module position, then context module tag position" 


          it "sorts by module position, then context module tag position, " \
          "with those not belonging to a module sorted last" do
            assignment3.context_module_tags.first.destroy!
            expected_id_order = [assignment2.id, assignment1.id, assignment3.id]
            expect(ordered_assignment_ids).to eq(expected_id_order)
          end
        end

        context "sorting quizzes and discussions" do
          let(:assignment_owning_quiz) do
            assignment = @course.assignments.create!
            quiz = quiz_model(course: @course, assignment_id: assignment.id)
            quiz_context_module_tag =
              quiz.context_module_tags.build(context: @course, position: 4, tag_type: 'context_module')
            quiz_context_module_tag.context_module = first_context_module
            quiz_context_module_tag.save!
            assignment
          end

          let(:assignment_owning_discussion_topic) do
            assignment = @course.assignments.create!(submission_types: "discussion_topic")
            discussion = @course.discussion_topics.create!
            assignment.discussion_topic = discussion
            assignment.save!
            discussion_context_module_tag =
              discussion.context_module_tags.build(context: @course, position: 5, tag_type: 'context_module')
            discussion_context_module_tag.context_module = first_context_module
            discussion_context_module_tag.save!
            assignment
          end

          it "handles comparing quizzes to assignments" 


          it "handles comparing discussions to assignments" 


          it "handles comparing discussions, quizzes, and assignments to each other" 

        end
      end
    end

    context "assignment order: assignment_group" do
      let(:presenter) do
        GradeSummaryPresenter.new(@course, @teacher, @student.id, assignment_order: :assignment_group)
      end

      it "sorts by assignment group position then assignment position" 

    end
  end

  describe "#student_enrollment_for" do
    let(:gspcourse) do
      course_factory
    end

    let(:teacher) do
      teacher_in_course({course: gspcourse}).user
    end

    let(:inactive_student_enrollment) do
      enrollment = course_with_user('StudentEnrollment', {course: gspcourse})
      enrollment.workflow_state = 'inactive'
      enrollment.save!
      enrollment
    end

    let(:inactive_student) do
      inactive_student_enrollment.user
    end

    let(:other_student_enrollment) do
      course_with_user('StudentEnrollment', {course: gspcourse})
    end

    let(:other_student) do
      other_student_enrollment.user
    end

    it "includes active enrollments" 


    it "doesn't include inactive enrollments" 


    it "includes inactive enrollments if you can read grades" 

  end
end

