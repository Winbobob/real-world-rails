# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Answer::MultipleResponseAutoGradingService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:answer) do
      arguments = *answer_traits
      options = arguments.extract_options!
      options[:question_traits] = question_traits
      options[:submission_traits] = submission_traits
      create(:course_assessment_answer_multiple_response, :submitted, *arguments, options).answer
    end
    let(:question) { answer.question.actable }
    let(:question_traits) { nil }
    let(:submission_traits) { [{ auto_grade: false }] }
    let(:answer_traits) { nil }
    let!(:grading) do
      create(:course_assessment_answer_auto_grading, answer: answer)
    end

    describe '#grade' do
      before { allow(answer.submission.assessment).to receive(:autograded?).and_return(true) }

      context 'when the question requires all correct options' do
        context 'when only the correct answer is selected' do
          let(:answer_traits) { :with_all_correct_options }

          it 'marks the answer correct' 

        end

        context 'when only the wrong answer is selected' do
          let(:answer_traits) { :with_all_wrong_options }

          it 'marks the answer wrong' 

        end

        context 'when the wrong and right answers are selected' do
          let(:answer_traits) { [:with_all_correct_options, :with_all_wrong_options] }

          it 'marks the answer wrong' 

        end
      end

      context 'when a question requires any correct option' do
        let(:question_traits) { :any_correct }

        context 'when only the correct answer is selected' do
          let(:answer_traits) { :with_all_correct_options }

          it 'marks the answer correct' 

        end

        context 'when only the wrong answer is selected' do
          let(:answer_traits) { :with_all_wrong_options }

          it 'marks the answer wrong' 

        end

        context 'when the wrong and right answers are selected' do
          let(:answer_traits) { [:with_all_correct_options, :with_all_wrong_options] }

          it 'marks the answer wrong' 

        end

        context 'when only one of two right answers is selected' do
          let(:answer_traits) { :with_one_correct_option }

          it 'marks the answer correct' 

        end
      end
    end
  end
end

