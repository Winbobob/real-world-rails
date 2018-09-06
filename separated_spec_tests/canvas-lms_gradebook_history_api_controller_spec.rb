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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GradebookHistoryApiController do
  def json_body
    JSON.parse(response.body.split(';').last)
  end

  def date_key(submission)
    submission.graded_at.to_date.as_json
  end


  before :once do
    course_with_teacher(:active_all => true)

    student = user_with_pseudonym(:username => 'student@example.com', :active_all => 1)
    student_in_course(:user => student, :active_all => 1)
    student2 = user_with_pseudonym(:username => 'student2@example.com', :active_all => 1)
    student_in_course(:user => student2, :active_all => 1)
    student3 = user_with_pseudonym(:username => 'student3@example.com', :active_all => 1)
    student_in_course(:user => student3, :active_all => 1)

    @grader = user_with_pseudonym(:name => 'Grader', :username => 'grader@example.com', :active_all => 1)
    @super_grader = user_with_pseudonym(:name => 'SuperGrader', :username => 'super_grader@example.com', :active_all => 1)
    @other_grader = user_with_pseudonym(:name => 'OtherGrader', :username => 'other_grader@example.com', :active_all => 1)

    @assignment1 = @course.assignments.create!(:title => "some assignment")
    @assignment2 = @course.assignments.create!(:title => "another assignment")

    @submission1 = @assignment1.submit_homework(student)
    @submission2 = @assignment1.submit_homework(student2)
    @submission3 = @assignment1.submit_homework(student3)
    @submission4 = @assignment2.submit_homework(student)

    @submission1.update_attributes!(:graded_at => Time.now, :grader_id => @grader.id, :score => 100)
    @submission2.update_attributes!(:graded_at => Time.now, :grader_id => @super_grader.id, :score => 90)
    @submission3.update_attributes!(:graded_at => (Time.now - 24.hours), :grader_id => @other_grader.id, :score => 80)
    @submission4.update_attributes!(:graded_at => (Time.now - 24.hours), :grader_id => @other_grader.id, :score => 70)
  end

  before :each do
    user_session(@teacher)
  end

  describe 'GET days' do

    def graders_hash_for(submission)
      json_body.find{|d| d['date'] == date_key(submission) }['graders']
    end

    describe 'default params' do

      before { get 'days', params: {:course_id => @course.id}, :format => 'json' }

      it 'provides an array of the dates where there are submissions' 


      it 'nests all the graders for a day inside the date entry' 


      it 'includes a list of assignment names for each grader' 

    end

    it 'paginates' 

  end

  describe 'GET day_details' do
    before { get 'day_details', params: {:course_id => @course.id, :date => @submission1.graded_at.strftime('%Y-%m-%d')}, format: 'json' }

    it 'has the graders as the top level piece of data' 


    it 'lists assignment names under the graders' 

  end

  describe 'GET assignment' do
    let(:date) { @submission1.graded_at.strftime('%Y-%m-%d') }
    let(:params) { { :course_id => @course.id, :date => date, :grader_id => @grader.id, :assignment_id => @assignment1.id } }

    before { get( 'submissions', params: params, format: 'json' ) }

    it 'lists submissions' 

  end

  describe 'GET feed' do
    context 'deleted submissions' do
      before :each do
        @submission1.destroy
        get 'feed', params: {course_id: @course.id}, format: 'json'
      end

      it 'does not return an error' 


      it 'excludes deleted submissions in the response' 

    end
  end
end

