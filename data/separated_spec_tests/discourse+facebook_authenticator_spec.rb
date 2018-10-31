require 'rails_helper'

describe Auth::FacebookAuthenticator do

  context 'after_authenticate' do
    it 'can authenticate and create a user record for already existing users' 


    it 'can connect to a different existing user account' 


    it 'can create a proper result for non existing users' 

  end

  context 'description_for_user' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::FacebookAuthenticator.new }

    it 'returns empty string if no entry for user' 


    it 'returns correct information' 

  end

  context 'revoke' do
    let(:user) { Fabricate(:user) }
    let(:authenticator) { Auth::FacebookAuthenticator.new }

    it 'raises exception if no entry for user' 


    context "with valid record" do
      before do
        SiteSetting.facebook_app_id = '123'
        SiteSetting.facebook_app_secret = 'abcde'
        FacebookUserInfo.create!(user_id: user.id, facebook_user_id: 12345, email: 'someuser@somedomain.tld')
      end

      it 'revokes correctly' 


      it 'handles errors correctly' 

    end
  end

end

