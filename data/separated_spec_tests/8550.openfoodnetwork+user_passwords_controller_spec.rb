require 'spec_helper'
require 'spree/api/testing_support/helpers'

describe UserPasswordsController, type: :controller do
  let(:user) { create(:user) }
  let(:unconfirmed_user) { create(:user, confirmed_at: nil) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:spree_user]
  end

  describe "create" do
    it "returns errors" 


    it "redirects to login when data is valid" 

  end

  describe "edit" do
    context "when given a redirect" do
      it "stores the redirect path in 'spree_user_return_to'" 

    end
  end

  it "renders Darkswarm" 


  describe "via ajax" do
    it "returns error when email not found" 


    it "returns error when user is unconfirmed" 

  end
end

