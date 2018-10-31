require 'spec_helper'

describe 'OAuth tokens' do
  context 'Resource Owner Password Credentials' do
    def request_oauth_token(user)
      post '/oauth/token', username: user.username, password: user.password, grant_type: 'password'
    end

    context 'when user has 2FA enabled' do
      it 'does not create an access token' 

    end

    context 'when user does not have 2FA enabled' do
      it 'creates an access token' 

    end

    context "when user is blocked" do
      it "does not create an access token" 

    end

    context "when user is ldap_blocked" do
      it "does not create an access token" 

    end
  end
end

