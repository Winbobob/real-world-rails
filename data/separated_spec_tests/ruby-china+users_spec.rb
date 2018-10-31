# frozen_string_literal: true

require "rails_helper"

describe "API V3", "users", type: :request do
  describe "GET /api/v3/users.json" do
    before do
      create_list(:user, 10)
    end

    it "should work" 


    it "should work :limit" 

  end

  describe "GET /api/v3/users/me.json" do
    it "should 403 when not login" 


    it "should work" 

  end

  describe "GET /api/v3/users/:login.json" do
    it "should get user details with list of topics" 


    it "should hidden email when email_public is false" 


    it "should get right meta info" 


    it "should not hidden email when current_user itself" 

  end

  describe "GET /api/v3/users/:login/topics.json" do
    let(:user) { create(:user) }

    describe "recent order" do
      it "should work" 

    end

    describe "hot order" do
      it "should work" 

    end

    describe "hot order" do
      it "should work" 

    end
  end

  describe "GET /api/v3/users/:login/replies.json" do
    let(:user) { create(:user) }
    let(:topic) { create(:topic, title: "Test topic title") }

    describe "recent order" do
      it "should work" 

    end
  end

  describe "GET /api/v3/users/:login/favorites.json" do
    let(:user) { create(:user) }

    it "should work" 

  end

  describe "GET /api/v3/users/:login/followers.json" do
    let(:user) { create(:user) }

    it "should work" 

  end

  describe "GET /api/v3/users/:login/blocked.json" do
    let(:user) { create(:user) }

    it "require login" 


    it "only visit itself" 


    it "should work" 

  end

  describe "GET /api/v3/users/:login/following.json" do
    let(:user) { create(:user) }

    it "should work" 

  end

  describe "POST /api/v3/users/:login/follow.json / unfollow" do
    let(:user) { create(:user) }

    it "should 401 when nologin" 


    it "should follow work" 


    it "should unfollow work" 

  end

  describe "POST /api/v3/users/:login/block.json / unblock.json" do
    let(:user) { create(:user) }

    it "should 401 when nologin" 


    it "should work" 


    it "should unfollow" 

  end
end

