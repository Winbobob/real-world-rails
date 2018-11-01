require 'rails_helper'

RSpec.describe SubmissionGradedNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:participant) { create :participant }
  let!(:challenge) { create :challenge, :running }
  let(:submission) {
    create :submission,
    challenge: challenge,
    participant: participant }
  let!(:admin) { create :participant, :admin }
  let!(:email_preference1) {
    create :email_preference,
    email_frequency: :every,
    participant: participant }
  let!(:email_preference2) {
    create :email_preference,
    email_frequency: :every,
    participant: admin }

  describe 'queues the job' do
    subject(:job) { described_class.perform_later(submission) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  describe 'supporting methods' do
    subject(:job) { described_class.new }

    it '#admin_ids' 


    it '#recipient_ids' 

  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

end

