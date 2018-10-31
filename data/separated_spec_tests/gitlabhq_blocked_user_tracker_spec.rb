require 'spec_helper'

describe Gitlab::Auth::BlockedUserTracker do
  set(:user) { create(:user) }

  describe '.log_if_user_blocked' do
    it 'does not log if user failed to login due to undefined reason' 


    it 'gracefully handles malformed environment variables' 


    context 'failed login due to blocked user' do
      let(:env) do
        {
          'warden.options' => { message: User::BLOCKED_MESSAGE },
          described_class::ACTIVE_RECORD_REQUEST_PARAMS => { 'user' => { 'login' => user.username } }
        }
      end

      subject { described_class.log_if_user_blocked(env) }

      before do
        expect_any_instance_of(SystemHooksService).to receive(:execute_hooks_for).with(user, :failed_login)
      end

      it 'logs a blocked user' 


      it 'logs a blocked user by e-mail' 


      it 'logs a LDAP blocked user' 

    end
  end
end

