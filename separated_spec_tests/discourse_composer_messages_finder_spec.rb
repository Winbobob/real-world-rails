# encoding: utf-8
require 'rails_helper'
require 'composer_messages_finder'

describe ComposerMessagesFinder do

  context "delegates work" do
    let(:user) { Fabricate.build(:user) }
    let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'createTopic') }

    it "calls all the message finders" 


  end

  context '.check_education_message' do
    let(:user) { Fabricate.build(:user) }

    context 'creating topic' do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'createTopic') }

      before do
        SiteSetting.educate_until_posts = 10
      end

      it "returns a message for a user who has not posted any topics" 


      it "returns no message when the user has posted enough topics" 

    end

    context 'private message' do
      let(:topic) { Fabricate(:private_message_topic) }

      context 'starting a new private message' do
        let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'createTopic', topic_id: topic.id) }

        it 'should return an empty string' 

      end

      context 'replying to a private message' do
        let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply', topic_id: topic.id) }

        it 'should return an empty string' 

      end
    end

    context 'creating reply' do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply') }

      before do
        SiteSetting.educate_until_posts = 10
      end

      it "returns a message for a user who has not posted any topics" 


      it "returns no message when the user has posted enough topics" 

    end
  end

  context '.check_new_user_many_replies' do
    let(:user) { Fabricate.build(:user) }

    context 'replying' do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply') }

      it "has no message when `posted_too_much_in_topic?` is false" 


      it "has a message when a user has posted too much" 

    end

  end

  context '.check_avatar_notification' do
    let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'createTopic') }
    let(:user) { Fabricate(:user) }

    context "success" do
      let!(:message) { finder.check_avatar_notification }

      it "returns an avatar upgrade message" 


      it "creates a notified_about_avatar log" 

    end

    it "doesn't return notifications for new users" 


    it "doesn't return notifications for users who have custom avatars" 


    it "doesn't notify users who have been notified already" 


    it "doesn't notify users if 'disable_avatar_education_message' setting is enabled" 


    it "doesn't notify users if 'sso_overrides_avatar' setting is enabled" 


    it "doesn't notify users if 'allow_uploaded_avatars' setting is disabled" 

  end

  context '.check_sequential_replies' do
    let(:user) { Fabricate(:user) }
    let(:topic) { Fabricate(:topic) }

    before do
      SiteSetting.educate_until_posts = 10
      user.stubs(:post_count).returns(11)

      Fabricate(:post, topic: topic, user: user)
      Fabricate(:post, topic: topic, user: user)

      SiteSetting.sequential_replies_threshold = 2
    end

    it "does not give a message for new topics" 


    it "does not give a message without a topic id" 


    context "reply" do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply', topic_id: topic.id) }

      it "does not give a message to users who are still in the 'education' phase" 


      it "doesn't notify a user it has already notified about sequential replies" 


      it "will notify you if it hasn't in the current topic" 


      it "doesn't notify a user who has less than the `sequential_replies_threshold` threshold posts" 


      it "doesn't notify a user if another user posted" 


      it "doesn't notify in a message" 


      context "success" do
        let!(:message) { finder.check_sequential_replies }

        it "returns a message" 


        it "creates a notified_about_sequential_replies log" 


      end
    end

  end

  context '.check_dominating_topic' do
    let(:user) { Fabricate(:user) }
    let(:topic) { Fabricate(:topic) }

    before do
      SiteSetting.educate_until_posts = 10
      user.stubs(:post_count).returns(11)

      SiteSetting.summary_posts_required = 1

      Fabricate(:post, topic: topic, user: user)
      Fabricate(:post, topic: topic, user: user)
      Fabricate(:post, topic: topic, user: Fabricate(:user))

      SiteSetting.sequential_replies_threshold = 2
    end

    it "does not give a message for new topics" 


    it "does not give a message without a topic id" 


    context "reply" do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply', topic_id: topic.id) }

      it "does not give a message to users who are still in the 'education' phase" 


      it "does not notify if the `summary_posts_required` has not been reached" 


      it "doesn't notify a user it has already notified in this topic" 


      it "notifies a user if the topic is different" 


      it "doesn't notify a user if the topic has less than `summary_posts_required` posts" 


      it "doesn't notify a user if they've posted less than the percentage" 


      it "doesn't notify you if it's your own topic" 


      it "doesn't notify you in a private message" 


      context "success" do
        let!(:message) { finder.check_dominating_topic }

        it "returns a message" 


        it "creates a notified_about_dominating_topic log" 


      end
    end

  end

  context '.check_get_a_room' do
    let(:user) { Fabricate(:user) }
    let(:other_user) { Fabricate(:user) }
    let(:third_user) { Fabricate(:user) }
    let(:topic) { Fabricate(:topic, user: other_user) }
    let(:op) { Fabricate(:post, topic_id: topic.id, user: other_user) }

    let!(:other_user_reply) do
      Fabricate(:post, topic: topic, user: third_user, reply_to_user_id: op.user_id)
    end

    let!(:first_reply) do
      Fabricate(:post, topic: topic, user: user, reply_to_user_id: op.user_id)
    end

    let!(:second_reply) do
      Fabricate(:post, topic: topic, user: user, reply_to_user_id: op.user_id)
    end

    before do
      SiteSetting.educate_until_posts = 10
      user.stubs(:post_count).returns(11)
      SiteSetting.get_a_room_threshold = 2
    end

    it "does not show the message for new topics" 


    it "does not give a message without a topic id" 


    context "reply" do
      let(:finder) { ComposerMessagesFinder.new(user, composer_action: 'reply', topic_id: topic.id, post_id: op.id) }

      it "does not give a message to users who are still in the 'education' phase" 


      it "doesn't notify a user it has already notified about sequential replies" 


      it "will notify you if it hasn't in the current topic" 


      it "won't notify you if you haven't had enough posts" 


      it "doesn't notify you if the posts aren't all to the same person" 


      it "doesn't notify you of posts to yourself" 


      it "doesn't notify in a message" 


      it "doesn't notify when replying to a different user" 


      context "with a default min_users_posted value" do
        let!(:message) { finder.check_get_a_room }

        it "works as expected" 

      end

      context "success" do
        let!(:message) { finder.check_get_a_room(min_users_posted: 2) }

        it "works as expected" 

      end
    end

  end

  context '.check_reviving_old_topic' do
    let(:user)  { Fabricate(:user) }
    let(:topic) { Fabricate(:topic) }

    it "does not give a message without a topic id" 


    context "a reply" do
      context "warn_reviving_old_topic_age is 180 days" do
        before do
          SiteSetting.warn_reviving_old_topic_age = 180
        end

        it "does not notify if last post is recent" 


        it "notifies if last post is old" 

      end

      context "warn_reviving_old_topic_age is 0" do
        before do
          SiteSetting.warn_reviving_old_topic_age = 0
        end

        it "does not notify if last post is new" 


        it "does not notify if last post is old" 

      end
    end
  end

end

