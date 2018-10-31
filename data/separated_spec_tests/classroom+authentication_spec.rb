# frozen_string_literal: true

require "rails_helper"

RSpec.describe "OAuth scope requirements", type: :request do
  let(:organization) { classroom_org }

  describe "organizations#show", :vcr do
    context "unauthenticated request" do
      it "redirects to sessions#new" 


      it "sets required scopes in session" 

    end

    context "authenticated request" do
      before(:each) do
        get url_for(organization)
        get response.redirect_url # http://www.example.com/login
        get response.redirect_url # http://www.example.com/auth/github?scope=user%3Aemail%2Crepo%2Cdelete_repo%2Cadmin%3Aorg%2Cadmin%3Aorg_hook
        get response.redirect_url # http://www.example.com/auth/github/callback
      end

      it "renders organizations#show" 

    end
  end

  describe "sessions#new" do
    before(:each) do
      get url_for(organization)
    end

    it "redirects to omniauth" 

  end

  describe "sessions#failure" do
    it "redirects to the homepage with an error" 

  end

  describe "OAuth dance", :vcr do
    before(:each) do
      get url_for(organization)
      get response.redirect_url # http://www.example.com/login
      get response.redirect_url # http://www.example.com/auth/github?scope=user%3Aemail%2Crepo%2Cdelete_repo%2Cadmin%3Aorg%2Cadmin%3Aorg_hook
    end

    it "redirects back to organizations#show" 

  end
end

