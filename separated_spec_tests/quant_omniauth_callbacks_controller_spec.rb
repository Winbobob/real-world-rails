require 'spec_helper'

describe OmniauthCallbacksController do

  let(:user) {Fabricate(:user)}

  describe "GET 'withings'" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:withings]
      WithingsAccount.any_instance.stub(:import).and_return(true)
    end

    context "when a user is signed in" do
       it "should create a WithingsAccount relation" 
      it "should set a flash notification" 

    end

    context "when there is no current user" do
       it "should redirect to login" 
       it "should create a FitbitAccount relation" 
      it "should set a flash notification" 

    end

    context "when there is no current user" do
       it "should redirect to login" 
      it "show create a FoursquareAccount relation" 

    end

    context "when a user already has a FoursquareAccount" do
      it "should set a flash notification" 

    end

    context "when there is no current user" do
      it "should redirect to login" 

    end
  end
end

