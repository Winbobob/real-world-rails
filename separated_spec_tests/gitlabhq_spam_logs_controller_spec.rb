require 'spec_helper'

describe Admin::SpamLogsController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:first_spam) { create(:spam_log, user: user) }
  let!(:second_spam) { create(:spam_log, user: user) }

  before do
    sign_in(admin)
  end

  describe '#index' do
    it 'lists all spam logs' 

  end

  describe '#destroy' do
    it 'removes only the spam log when removing log' 


    it 'removes user and his spam logs when removing the user' 

  end

  describe '#mark_as_ham' do
    before do
      allow_any_instance_of(AkismetService).to receive(:submit_ham).and_return(true)
    end
    it 'submits the log as ham' 

  end
end

