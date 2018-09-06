require 'rails_helper'

RSpec.describe MentionsNotificationsJob, type: :job do
  include ActiveJob::TestHelper

  let!(:participant) { create :participant }
  let!(:comment) { create :comment }

  describe 'queues the job' do

    subject(:job) { described_class.perform_later(mentioned_participant_ids: [participant.id], comment_id: comment.id) }

    it 'queues the job' 


    it 'is placed on the notifications queue' 


    it 'executes with no errors' 

  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end

