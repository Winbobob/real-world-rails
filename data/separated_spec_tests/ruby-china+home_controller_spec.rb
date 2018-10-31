# frozen_string_literal: true

require "rails_helper"

describe HomeController, type: :controller do
  describe ":index" do
    let(:user) { create :user }
    it "should show register link if user not signed in" 


    it "should not show register link if sso enabled" 


    it "should have hot topic lists if user is signed in" 

  end

  describe ":uploads" do
    it "render 404 for non-existed file" 

  end

  describe ":api" do
    it "should redirect to /api-doc" 

  end
end

