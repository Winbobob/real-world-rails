# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Submission::ZipDownloadJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:assessment) { create(:assessment, :published_with_programming_question) }
    let(:course) { assessment.course }
    let(:submission) { create(:submission, :submitted, assessment: assessment, course: course) }
    let(:course_user) { create(:course_teaching_assistant, course: course) }
    subject { Course::Assessment::Submission::ZipDownloadJob }

    it 'can be queued' 


    it 'downloads the submissions' 

  end
end

