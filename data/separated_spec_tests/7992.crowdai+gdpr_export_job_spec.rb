require 'rails_helper'

RSpec.describe GdprExportJob, type: :job do
  include ActiveJob::TestHelper

  let!(:participant) { create :participant }

  describe 'queues the job' do
    subject(:job) { described_class.perform_later(
      participant_id: participant.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end

