# frozen_string_literal: true

require "rails_helper"

describe PasswordsController, type: :controller do
  describe ":new" do
    before { request.env["devise.mapping"] = Devise.mappings[:user] }

    it "should render new tempalte" 


    it "should redirect to sso login" 

  end

  describe ":create" do
    let(:user) { create(:user) }
    before { request.env["devise.mapping"] = Devise.mappings[:user] }

    it "should work" 

    it "should redirect to sign in path after success" 

  end
end

