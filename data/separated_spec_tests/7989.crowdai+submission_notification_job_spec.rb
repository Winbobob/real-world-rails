require 'rails_helper'
RSpec.describe Admin::SubmissionNotificationJob, type: :job, api: true do
  include ActiveJob::TestHelper

  let!(:submission) { create :submission }
  let!(:admin) { create :participant, :admin }

  before do
    admin.email_preferences.first.update(email_frequency: :every)
  end

  subject(:job) { described_class.perform_later(submission) }

  describe 'queues the job' do

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    after do
      clear_enqueued_jobs
      clear_performed_jobs
    end
  end

end

