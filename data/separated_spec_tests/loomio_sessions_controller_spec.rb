require 'rails_helper'

describe API::SessionsController do
  describe 'create' do
    let(:user) { create :user, email: "test@test.com", email_verified: true }
    let(:unverified_user) { create :user, email_verified: false, email: "test@test.com" }
    let(:token) { create :login_token }

    describe 'via token' do
      before do
        session[:pending_token] = token.token
        request.env["devise.mapping"] = Devise.mappings[:user]
      end

      it 'signs in a user' 


      it 'updates a name' 


      it 'does not sign in a user with a used token' 


      it 'does not sign in a user with an expired token' 


      it 'does not sign in a user with an invalid token id' 


      it 'finds a verified user to sign in' 


      it 'signs in an unverified user' 

    end
  end
end

