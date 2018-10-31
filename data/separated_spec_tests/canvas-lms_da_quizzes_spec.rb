#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../helpers/assignments_common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/differentiated_assignments')

describe "interaction with differentiated quizzes" do
  include_context "in-process server selenium tests"
  include DifferentiatedAssignments
  include AssignmentsCommon

  context "Student" do
    before(:each) do
      course_with_student_logged_in
      da_setup
      @da_quiz = create_da_quiz
    end

    context "Quiz and Assignment Index" do
      it "should not show inaccessible quizzes" 

      it "should show quizzes with an override" 

      it "should show quizzes with a graded submission" 

    end

    context "Quiz Show and Submission page" do
      it "should redirect back to quizzes index from inaccessible quizzes" 

      it "should show the quiz page with an override" 

      it "should show the quiz page with a graded submission" 

      it "should show previous submissions on inaccessible quizzes" 

      it "should not allow you the quiz to be taken if visibility has been revoked" 

    end

    context "Student Grades page" do
      it "should show a quiz with an override" 

      it "should show a quiz with a grade" 

      it "should not show an inaccessible quiz" 

    end
  end
  context "Observer with student" do
    before(:each) do
      observer_setup
      da_setup
      @da_quiz = create_da_quiz
    end

    context "Quiz and Assignment Index" do
      it "should not show inaccessible quizzes" 

      it "should show quizzes with an override" 

      it "should show quizzes with a graded submission" 

    end

    context "Quiz Show and Submission page" do
      it "should redirect back to quizzes index from inaccessible quizzes" 

      it "should show the quiz page with an override" 

      it "should show the quiz page with a graded submission" 

      it "should show previous submissions on inaccessible quizzes" 

    end

    context "Student Grades page" do
      it "should show a quiz with an override" 

      it "should show a quiz with a graded submission" 

      it "should not show an inaccessible quiz" 

    end
  end
end

