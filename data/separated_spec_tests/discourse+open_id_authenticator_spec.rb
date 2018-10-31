require 'rails_helper'

describe Auth::OpenIdAuthenticator do

  it "can lookup pre-existing user if trusted" 


  it "raises an exception when email is missing" 


  it 'can connect to a different existing user account' 


  context 'revoke' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::OpenIdAuthenticator.new("test", "id", "enable_yahoo_logins", trusted: true) }

    it 'raises exception if no entry for user' 


      it 'revokes correctly' 


  end
end

