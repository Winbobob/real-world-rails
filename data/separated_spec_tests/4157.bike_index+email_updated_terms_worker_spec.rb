require 'spec_helper'

describe EmailUpdatedTermsWorker do
  it { is_expected.to be_processed_in :afterwards }
  let(:user) { FactoryGirl.create(:organization_member) }
  let(:subject) { EmailUpdatedTermsWorker.new }
  before do
    subject.redis.expire(subject.enqueued_emails_key, 0)
    ActionMailer::Base.deliveries = []
  end

  context 'user id enqueued' do
    it 'sends the updated email' 

  end

  context 'user id not enqueued' do
    it 'does not send the updated email' 

  end

  context 'Mailer errors' do
    it 'pushes the email key back on the updated email' 

  end

  context 'user not found' do
    it 'removes from the redis list' 

  end
end

