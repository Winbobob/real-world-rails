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

require File.expand_path(File.dirname(__FILE__) + '/../common')

describe "account admin question bank" do
  include_context "in-process server selenium tests"

  before(:each) do
    admin_logged_in
    @question_bank = create_question_bank
    @question = create_question
    @outcome = create_outcome
    get "/accounts/#{Account.default.id}/question_banks/#{@question_bank.id}"
  end

  def create_question_bank(title = "question bank 1")
    Account.default.assessment_question_banks.create!(:title => title)
  end

  def create_question(name = "question 1", bank = @question_bank)
    answers = [{:text => "correct answer", :weight => 100}]
    3.times do
      answer = {:text => "incorrect answer", :weight => 0}
      answers.push answer
    end
    data = {:question_text => "what is the answer to #{name}?", :question_type => 'multiple_choice_question', :answers => answers}
    data[:question_name] = name
    question = AssessmentQuestion.create(:question_data => data)
    bank.assessment_questions << question
    question
  end

  def create_outcome (short_description = "good student")
    outcome = Account.default.learning_outcomes.create!(
        :short_description => short_description,
        :rubric_criterion => {
            :description => "test description",
            :points_possible => 10,
            :mastery_points => 9,
            :ratings => [
                {:description => "Exceeds Expectations", :points => 5},
                {:description => "Meets Expectations", :points => 3},
                {:description => "Does Not Meet Expectations", :points => 0}
            ]
        })
    Account.default.root_outcome_group.add_outcome(outcome)
    outcome
  end


  def verify_added_question(name, question_text, chosen_question_type)
    question = AssessmentQuestion.where(name: name).first
    expect(question).to be_present
    question_data = question.question_data
    expect(question_data[:question_type]).to eq chosen_question_type
    expect(question_data[:question_text]).to include question_text
    answers = question_data[:answers]
    expect(answers[0][:weight]).to eq 100
    (1..3).each do |i|
      expect(answers[i][:weight]).to eq 0
    end
    assessment_question_id = driver.execute_script(
      "return $('#question_#{question.id} .assessment_question_id').text()"
    )
    expect(assessment_question_id).to be_present
    expect(f("#question_#{question.id}")).to include_text name
    expect(f("#question_#{question.id}")).to include_text question_text
    question
  end

  def add_multiple_choice_question(name = "question 2", points = "3")
    multiple_choice_value = "multiple_choice_question"
    question_text = "what is the answer to #{name}?"
    f(".add_question_link").click
    wait_for_ajaximations
    question_form = f(".question_form")
    replace_content(question_form.find_element(:css, "[name='question_name']"), name)
    replace_content(question_form.find_element(:css, "[name='question_points']"), points)
    wait_for_ajaximations
    click_option(".header .question_type", multiple_choice_value, :value)
    wait_for_ajaximations
    type_in_tiny(".question_content", question_text)
    wait_for_ajaximations
    answer_inputs = ff(".form_answers .select_answer input")
    answer_inputs[0].send_keys("correct answer")
    (1..3).each do |i|
      answer_inputs[i*2].send_keys("incorrect answer")
      wait_for_ajaximations
    end
    submit_form(question_form)
    wait_for_ajaximations
    verify_added_question(name, question_text, multiple_choice_value)
  end

  it "should add bank and multiple choice question" 


  it "should add a multiple choice question" 


  it "should edit a multiple choice question" 


  it "should show question details" 


  it "should move question to another bank" 


  it "should bookmark a question bank" 


  it "should edit bank details" 


  it "should delete a question bank" 


  it "should delete a multiple choice question" 


  context "moving multiple questions" do
    def add_questions_and_move(question_count = 1)
      question_number = question_count + 1
      questions = []
      questions.push @question
      question_count.times { |i| questions.push create_question("question #{question_number+i}") }
      f(".move_questions_link").click
      wait_for_ajaximations
      question_list = ffj(".list_question:visible")
      expect(question_list.count).to eq questions.count
      question_list.each_with_index do |question, i|
        expect(question).to include_text questions[i].name
        f("#list_question_#{questions[i].id}").click
        wait_for_ajaximations
      end
      questions
    end

    def move_questions_validation(bank_name, questions)
      new_question_bank = AssessmentQuestionBank.where(title: bank_name).first
      expect(new_question_bank).to be_present
      new_questions = AssessmentQuestion.where(:assessment_question_bank_id => new_question_bank).to_a
      expect(new_questions).to be_present
      expect(new_questions).to match_array questions
    end

    it "should move multiple questions to a new bank" 


    it "should move multiple questions to an existing bank" 

  end

  context "outcome alignment" do
    def add_outcome_to_bank(outcome, mastery_percent = 60)
      f('.add_outcome_link').click
      wait_for_ajaximations
      f('.outcome-link').click
      wait_for_ajaximations
      replace_content(f('#outcome_mastery_at'), mastery_percent)
      fj('.btn-primary:visible').click
      wait_for_ajax_requests
      expect(fj("[data-id=#{outcome.id}]:visible")).to include_text outcome.short_description
    end

    it "should align an outcome" 


    it "should change the outcome set mastery score" 


    it "should delete an aligned outcome" 

  end
end
