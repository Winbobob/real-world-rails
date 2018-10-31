# frozen_string_literal: true

require "rails_helper"

describe SessionsController, type: :controller do
  describe ":new" do
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    it "should render new template" 


    it "should redirect to sso login" 


    context "cache referrer" do
      it "should store referrer if it's from self site" 

    end
  end

  describe ":create" do
    let (:user) { create(:user) }
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    it "should redirect to home" 


    it "should render json" 

  end
end

