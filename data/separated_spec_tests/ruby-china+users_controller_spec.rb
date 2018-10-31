# frozen_string_literal: true

require "rails_helper"

describe UsersController, type: :controller do
  let(:user) { create :user, location: "Shanghai" }
  let(:deleted_user) { create :user, state: User.states[:deleted] }

  describe "Visit deleted user" do
    it "should 404 with deleted user" 

  end

  describe ":index" do
    it "should have an index action" 

  end

  describe ":show" do
    it "should show user" 


    it "should show team user" 

  end

  describe ":topics" do
    it "should show user topics" 


    it "should redirect to right spell login" 

  end

  describe ":replies" do
    it "should show user replies" 

  end

  describe ":favorites" do
    it "should show user liked stuffs" 

  end

  describe ":block" do
    it "should work" 

  end

  describe ":unblock" do
    it "should work" 

  end

  describe ":blocked" do
    it "should work" 


    it "render 404 for wrong user" 

  end

  describe ":follow" do
    it "should work" 

  end

  describe ":unfollow" do
    it "should work" 

  end

  describe ":followers" do
    it "should work" 

  end

  describe ":following" do
    it "should work" 

  end

  describe ":city" do
    it "should render 404 if there is no user in that city" 


    it "should show user associated with that city" 

  end

  describe ":calendar" do
    it "should work" 

  end

  describe ".reward" do
    it "should not allow user close" 

  end
end

