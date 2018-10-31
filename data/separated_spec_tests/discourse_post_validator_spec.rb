require 'rails_helper'
require_dependency 'validators/post_validator'

describe Validators::PostValidator do
  let(:post) { build(:post, topic: Fabricate(:topic)) }
  let(:validator) { Validators::PostValidator.new({}) }

  context "#post_body_validator" do
    it 'should not allow a post with an empty raw' 


    context "when empty raw can bypass validation" do
      let(:validator) { Validators::PostValidator.new(skip_post_body: true) }

      it "should be allowed for empty raw based on site setting" 

    end

    describe "when post's topic is a PM between a human and a non human user" do
      let(:robot) { Fabricate(:user, id: -3) }
      let(:user) { Fabricate(:user) }

      let(:topic) do
        Fabricate(:private_message_topic, topic_allowed_users: [
          Fabricate.build(:topic_allowed_user, user: robot),
          Fabricate.build(:topic_allowed_user, user: user)
        ])
      end

      it 'should allow a post with an empty raw' 

    end
  end

  context "stripped_length" do
    it "adds an error for short raw" 


    it "adds no error for long raw" 

  end

  context "too_many_posts" do
    it "should be invalid when the user has posted too much" 


    it "should be allowed to edit when the user has posted too much" 


    it "should be valid when the user hasn't posted too much" 

  end

  context "too_many_mentions" do
    before do
      SiteSetting.newuser_max_mentions_per_post = 2
      SiteSetting.max_mentions_per_post = 3
    end

    it "should be invalid when new user exceeds max mentions limit" 


    it "should be invalid when leader user exceeds max mentions limit" 


    it "should be valid when new user does not exceed max mentions limit" 


    it "should be valid when new user exceeds max mentions limit in PM" 


    it "should be valid when leader user does not exceed max mentions limit" 


    it "should be valid for moderator in all cases" 


    it "should be valid for admin in all cases" 

  end

  context "too_many_images" do
    before do
      SiteSetting.min_trust_to_post_images = 0
      SiteSetting.newuser_max_images = 2
    end

    it "should be invalid when new user exceeds max mentions limit" 


    it "should be valid when new user does not exceed max mentions limit" 


    it "should be invalid when user trust level is not sufficient" 


    it "should be valid for moderator in all cases" 


    it "should be valid for admin in all cases" 

  end

  context "invalid post" do
    it "should be invalid" 

  end

  describe "unique_post_validator" do
    before do
      SiteSetting.unique_posts_mins = 5
    end

    context "post is unique" do
      before do
        post.stubs(:matches_recent_post?).returns(false)
      end

      it "should not add an error" 

    end

    context "post is not unique" do
      before do
        post.stubs(:matches_recent_post?).returns(true)
      end

      it "should add an error" 


      it "should not add an error if post.skip_unique_check is true" 

    end
  end

  shared_examples "almost no validations" do
    it "skips most validations" 

  end

  context "admin editing a static page" do
    before do
      post.acting_user = build(:admin)
      SiteSetting.tos_topic_id = post.topic_id
    end

    include_examples "almost no validations"
  end

  context "staged user" do
    before { post.acting_user = build(:user, staged: true) }
    include_examples "almost no validations"
  end

end

