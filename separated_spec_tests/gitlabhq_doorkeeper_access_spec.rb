require 'spec_helper'

describe 'doorkeeper access' do
  let!(:user) { create(:user) }
  let!(:application) { Doorkeeper::Application.create!(name: "MyApp", redirect_uri: "https://app.com", owner: user) }
  let!(:token) { Doorkeeper::AccessToken.create! application_id: application.id, resource_owner_id: user.id, scopes: "api" }

  describe "unauthenticated" do
    it "returns authentication success" 


    include_examples 'user login request with unique ip limit' do
      def request
        get api('/user'), access_token: token.token
      end
    end
  end

  describe "when token invalid" do
    it "returns authentication error" 

  end

  describe "authorization by OAuth token" do
    it "returns authentication success" 


    include_examples 'user login request with unique ip limit' do
      def request
        get api('/user', user)
      end
    end
  end

  describe "when user is blocked" do
    it "returns authorization error" 

  end

  describe "when user is ldap_blocked" do
    it "returns authorization error" 

  end
end

