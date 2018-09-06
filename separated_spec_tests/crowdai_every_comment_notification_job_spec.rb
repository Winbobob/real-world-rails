require 'rails_helper'

RSpec.describe EveryCommentNotificationJob, type: :job do
  include ActiveJob::TestHelper

  describe 'receive_every_email' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    it 'writes to the email log' 


    it 'is sent by Mandrill' 

  end

  describe 'daily_digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :daily, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


    it 'is not sent by Mandrill' 

  end

  describe 'weekly digest' do
    let!(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :weekly, participant: participant }
    let!(:topic) { create :topic, participant: participant }
    let!(:comment) { create :comment, topic: topic, participant: participant }
    subject(:job) { described_class.perform_later(comment.id) }

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

