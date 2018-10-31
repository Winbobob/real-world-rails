require 'rails_helper'

RSpec.describe EmailDigestJob, type: :job do
  include ActiveJob::TestHelper

  describe 'executes the daily digest' do
    let(:participant) { create :participant, :daily }
    subject(:job) { described_class.perform_later("digest_type" => "daily") }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  describe 'executes the weekly digest' do
    let(:participant) { create :participant, :weekly }
    subject(:job) { described_class.perform_later("digest_type" => "weekly") }

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 


  end

  describe 'participant - daily digest: comments only' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant, :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 2 days ago' 


    it 'should receive email for comment from 12 hours ago' 

  end

  describe 'admin - daily digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    before do
      participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)
    end

    it 'should not receive submission info from 2 days ago' 


    it 'should receive submission info from 12 hours ago' 

  end

  describe 'participant - weekly digest: comments only' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant, :daily }
    let!(:topic_author1) { create :participant, :every_email }

    it 'should not receive email comment from 8 days ago' 


    it 'should receive email for comment from 3 days ago' 

  end

  describe 'admin - weekly digest: submissions only' do
    let!(:participant) { create :participant, :admin }
    before do
      participant.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: false, receive_weekly_digest: true)
    end

    it 'should not receive submission info from 8 days ago' 


    it 'should receive submission info from 5 days ago' 

  end

  describe 'admin - daily digest: comments and submissions' do
    let!(:admin) { create :participant, :admin }
    let!(:topic_author1) { create :participant, :every_email }
    before do
      admin.email_preferences.first.update_columns(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)
    end

    it 'daily' 

  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

end

