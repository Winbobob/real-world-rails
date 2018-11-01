# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Answer::AutoGradingService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }
    let(:student_user) { create(:course_student, course: course).user }
    let(:assessment) { create(:assessment, :published_with_mrq_question, course: course) }
    let(:question) { assessment.questions.first }
    let(:submission) do
      create(:submission, *submission_traits, assessment: assessment, creator: student_user)
    end
    let(:submission_traits) { nil }
    let(:answer) do
      create(:course_assessment_answer_multiple_response, *answer_traits,
             question: question, submission: submission).answer
    end
    let(:answer_traits) { :submitted }
    let!(:auto_grading) { create(:course_assessment_answer_auto_grading, answer: answer) }

    describe '.grade' do
      subject { Course::Assessment::Answer::AutoGradingService.grade(answer) }

      context 'when the assessment is not autograded' do
        it 'evaluates the answer' 

      end

      context 'when the assessment is autograded' do
        before { allow(assessment).to receive(:autograded?).and_return(true) }

        it 'grades the answer' 

      end

      # Check that evaluated answers can be evaluated again. Allows instructors to run
      # test cases again when the "Evaluate Answers" button is clicked.
      # Also allows auto grading to be run again if the question is updated after evaluation.
      context 'when the answer is evaluated' do
        let(:answer_traits) { :evaluated }
        it 'allows re-evaluation and stays evaluated' 

      end

      # Check that graded answers can be evaluated again. Allows auto grading to be run again
      # if the question is updated after grading.
      context 'when the answer is graded' do
        let(:answer_traits) { :graded }
        it 'allows re-evaluation and stays graded' 

      end
    end
  end
end

