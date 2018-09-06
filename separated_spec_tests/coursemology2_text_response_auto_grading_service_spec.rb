# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Answer::TextResponseAutoGradingService do
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

      context 'when an exact match is present' do
        let(:answer_traits) { :exact_match }

        it 'matches the entire answer' 

      end

      context 'when the solution contains Windows newlines' do
        let(:question_traits) { :multiline_windows }
        let(:answer_traits) { :multiline_linux }

        it 'treats different answer and question newlines as equivalent' 

      end

      context 'when the solution contains Linux newlines' do
        let(:question_traits) { :multiline_linux }
        let(:answer_traits) { :multiline_windows }

        it 'treats different answer and question newlines as equivalent' 

      end

      context 'when one keyword is present' do
        let(:answer_traits) { :keyword }

        it 'matches the keyword' 

      end

      context 'when multiple keywords are present' do
        let(:question_traits) { :multiple_keywords }

        it 'matches all keywords' 

      end

      context 'when no match is found' do
        let(:answer_traits) { :no_match }

        it 'matches nothing' 

      end
    end
  end
end

