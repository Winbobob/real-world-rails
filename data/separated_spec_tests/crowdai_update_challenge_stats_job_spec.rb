
require 'rails_helper'

RSpec.describe UpdateChallengeStatsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:topic) { create :topic, :with_comments }
  let!(:comment) { topic.comments.last }
  subject(:job) { described_class.perform_later }

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

