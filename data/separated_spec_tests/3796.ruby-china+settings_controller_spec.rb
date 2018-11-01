# frozen_string_literal: true

require "rails_helper"

describe SettingsController, type: :controller do
  let(:user) { create :user }

  describe ":show" do
    it "should work" 


    it "should new work with non user" 

  end

  describe ":reword" do
    it "should work" 

  end

  describe ":account" do
    it "should work" 

  end

  describe ":password" do
    it "should open password when not enable sso" 


    it "should not open when sso enabled" 

  end

  describe ":update" do
    it "should work" 

  end

  describe ":destroy" do
    let(:user) { create :user }
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    it "should redirect to root path after success" 


    it "should render edit after failure" 

  end

  describe ":auto_unbind" do
    it "should word" 


    it "have no provider" 

  end
end

