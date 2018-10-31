require 'spec_helper'

describe UserConfirmationsController, type: :controller do
  include AuthenticationWorkflow
  let!(:user) { create_enterprise_user }
  let!(:confirmed_user) { create_enterprise_user(confirmed_at: nil) }
  let!(:unconfirmed_user) { create_enterprise_user(confirmed_at: nil) }
  let!(:confirmed_token) { confirmed_user.confirmation_token }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:spree_user]
    confirmed_user.confirm!
  end

  context "confirming a user" do
    context "that has already been confirmed" do

      before do
        spree_get :show, confirmation_token: confirmed_token
      end

      it "redirects the user to login" 

    end

    context "that has not been confirmed" do
      it "confirms the user" 


      it "redirects the user to #/login by default" 


      it "redirects to previous url, if present" 


      it "redirects to previous url on /register path" 


      it "redirects to set password page, if user needs to reset their password" 

    end
  end

  context "requesting confirmation instructions to be resent" do
    before { create(:mail_method) }

    it "redirects the user to login" 


    it "sends the confirmation email" 

  end
end

