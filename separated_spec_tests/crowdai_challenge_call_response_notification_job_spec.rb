require 'rails_helper'
RSpec.describe Admin::ChallengeCallResponseNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let(:challenge_call_response) { create :challenge_call_response }
  subject(:job) { described_class.perform_later(challenge_call_response) }

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

