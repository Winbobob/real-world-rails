require 'rails_helper'

describe Auth::GoogleOAuth2Authenticator do

  it 'does not look up user unless email is verified' 


  context 'after_authenticate' do
    it 'can authenticate and create a user record for already existing users' 


    it 'can connect to a different existing user account' 


    it 'can create a proper result for non existing users' 

  end

  context 'revoke' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::GoogleOAuth2Authenticator.new }

    it 'raises exception if no entry for user' 


      it 'revokes correctly' 


  end
end

