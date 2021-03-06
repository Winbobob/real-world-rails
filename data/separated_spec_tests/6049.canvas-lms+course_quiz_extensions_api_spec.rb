#
# Copyright (C) 2014 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')

describe Quizzes::CourseQuizExtensionsController, type: :request do
  before :once do
    course_factory
    @quizzes = [1,2].map do |n|
      quiz = @course.quizzes.create!(:title => "quiz#{n}")
      quiz.publish!
      quiz
    end
    @student = student_in_course(course: @course, active_all: true).user
  end

  describe "POST /api/v1/courses/:course_id/quiz_extensions (create)" do
    def api_create_quiz_extension(quiz_extension_params, opts={})
      api_call(:post, "/api/v1/courses/#{@course.id}/quiz_extensions",
              {:controller => "quizzes/course_quiz_extensions", :action => "create", :format => "json",
               :course_id => @course.id.to_s},
              {:quiz_extensions => quiz_extension_params},
              {'Accept' => 'application/vnd.api+json'}, opts)
    end

    context "as a student" do
      it "should be unauthorized" 

    end

    context "as a teacher" do
      before :once do
        @student1 = @student
        @student2 = student_in_course(course: @course, active_all: true).user
        @teacher  = teacher_in_course(course: @course, active_all: true).user
      end

      it "should extend attempts for a existing submission" 


      it "should extend attempts for a new submission" 


      it "should extend attempts for multiple students" 

    end
  end
end

