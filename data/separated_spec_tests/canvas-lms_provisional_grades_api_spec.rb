#
# Copyright (C) 2011 - 2015 Instructure, Inc.
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

describe 'Provisional Grades API', type: :request do
  describe "status" do
    before(:once) do
      course_with_teacher :active_all => true
      ta_in_course :active_all => true
      @student = student_in_course(:active_all => true).user
      @assignment = @course.assignments.build
      @assignment.moderated_grading = true
      @assignment.save!
      @submission = @assignment.submit_homework @student, :body => 'EHLO'
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/provisional_grades/status"
      @params = { :controller => 'provisional_grades', :action => 'status',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param,
                  :student_id => @student.to_param }
    end

    it "should require authorization" 


    it "should return whether a student needs a provisional grade" 

  end

  describe "select" do
    before(:once) do
      course_with_student :active_all => true
      ta_in_course :active_all => true
      @assignment = @course.assignments.build
      @assignment.moderated_grading = true
      @assignment.save!
      subs = @assignment.grade_student @student, :grader => @ta, :score => 0, :provisional => true
      @pg = subs.first.provisional_grade(@ta)
      @path = "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/provisional_grades/#{@pg.id}/select"
      @params = { :controller => 'provisional_grades', :action => 'select',
                  :format => 'json', :course_id => @course.to_param, :assignment_id => @assignment.to_param,
                  :provisional_grade_id => @pg.to_param }
    end

    it "should fail if the student isn't in the moderation set" 


    context "with moderation set" do
      before(:once) do
        @selection = @assignment.moderated_grading_selections.build
        @selection.student_id = @student.id
        @selection.save!
      end

      it "should require :moderate_grades" 


      it "should select a provisional grade" 

    end
  end

  describe "copy_to_final_mark" do
    before(:once) do
      course_with_student :active_all => true
      ta_in_course :active_all => true
      @assignment = @course.assignments.create! submission_types: 'online_text_entry', moderated_grading: true
      @assignment.moderated_grading_selections.create! student: @student
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

  end

  describe "publish" do
    before :once do
      course_with_student :active_all => true
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
      end

      it "responds with a 200 for a valid request" 


      it "requires moderate_grades permissions" 


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
          course_with_user("TaEnrollment", course: @course, active_all: true)
          @second_ta = @user
        end

        it "publishes even when some submissions have no grades" 


        it "does not publish if none have been explicitly selected" 


        it "does not publish any if not all have been explicitly selected" 

      end
    end
  end
end

