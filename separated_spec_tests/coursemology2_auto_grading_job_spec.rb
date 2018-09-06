# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Submission::AutoGradingJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    subject { Course::Assessment::Submission::AutoGradingJob }
    let(:course) { create(:course) }
    let(:student_user) { create(:course_student, course: course).user }
    let(:assessment) { create(:assessment, :published_with_mrq_question, course: course) }
    let(:question) { assessment.questions.first.specific }
    let(:submission) { create(:submission, assessment: assessment, creator: student_user) }
    let(:answer) do
      create(:course_assessment_answer_multiple_response, :submitted,
             submission: submission, question: question.acting_as)
    end

    it 'can be queued' 


    with_active_job_queue_adapter(:background_thread) do
      it 'grades submissions' 


      context 'when the job is complete' do
        it 'redirects to the submission edit page' 

      end
    end
  end
end

