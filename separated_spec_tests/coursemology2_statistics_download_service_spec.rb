# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Submission::StatisticsDownloadService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }
    let(:course_staff) { create(:course_teaching_assistant, course: course) }
    let(:assessment) { create(:assessment, :published_with_text_response_question, course: course) }
    let(:student1) { create(:course_user, course: course, name: 'Student') }
    let(:student2) { create(:course_user, course: course, name: 'Student 2') }

    let(:submission1) do
      create(:submission, :submitted, assessment: assessment,
                                      course: course, creator: student1.user)
    end

    let(:submission2) do
      create(:submission, :submitted, assessment: assessment,
                                      course: course, creator: student2.user)
    end

    describe '#download' do
      context 'when downloading statistics' do
        it 'download empty statistics' 


        it 'download non-empty statistics' 

      end
    end
  end
end

