# frozen_string_literal: true

require "rails_helper"

describe "API V3", "topics", type: :request do
  describe "GET /api/v3/topics.json" do
    it "should be ok" 


    it "should be ok for all types" 


    describe "with logined user" do
      it "should hide user blocked nodes/users" 

    end
  end

  describe "GET /api/v3/topics.json with node_id" do
    let(:node) { create(:node) }
    let(:node1) { create(:node) }

    let(:t1) { create(:topic, node_id: node.id, title: "This is a normal topic", replies_count: 1) }
    let(:t2) { create(:topic, node_id: node.id, title: "This is an excellent topic", excellent: 1, replies_count: 1) }
    let(:t3) { create(:topic, node_id: node.id, title: "This is a no_reply topic", replies_count: 0) }
    let(:t4) { create(:topic, node_id: node.id, title: "This is a popular topic", replies_count: 1, likes_count: 10) }

    it "should return a list of topics that belong to the specified node" 

  end

  describe "POST /api/v3/topics.json" do
    it "should require user" 


    it "should work" 

  end

  describe "POST /api/v3/topics/:id.json" do
    let!(:topic) { create(:topic) }

    it "should require user" 


    it "should return 403 when topic owner is now current_user, and not admin" 


    it "should update with admin user" 


    context "with user" do
      let!(:topic) { create(:topic, user: current_user) }

      it "should work" 


      it "should node update node_id when topic is lock_node" 

    end
  end

  describe "DELETE /api/v3/topics/:id.json" do
    let!(:topic) { create(:topic) }

    it "should require user" 


    it "should return 404 when topic not found" 


    it "should return 403 when topic owner is now current_user, and not admin" 


    it "should destroy with topic owner user" 


    it "should destroy with admin user" 

  end

  describe "GET /api/v3/topics/:id.json" do
    it "should get topic detail with list of replies" 


    it "should return right abilities when owner visit" 


    it "should return right abilities when admin visit" 


    it "should work when id record found" 


    context "liked, followed, favorited" do
      let(:topic) { create(:topic) }

      it "should work" 

    end
  end

  describe "GET /api/v3/topic/:id/replies.json" do
    context "no login" do
      it "should work" 

    end

    context "has login" do
      it "should work" 

    end

    context "admin login" do
      it "should return right abilities when admin visit" 

    end
  end

  describe "POST /api/v3/topics/:id/replies.json" do
    it "should post a new reply" 


    it "should not create Reply when Topic was closed" 

  end

  describe "POST /api/v3/topics/:id/follow.json" do
    it "should follow a topic" 

  end

  describe "POST /api/v3/topics/:id/unfollow.json" do
    it "should unfollow a topic" 

  end

  describe "POST /api/v3/topics/:id/favorite.json" do
    it "should favorite a topic" 

  end

  describe "POST /api/v3/topics/:id/unfavorite.json" do
    it "should unfavorite a topic" 

  end

  describe "POST /api/v3/topics/:id/ban.json" do
    it "should work with admin" 


    it "should not ban a topic with normal user" 

  end

  describe "POST /api/v3/topics/:id/action.json" do
    %w[excellent unexcellent ban].each do |action|
      describe action.to_s do
        it "should work with admin" 


        it "should not work with normal user" 

      end
    end

    %w[close open].each do |action|
      describe action.to_s do
        it "should work with admin" 


        it "should work with owner" 


        it "should not work with other users" 

      end
    end
  end
end

