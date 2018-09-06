# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Answer::TextResponseComprehensionAutoGradingService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:answer) do
      arguments = *answer_traits
      options = arguments.extract_options!
      options[:question_traits] = question_traits
      options[:submission_traits] = submission_traits
      create(:course_assessment_answer_text_response, :submitted, *arguments, options).answer
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

      let(:question_traits) { :comprehension_question }

      context 'when answer only contains lifted words' do
        let(:answer_traits) { :comprehension_lifted_word }

        it 'matches lifted word and grades as zero' 

      end

      context 'when answer contains only keywords' do
        let(:answer_traits) { :comprehension_keyword }

        it 'matches keyword' 

      end

      context 'when answer contains lifted words and keywords from same point' do
        let(:answer_traits) { :comprehension_lifted_word_keyword }

        it 'matches lifted word and grades as zero' 

      end

      context 'when answer contains keywords from multiple groups' do
        let(:question_traits) { :multiple_comprehension_groups }

        it 'matches keywords' 


        it 'matches keywords with cap on question maximum_grade' 

      end

      context 'when answer contains lifted words and keywords from multiple groups' do
        let(:question_traits) { :multiple_comprehension_groups }

        it 'matches lifted word and grades partial marks' 

      end
    end
  end
end

