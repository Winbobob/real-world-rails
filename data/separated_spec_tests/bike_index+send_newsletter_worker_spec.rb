require 'spec_helper'

describe SendNewsletterWorker do
  it { is_expected.to be_processed_in :notify }
  let(:subject) { SendNewsletterWorker }
  let(:instance) { subject.new }

  context 'no id passed' do
    let(:user) { FactoryGirl.create(:confirmed_user, is_emailable: true, banned: false) }
    let(:user_unemailable) { FactoryGirl.create(:confirmed_user, is_emailable: false) }
    let(:user_banned) { FactoryGirl.create(:confirmed_user, is_emailable: true, banned: true) }
    let(:user_unconfirmed) { FactoryGirl.create(:user, is_emailable: true, banned: false) }
    it 'enqueues sending to emails' 

  end
end

