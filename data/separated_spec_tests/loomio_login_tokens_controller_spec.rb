require 'rails_helper'

describe LoginTokensController do
  describe 'show' do
    let(:user) { create :user, email: "test@test.com", email_verified: true }
    let(:unverified_user) { create :user, email_verified: false, email: "test@test.com" }
    let(:token) { create :login_token }

    it 'sets a session variable' 


    it 'redirects to the redirect' 

  end
end

