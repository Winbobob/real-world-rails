#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe Quizzes::QuizzesController do

  def create_section_override(section, due_at)
    override = assignment_override_model(:quiz => @quiz)
    override.set = section
    override.override_due_at(due_at)
    override.save!
  end

  context "#show" do
    before :each do
      course_with_teacher_logged_in(:active_all => true)
      assignment_model(:course => @course)
      quiz_model(:course => @course, :assignment_id => @assignment.id)
      @quiz.update_attribute :due_at, 5.days.from_now
      @cs1 = @course.default_section
      @cs2 = @course.course_sections.create!
    end

    context "with overridden due dates" do
      include TextHelper

      context "with no overrides" do
        it "should show a due date for 'Everyone'" 

      end

      context "with some sections overridden" do
        before do
          @due_at = 3.days.from_now
          create_section_override(@cs1, @due_at)
        end

        it "should show an overridden due date for student" 


        it "should show 'Everyone else' when some sections have a due date override" 

      end

      context "with all sections overridden" do
        before do
          @due_at1, @due_at2 = 3.days.from_now, 4.days.from_now
          create_section_override(@cs1, @due_at1)
          create_section_override(@cs2, @due_at2)
        end

        it "should show multiple due dates to teachers" 


        it "should not show a date for 'Everyone else'" 

      end
    end

    context "SpeedGrader" do
      it "should link to SpeedGrader when not large_roster" 


      it "should not link to SpeedGrader when large_roster" 

    end
  end

  context "show_student" do
    before :each do
      course_with_student_logged_in(:active_all => true)
      course_quiz true
      post "/courses/#{@course.id}/quizzes/#{@quiz.id}/take?user_id=#{@student.id}"

      get "/courses/#{@course.id}/quizzes/#{@quiz.id}/take"
    end

    context "Show Center resume button" do
      it "should show resume button in the center" 

    end

    context "Not show right_side resume button" do
      it "should not show resume button on right_side" 

    end
  end

  context "#history" do
    context "pending_review" do
      def mkquiz
        quiz_with_graded_submission([{:question_data => {:name => 'question 1', :points_possible => 1, 'question_type' => 'essay_question'}},
                                   {:question_data => {:name => 'question 2', :points_possible => 1, 'question_type' => 'essay_question'}}])
        course_with_teacher_logged_in(:active_all => true, :course => @course)
      end

      def mksurvey
        survey_with_submission([{:question_data => {:name => 'question 1', :points_possible => 1, 'question_type' => 'essay_question'}},
                                   {:question_data => {:name => 'question 2', :points_possible => 1, 'question_type' => 'essay_question'}}])
        course_with_teacher_logged_in(:active_all => true, :course => @course)
      end

      it "should list the questions needing review" 


      it "should display message about the quiz changing significantly" 


      it "should display both messages" 


      it "shoudn't show the user's name/email when it's an anonymous submission" 

    end
  end

  def course_quiz(active=false)
    @quiz = @course.quizzes.create
    @quiz.workflow_state = "available" if active
    @quiz.save!
    @quiz
  end
end

