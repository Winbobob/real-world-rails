require 'spec_helper'

describe Profiles::PersonalAccessTokensController do
  let(:user) { create(:user) }
  let(:token_attributes) { attributes_for(:personal_access_token) }

  before do
    sign_in(user)
  end

  describe '#create' do
    def created_token
      PersonalAccessToken.order(:created_at).last
    end

    it "allows creation of a token with scopes" 


    it "allows creation of a token with an expiry date" 

  end

  describe '#index' do
    let!(:active_personal_access_token) { create(:personal_access_token, user: user) }
    let!(:inactive_personal_access_token) { create(:personal_access_token, :revoked, user: user) }
    let!(:impersonation_personal_access_token) { create(:personal_access_token, :impersonation, user: user) }

    before do
      get :index
    end

    it "retrieves active personal access tokens" 


    it "retrieves inactive personal access tokens" 


    it "does not retrieve impersonation personal access tokens" 

  end
end

