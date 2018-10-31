require 'rails_helper'

RSpec.describe EveryTopicNotificationJob, type: :job do
  include ActiveJob::TestHelper

  describe 'receive_every_email' do
    let!(:author) { create :participant }
    let!(:follower) { create :participant }
    let!(:email_preference) {
      create :email_preference,
      email_frequency: :every,
      participant: follower }
    let!(:follow) { create :follow, participant: follower }
    let!(:topic) {
      create :topic,
      challenge_id: follow.followable_id,
      participant: author }
    subject(:job) { described_class.perform_later(topic.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    it 'writes to the email log' 


    it 'is sent by Mandrill' 

  end

  describe 'daily_digest' do
    let!(:author) { create :participant }
    let!(:follower) { create :participant }
    let!(:email_preference) {
      create :email_preference,
      email_frequency: :daily,
      participant: follower }
    let!(:topic) { create :topic, participant: author }
    subject(:job) { described_class.perform_later(topic.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    it 'is not sent by Mandrill' 

  end

  describe 'weekly digest' do
    let!(:author) { create :participant }
    let!(:follower) { create :participant }
    let!(:email_preference) {
      create :email_preference,
      email_frequency: :weekly,
      participant: follower }
    let!(:topic) { create :topic, participant: author }
    subject(:job) { described_class.perform_later(topic.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    it 'is not sent by Mandrill' 

  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

end

