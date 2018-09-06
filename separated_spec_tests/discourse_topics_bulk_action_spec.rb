require 'rails_helper'
require_dependency 'topics_bulk_action'

describe TopicsBulkAction do

  describe "dismiss_posts" do
    it "dismisses posts" 

  end

  describe "invalid operation" do
    let(:user) { Fabricate.build(:user) }

    it "raises an error with an invalid operation" 

  end

  describe "change_category" do
    let(:topic) { Fabricate(:topic) }
    let(:category) { Fabricate(:category) }

    context "when the user can edit the topic" do
      it "changes the category and returns the topic_id" 

    end

    context "when the user can't edit the topic" do
      it "doesn't change the category" 

    end
  end

  describe "reset_read" do
    let(:topic) { Fabricate(:topic) }

    it "delegates to PostTiming.destroy_for" 

  end

  describe "delete" do
    let(:topic) { Fabricate(:post).topic }
    let(:moderator) { Fabricate(:moderator) }

    it "deletes the topic" 

  end

  describe "change_notification_level" do
    let(:topic) { Fabricate(:topic) }

    context "when the user can see the topic" do
      it "updates the notification level" 

    end

    context "when the user can't see the topic" do
      it "doesn't change the level" 

    end
  end

  describe "close" do
    let(:topic) { Fabricate(:topic) }

    context "when the user can moderate the topic" do
      it "closes the topic and returns the topic_id" 

    end

    context "when the user can't edit the topic" do
      it "doesn't close the topic" 

    end
  end

  describe "archive" do
    let(:topic) { Fabricate(:topic) }

    context "when the user can moderate the topic" do
      it "archives the topic and returns the topic_id" 

    end

    context "when the user can't edit the topic" do
      it "doesn't archive the topic" 

    end
  end

  describe "unlist" do
    let(:topic) { Fabricate(:topic) }

    context "when the user can moderate the topic" do
      it "unlists the topic and returns the topic_id" 

    end

    context "when the user can't edit the topic" do
      it "doesn't unlist the topic" 

    end
  end

  describe "change_tags" do
    let(:topic) { Fabricate(:topic) }
    let(:tag1)  { Fabricate(:tag) }
    let(:tag2)  { Fabricate(:tag) }

    before do
      SiteSetting.tagging_enabled = true
      SiteSetting.min_trust_level_to_tag_topics = 0
      topic.tags = [tag1, tag2]
    end

    it "can change the tags, and can create new tags" 


    it "can change the tags but not create new ones" 


    it "can remove all tags" 


    context "when user can't edit topic" do
      before do
        Guardian.any_instance.expects(:can_edit?).returns(false)
      end

      it "doesn't change the tags" 

    end
  end

  describe "append tags" do
    let(:topic) { Fabricate(:topic) }
    let(:tag1)  { Fabricate(:tag) }
    let(:tag2)  { Fabricate(:tag) }
    let(:tag3)  { Fabricate(:tag) }

    before do
      SiteSetting.tagging_enabled = true
      SiteSetting.min_trust_level_to_tag_topics = 0
      topic.tags = [tag1, tag2]
    end

    it "can append new or existing tags" 


    it "can append empty tags" 


    context "when the user can't create new topics" do
      before do
        SiteSetting.min_trust_to_create_tag = 4
      end

      it "can append existing tags but doesn't append new tags" 

    end

    context "when user can't edit topic" do
      before do
        Guardian.any_instance.expects(:can_edit?).returns(false)
      end

      it "doesn't change the tags" 

    end
  end
end

