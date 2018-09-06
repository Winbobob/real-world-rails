# frozen_string_literal: true

require "rails_helper"

describe TopicsHelper, type: :helper do
  describe "topic_favorite_tag" do
    let(:user) { create :user }
    let(:topic) { create :topic }

    it "should run with nil param" 


    it "should result when logined user did not favorite topic" 


    it "should result when logined user favorited topic" 


    it "should result blank when unlogin user" 

  end

  describe "topic_title_tag" do
    let(:topic) { create :topic, title: "test title" }
    let(:user) { create :user }

    it "should return topic_was_deleted without a topic" 


    it "should return title with a topic" 

  end

  describe "topic_follow_tag" do
    let(:topic) { create :topic }
    let(:user) { create :user }

    it "should return empty when current_user is nil" 


    it "should return empty when is owner" 


    it "should return empty when topic is nil" 


    context "was unfollow" do
      it "should work" 

    end

    context "was active" do
      it "should work" 

    end
  end
end

