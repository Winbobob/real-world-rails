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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QuestionBanksController do

  def create_course_with_two_question_banks!
    course_with_teacher(active_all: true)
    @bank1 = @course.assessment_question_banks.create!
    @bank2 = @course.assessment_question_banks.create!
    @question1 = @bank1.assessment_questions.create!
    @question2 = @bank1.assessment_questions.create!
  end

  describe "GET / (#index)" do

    before { create_course_with_two_question_banks!; user_session(@teacher) }

    it "only includes active question banks" 

  end

  describe "move_questions" do

    before(:once) { create_course_with_two_question_banks! }
    before(:each) { user_session(@teacher) }

    it "should copy questions" 


    it "should move questions" 

  end

  describe "bookmark" do
    before :once do
      course_with_teacher
      @bank = @course.assessment_question_banks.create!
    end

    before :each do
      user_session(@teacher)
    end

    it "bookmarks" 


    it "unbookmarks" 

  end

  describe "#show" do
    before :once do
      course_with_teacher
      @bank = @course.assessment_question_banks.create!
    end

    before :each do
      user_session(@teacher)
    end

    subject do
      get :show, params: {course_id: @course.id, id: @bank.id}
    end

    it 'renders show template' 


    it 'adds CONTEXT_URL_ROOT to js env' 

  end
end

