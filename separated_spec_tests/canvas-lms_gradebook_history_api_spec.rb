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
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe GradebookHistoryApiController, type: :request do
  include Api

  describe 'GET /courses/:course_id/gradebook_history/days' do
    it 'returns the array of days' 

  end

  describe 'GET /courses/:course_id/gradebook_history/:date' do
    it 'routes the request correctly and returns decent data' 


  end

  describe 'GET /courses/:course_id/gradebook_history/:date/graders/:grader_id/assignments/:assignment_id/submissions' do
    let(:date) { Time.now.in_time_zone }
    let(:date_str) { date.strftime('%Y-%m-%d') }

    before :once do
      course_with_teacher(:active_all => true)
      @student = user_with_pseudonym(:username => 'student@example.com', :active_all => 1)
      student_in_course(:user => @student, :active_all => 1)
      @assignment = @course.assignments.create!(:title => "some assignment")
      @submission = bare_submission_model(@assignment, @student)
    end

    it 'routes properly and returns reasonable data' 


    it 'can find autograded data' 

  end

  describe 'GET /courses/:course_id/gradebook_history/feed' do
    before :once do
      course_with_teacher(:active_all => true)

      @student1 = user_with_pseudonym(:username => 'student@example.com', :active_all => 1)
      student_in_course(:user => @student1, :active_all => 1)
      @student2 = user_with_pseudonym(:username => 'student2@example.com', :active_all => 1)
      student_in_course(:user => @student2, :active_all => 1)
      @student3 = user_with_pseudonym(:username => 'student3@example.com', :active_all => 1)
      student_in_course(:user => @student3, :active_all => 1)

      @grader = user_with_pseudonym(:name => 'Grader', :username => 'grader@example.com', :active_all => 1)
      @super_grader = user_with_pseudonym(:name => 'SuperGrader', :username => 'super_grader@example.com', :active_all => 1)
      @other_grader = user_with_pseudonym(:name => 'OtherGrader', :username => 'other_grader@example.com', :active_all => 1)

      @assignment1 = @course.assignments.create!(:title => "some assignment")
      @assignment2 = @course.assignments.create!(:title => "another assignment")

      @submission1 = @assignment1.submit_homework(@student1)
      @submission2 = @assignment1.submit_homework(@student2)
      @submission3 = @assignment1.submit_homework(@student3)
      @submission4 = @assignment2.submit_homework(@student1)
    end

    def create_versions
      @submission1.with_versioning(:explicit => true) {
        @submission1.update_attributes!(:graded_at => Time.zone.now, :grader_id => @grader.id, :score => 100) }
      @submission2.with_versioning(:explicit => true) {
        @submission2.update_attributes!(:graded_at => Time.zone.now, :grader_id => @super_grader.id, :score => 90) }
      @submission3.with_versioning(:explicit => true) {
        @submission3.update_attributes!(:graded_at => 24.hours.ago, :grader_id => @other_grader.id, :score => 80) }
      @submission4.with_versioning(:explicit => true) {
        @submission4.update_attributes!(:graded_at => 24.hours.ago, :grader_id => @other_grader.id, :score => 70) }
    end

    it 'should return all applicable versions' 


    it 'should paginate the versions' 


    it 'should order the most recent versions first' 


    it 'should optionally restrict by assignment_id' 


    it 'should optionally restrict by user_id' 


    it 'should optionally reverse ordering to oldest version first' 

  end
end

