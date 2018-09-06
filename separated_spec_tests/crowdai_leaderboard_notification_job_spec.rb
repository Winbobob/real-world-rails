require 'rails_helper'
=begin
RSpec.describe LeaderboardNotificationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:submission) { create :submission }
  let!(:mailer) { create :mailer, mailer_classname: 'LeaderboardNotificationMailer' }
  subject(:job) { described_class.perform_later(submission) }


  describe 'executes the job' do
    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  describe 'receive_every_email' do
    EmailPreference.update_all(receive_every_email: true, receive_daily_digest: false, receive_weekly_digest: false)

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  describe 'daily_digest' do
    EmailPreference.update_all(receive_every_email: false, receive_daily_digest: true, receive_weekly_digest: false)

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

  describe 'weekly digest' do
    EmailPreference.update_all(receive_every_email: false, receive_daily_digest: false, receive_weekly_digest: true)

    it 'queues the job' 


    it 'is placed on the default queue' 


    it 'executes with no errors' 

  end

end
=end

