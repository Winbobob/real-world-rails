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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Quizzes::TakeQuizPresenter do

  let(:quiz) { Quizzes::Quiz.new }
  let(:submission) { Quizzes::QuizSubmission.new }
  let(:params) { {} }
  let(:question1) { {:id => 1, :name => "Question 1"} }
  let(:question2) { {:id => 2, :name => "Question 2"} }
  let(:question3) { {:id => 3, :name => "Question 3"} }
  let(:all_questions) { [question1, question2, question3] }

  let(:presenter) { Quizzes::TakeQuizPresenter.new(quiz, submission, params) }

  def set_current_question(question)
    params[:question_id] = question[:id]
    allow(submission).to receive(:question).with(question[:id]).and_return(question)
  end

  before do
    allow(submission).to receive(:questions).and_return all_questions
  end

  describe "current_questions" do
    context "when the question ID is set" do
      it "queries the submission for that question and returns it in an array" 

    end

    context "when the question ID is not set" do
      it "returns all the quiz data" 

    end

    context "when one question at a time" do
      it "returns the first question" 

    end
  end

  describe "all_questions" do
    it "returns all questions" 

  end

  describe "neighboring_question" do
    before do
      allow(quiz).to receive(:one_question_at_a_time?) { true }
    end

    context "when on the first question" do
      it "previous_question returns nil" 


      it "next_question returns the second question" 

    end

    context "when on the second question" do
      before do
        set_current_question question2
      end

      it "previous_question returns the first question" 


      it "next_question returns the third question" 

    end

    context "when on the last question" do
      before do
        set_current_question question3
      end

      it "previous_question returns the second question" 


      it "next_question returns nil" 

    end
  end

  describe "previous_question_viewable?" do

    it "returns false if no previous_question" 


    it "returns true if there is a previous question and quiz allows "+
      "user to go back" do
      expect(presenter).to receive(:previous_question).and_return true
      expect(presenter).to receive(:cant_go_back?).and_return false
      expect(presenter.previous_question_viewable?).to eq true
    end
  end

  describe "marked?" do
    before do
      allow(submission).to receive(:submission_data).and_return(
        "question_#{question1[:id]}_marked" => true,
        "question_#{question2[:id]}_marked" => false
      )
    end

    it "returns true if the submission is marked" 


    it "returns false if the submission is not marked" 

  end

  describe "answered_icon" do
    before do
      allow(submission).to receive(:submission_data).and_return({
        "question_#{question1[:id]}" => true,
        "question_#{question2[:id]}" => nil
      })
    end

    it 'returns icon-check for answered questions' 


    it 'returns icon-question for unanswered questions' 

  end

  describe "answered_text" do
    before do
      allow(submission).to receive(:submission_data).and_return({
        "question_#{question1[:id]}" => true,
        "question_#{question2[:id]}" => nil
      })
    end

    it 'returns icon-check for answered questions' 


    it 'returns icon-question for unanswered questions' 

  end

  describe "marked_text" do
    before do
      allow(submission).to receive(:submission_data).and_return(
        "question_#{question1[:id]}_marked" => true,
        "question_#{question2[:id]}_marked" => false
      )
    end

    it "returns text if the submission is marked" 


    it "returns empty string if the submission is not marked" 

  end

  describe "current_question?" do
    before do
      set_current_question question2
    end

    it "returns true if the current question is the one passed in" 


    it "returns false when not the current question" 

  end

  describe "last_question?" do
    it "returns true when on the last question" 


    it "returns false when not on the last question" 

  end

  describe "question_index" do
    it "returns the index of the question" 

  end

  describe "question_seen?" do
    it "returns true when the question is the current question" 


    it "returns false when the question is after the current question" 


    it "returns true when the question is before the current question" 


    it "returns true when all questions have been seen and quiz can't go back" 

  end

  describe "question_answered?" do
    before do
      allow(submission).to receive(:submission_data).and_return(
        "question_#{question1[:id]}" => true,
        "question_#{question2[:id]}" => nil
      )
    end

    it 'returns true for answered questions' 


    it 'returns false for unanswered questions' 

  end

  describe "#question_class" do
    it "always returns 'list_question'" 


    it "adds 'answered' if the question was answered" 


    it "adds 'marked' if the question was marked" 


    it "adds 'seen' if the question was seen" 


    it "adds 'text_only' if the question is a text only question" 

  end

  describe 'building the answer set' do
    it 'should discard irrelevant entries' 


    it 'marks a question as answered' 


    it 'rejects zeroes for an answer' 

  end

end

