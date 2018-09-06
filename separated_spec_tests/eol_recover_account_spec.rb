require "spec_helper"

describe 'user recover account' do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    @user_token = Digest::SHA1.hexdigest('123')
    @expired_token = Digest::SHA1.hexdigest('456')
    @user = User.gen(username: 'johndoe', email: 'johndoe@example.com',
                     recover_account_token: @user_token,
                     recover_account_token_expires_at: 1.hour.from_now)
    @user_expired = User.gen(username: 'janedoe', email: 'janedoe@example.com',
                             recover_account_token: @expired_token,
                             recover_account_token_expires_at: 1.hour.ago)
  end

  describe 'temporary login' do
    it 'should redirect to recover account if token does not match user token' 


    it 'should redirect to recover account and delete token if token is expired' 


    it 'should log user in and redirect to user edit for valid recover account token' 

  end
end

