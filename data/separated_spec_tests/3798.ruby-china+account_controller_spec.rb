# frozen_string_literal: true

require "rails_helper"

describe AccountController, type: :controller do
  describe ":new" do
    before { request.env["devise.mapping"] = Devise.mappings[:user] }

    it "should render new template" 


    it "should redirect to sso login" 

  end

  describe ":create" do
    let(:user) { create :user }
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    it "should work" 

  end

  describe ":edit" do
    let(:user) { create :user }
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    it "should work" 

  end
end

