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

describe 'Provisional Grades API', type: :request do
  it_behaves_like 'a provisional grades status action', :provisional_grades

  describe "bulk_select" do
    let_once(:course) do
      course = course_factory
      course.account.enable_service(:avatars)
      course
    end

    let_once(:teacher) { teacher_in_course(active_all: true, course: course).user }
    let_once(:ta_1) { ta_in_course(active_all: true, course: course).user }
    let_once(:ta_2) { ta_in_course(active_all: true, course: course).user }
    let_once(:students) { 3.times.map {|n| student_in_course(active_all: true, course: course, name: "Student #{n}").user } }

    let_once(:assignment) do
      course.assignments.create!(
        final_grader_id: teacher.id,
        grader_count: 2,
        moderated_grading: true,
        points_possible: 10
      )
    end

    let_once(:submissions) { students.map {|student| student.submissions.first} }
    let_once(:grades) do
      [
        grade_student(assignment, students[0], ta_1, 5),
        grade_student(assignment, students[1], ta_1, 6),
        grade_student(assignment, students[1], ta_2, 7),
        grade_student(assignment, students[2], ta_2, 8)
      ]
    end

    def grade_student(assignment, student, grader, score)
      graded_submissions = assignment.grade_student(student, grader: grader, score: score, provisional: true)
      graded_submissions.first.provisional_grade(grader)
    end

    def bulk_select(provisional_grades, user = teacher)
      path = "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/provisional_grades/bulk_select"
      params = {
        action: 'bulk_select',
        assignment_id: assignment.to_param,
        controller: 'provisional_grades',
        course_id: course.to_param,
        format: 'json',
        provisional_grade_ids: provisional_grades.map(&:id)
      }
      api_call_as_user(user, :put, path, params)
    end

    def selected_grades
      assignment.moderated_grading_selections.map(&:provisional_grade).compact
    end

    it "selects multiple provisional grades" 


    it "selects provisional grades for different graders" 


    it "creates a moderation event for each selection made" 


    it "selects the later grade when given multiple provisional grade ids for the same student" 


    it "returns json including the id of each selected provisional grade" 


    it "touches submissions related to the selected provisional grades" 


    it "does not touch submissions not related to the selected provisional grades" 


    it "excludes the anonymous ids for submissions when the user can view student identities" 


    it "includes the anonymous ids for submissions when the user cannot view student identities" 


    it "excludes the student ids for submissions when the user cannot view student identities" 


    context "when given a provisional grade id for an already-selected provisional grade" do
      before(:once) do
        selection = assignment.moderated_grading_selections.find_by!(student_id: students[0].id)
        selection.selected_provisional_grade_id = grades[0].id
        selection.save!
      end

      it "excludes the already-selected provisional grade from the returned json" 


      it "does not touch the submission for the already-selected provisional grade" 

    end

    context "when given a provisional grade id for a different assignment" do
      let_once(:other_assignment) do
        course.assignments.create!(
          final_grader_id: teacher.id,
          grader_count: 2,
          moderated_grading: true,
          points_possible: 10
        )
      end
      let_once(:other_grade) { grade_student(other_assignment, students[0], ta_1, 10) }

      it "does not select the unrelated provisional grade" 


      it "excludes the unrelated provisional grade from the returned json" 

    end

    it "ignores ids not associated with a provisional grade" 


    it 'is unauthorized when the user is not the assigned final grader' 


    it 'is unauthorized when the user is an account admin without "Select Final Grade for Moderation" permission' 


    it 'is authorized when the user is the final grader' 


    it 'is authorized when the user is an account admin with "Select Final Grade for Moderation" permission' 

  end

  describe "select" do
    before(:once) do
      course_with_student :active_all => true
      @course.account.enable_service(:avatars)
      ta_in_course :active_all => true
      @assignment = @course.assignments.build
      @assignment.grader_count = 1
      @assignment.moderated_grading = true
      @assignment.final_grader_id = @teacher.id
      @assignment.save!
      subs = @assignment.grade_student @student, :grader => @ta, :score => 0, :provisional => true
      @pg = subs.first.provisional_grade(@ta)
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/provisional_grades/#{@pg.id}/select"
      @params = { :controller => 'provisional_grades', :action => 'select',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param,
                  :provisional_grade_id => @pg.to_param }
    end

    it "should fail if the student isn't in the moderation set" 


    it "should select a provisional grade" 


    it "creates a moderation event for the selection" 


    it "should use anonymous_id instead of student_id if user cannot view student names" 


    it_behaves_like 'authorization for provisional final grade selection', :put
  end

  describe "copy_to_final_mark" do
    before(:once) do
      course_with_student :active_all => true
      @course.account.enable_service(:avatars)
      ta_in_course :active_all => true
      @assignment = @course.assignments.create!(
        submission_types: 'online_text_entry',
        moderated_grading: true,
        grader_count: 1,
        final_grader_id: @teacher.id
      )
      @submission = @assignment.submit_homework(@student, :submission_type => 'online_text_entry', :body => 'hallo')
      @pg = @submission.find_or_create_provisional_grade!(@ta, score: 80)
      @submission.add_comment(:commenter => @ta, :comment => 'huttah!', :provisional => true)

      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/provisional_grades/#{@pg.id}/copy_to_final_mark"
      @params = { :controller => 'provisional_grades', :action => 'copy_to_final_mark',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param,
                  :provisional_grade_id => @pg.to_param }
    end

    it "requires moderate_grades permission" 


    it "fails if the student isn't in the moderation set" 


    it "fails if the mark is already final" 


    it "copies the selected provisional grade" 


    it_behaves_like 'authorization for provisional final grade selection', :post
  end

  describe "publish" do
    before :once do
      course_with_student :active_all => true
      @course.account.enable_service(:avatars)
      course_with_ta :course => @course, :active_all => true
      @assignment = @course.assignments.create!
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/provisional_grades/publish"
      @params = { :controller => 'provisional_grades', :action => 'publish',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param }
    end

    it "requires a moderated assignment" 


    context "with moderated assignment" do
      before(:once) do
        @assignment.update_attribute :moderated_grading, true
        @assignment.update_attribute :grader_count, 2
        @assignment.update_attribute :final_grader_id, @teacher.id
      end

      it "responds with a 200 for a valid request" 


      it "requires manage_grades permissions" 


      it "fails if grades were already published" 


      context 'with empty provisional grades (comments only)' do
        before(:once) do
          @submission = @assignment.submit_homework(@student, :body => "hello")
          @submission.add_comment(author: @ta, provisional: true, comment: 'A provisional comment')
          @provisional_grade = @submission.provisional_grades.first
        end

        it 'publishes an empty provisional grade for an active student' 


        it 'publishes an empty provisional grade for a student with concluded enrollment' 


        it 'publishes an empty provisional grade for a student with an inactive enrollment' 

      end

      context "with provisional grades" do
        before(:once) do
          @submission = @assignment.submit_homework(@student, :body => "hello")
          @assignment.grade_student(@student, { :grader => @ta, :score => 100, :provisional => true })
        end

        it "publishes provisional grades" 


        it "publishes the selected provisional grade when the student is in the moderation set" 

      end

      context "with one provisional grade" do
        it "publishes the only provisional grade if none have been explicitly selected" 

      end

      context "with multiple provisional grades" do
        before(:once) do
          @first_ta = @ta
          @first_student = @student
          @second_ta = course_with_user("TaEnrollment", course: @course, active_all: true).user
          @second_student = course_with_user("StudentEnrollment", course: @course, active_all: true).user
          @first_student_submission = @assignment.submit_homework(@first_student, body: "hello")
          @second_student_submission = @assignment.submit_homework(@second_student, body: "hello")
        end

        context "when some submissions have no grades" do
          it "returns status ok" 


          it "publishes assignment" 


          it "does not publish a score for those that were ungraded" 

        end

        context "when no grades have been explicitly selected" do
          before(:once) do
            @assignment.grade_student(@first_student, grader: @first_ta, score: 72, provisional: true)
            @assignment.grade_student(@first_student, grader: @second_ta, score: 88, provisional: true)
          end

          it "returns status unprocessable entity" 


          it "does not publish the assignment" 


          it "does not grade the submission" 

        end

        context "when not all grades have been explicitly selected" do
          before(:each) do
            @assignment.grade_student(@student, grader: @ta, score: 12, provisional: true)
            @assignment.grade_student(@student, grader: @second_ta, score: 34, provisional: true)
            @assignment.grade_student(@second_student, grader: @ta, score: 56, provisional: true)
            @assignment.grade_student(@second_student, grader: @second_ta, score: 78, provisional: true)
            first_student_selection = @assignment.moderated_grading_selections.find_by(student: @student)
            first_student_selection.update!(selected_provisional_grade_id: @first_student_submission.provisional_grade(@ta))
          end

          it "returns status unprocessable entity" 


          it "does not grade the submission" 


          it "does not publish the assignment" 

        end

        it "only calls GradeCalculator once even if there are multiple selections" 

      end

      it_behaves_like 'authorization for provisional final grade selection', :post
    end
  end
end

