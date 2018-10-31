require 'rails_helper'

# For autospec:
Auth.send(:remove_const, :GoogleOAuth2Authenticator)
load 'auth/google_oauth2_authenticator.rb'

describe Auth::GoogleOAuth2Authenticator do

  it 'does not look up user unless email is verified' 


  context 'after_authenticate' do
    it 'can authenticate and create a user record for already existing users' 


    it 'can create a proper result for non existing users' 

  end

  context 'after_create_account' do
    it 'confirms email' 


    it "doesn't confirm email if it was changed" 

  end

end

