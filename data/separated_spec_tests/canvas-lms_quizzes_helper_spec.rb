# encoding: utf-8
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

describe QuizzesHelper do
  include ApplicationHelper
  include QuizzesHelper
  include ERB::Util

  describe "#needs_unpublished_warning" do
    before :once do
      course_with_teacher
    end

    it "is false if quiz not manageable" 


    it "is false if quiz is available with no unpublished changes" 


    it "is true if quiz is not available" 


    it "is true if quiz has unpublished changes" 

  end

  describe "#attachment_id_for" do

    it "returns the attachment id if attachment exists" 


    it "returns empty string when no attachments stored" 

  end

  context 'render_score' do
    it 'should render nil scores' 


    it 'should render non-nil scores' 


    it 'should remove trailing zeros' 


    it 'should remove trailing zeros and decimal point' 

  end

  context 'render_quiz_type' do
    it 'should render a humanized quiz type string' 


    it 'should return nil for an unrecognized quiz_type' 

  end

  context 'render_score_to_keep' do
    it 'should render which score to keep when passed in a scoring_policy option' 


    it 'should return nil for an unrecognized scoring_policy' 

  end

  context 'render_show_responses' do
    it "should answer 'Let Students See Quiz Responses?' when passed a hide_results option" 


    it "should return nil for an unrecognized hide_results value" 

  end

  context 'score_out_of_points_possible' do
    it 'should show single digit scores' 


    it 'should show 2-decimal precision if necessary' 


    it 'should be wrapped by a span when a CSS class, id, or style is given' 

  end

  context 'fill_in_multiple_blanks_question' do
    before(:each) do
      @question_text = %q|<input name="question_1_1813d2a7223184cf43e19db6622df40b" 'value={{question_1}}' />|
      @answer_list = []
      @answers = []

      def user_content(stuff); stuff; end # double #user_content
    end

    it 'should extract the answers by blank' 


    it 'should sanitize user input' 


    it 'should add an appropriate label' 

    it 'should handle equation img tags in the question text' 

    it "should sanitize the answer blocks in the noisy question data" 

  end

  context "multiple_dropdowns_question" do
    before do
      def user_content(stuff); stuff; end # double #user_content
    end

    it "should select the user's answer" 


    it "should not blow up if the user's answer isn't there" 


    it "should disable select boxes that are not editable" 

  end

  describe "#quiz_edit_text" do

    it "returns correct string for survey" 


    it "returns correct string for quiz" 

  end

  describe "#quiz_delete_text" do

    it "returns correct string for survey" 


    it "returns correct string for quiz" 

  end

  describe "#score_affected_by_regrade" do
    it "returns true if kept score differs from score before regrade" 


    it "returns false if kept score equals score before regrade" 

  end

  describe "#answer_title" do
    it "builds title if answer is selected" 


    it "builds title if answer is correct" 


    it "returns nil if not selected or correct" 

  end

  describe "#render_show_correct_answers" do
    context "show_correct_answers is false" do
      it 'shows No' 

    end

    context "show_correct_answers is true, but nothing else is set" do
      it 'shows Immediately' 

    end

    context "show_correct_answers_last_attempt is true" do
      it 'shows After Last Attempt' 

    end

    context "show_correct_answers_at is set" do
      it 'shows date of ' 

    end

    context "hide_correct_answers_at is set" do
      it 'shows date of ' 

    end

    context "show_correct_answers_at and hide_correct_answers_at are set" do
      it 'shows date of ' 

    end
  end

  describe '#render_correct_answer_protection' do
    it 'should provide a useful message when "last attempt"' 

    it 'should provide a useful message when "no"' 


    it 'should provide nothing when "yes"' 


    it 'should provide a useful message, and an availability date, when "show at" is set' 


    it 'should provide a useful message, and a date, when "hide at" is set' 

  end

  context "#point_value_for_input" do
    let(:user_answer) { @user_answer }
    let(:question) { { points_possible: 5 } }
    let(:quiz) { @quiz }

    before do
      @quiz = double(quiz_type: 'graded_survey')
      @user_answer = { correct: 'undefined', points: 5 }
    end

    it "returns user_answer[:points] if correct is true/false" 


    it "returns empty if quiz is practice quiz or assignment" 


    it "returns points possible for the question if (un)graded survey" 

  end
end

