require 'rails_helper'
require 'new_post_manager'

describe NewPostManager do

  let(:topic) { Fabricate(:topic) }

  context "default action" do
    it "creates the post by default" 

  end

  context "default action" do
    let(:other_user) { Fabricate(:user) }

    it "doesn't enqueue private messages" 


  end

  context "default handler" do
    let(:manager) { NewPostManager.new(topic.user, raw: 'this is new post content', topic_id: topic.id) }

    context 'with the settings zeroed out' do
      before do
        SiteSetting.approve_post_count = 0
        SiteSetting.approve_unless_trust_level = 0
      end

      it "doesn't return a result action" 

    end

    context 'with a high approval post count and TL0' do
      before do
        SiteSetting.approve_post_count = 100
        topic.user.trust_level = 0
      end
      it "will return an enqueue result" 

    end

    context 'with a high approval post count and TL1' do
      before do
        SiteSetting.approve_post_count = 100
        topic.user.trust_level = 1
      end
      it "will return an enqueue result" 

    end

    context 'with a high approval post count, but TL2' do
      before do
        SiteSetting.approve_post_count = 100
        topic.user.trust_level = 2
      end
      it "will return an enqueue result" 

    end

    context 'with a high trust level setting' do
      before do
        SiteSetting.approve_unless_trust_level = 4
      end
      it "will return an enqueue result" 

    end

    context 'with staged moderation setting enabled' do
      before do
        SiteSetting.approve_unless_staged = true
        topic.user.staged = true
      end
      it "will return an enqueue result" 

    end

    context 'with a high trust level setting for new topics but post responds to existing topic' do
      before do
        SiteSetting.approve_new_topics_unless_trust_level = 4
      end
      it "doesn't return a result action" 

    end

  end

  context "new topic handler" do
    let(:manager) { NewPostManager.new(topic.user, raw: 'this is new topic content', title: 'new topic title') }
    context 'with a high trust level setting for new topics' do
      before do
        SiteSetting.approve_new_topics_unless_trust_level = 4
      end
      it "will return an enqueue result" 

    end

  end

  context "extensibility priority" do

    after do
      NewPostManager.clear_handlers!
    end

    let(:default_handler) { NewPostManager.method(:default_handler) }

    it "adds in order by default" 


    it "can be added in high priority" 


  end

  context "extensibility" do

    before do
      @counter = 0

      @counter_handler = lambda do |manager|
        result = nil
        if manager.args[:raw] == 'this post increases counter'
          @counter += 1
          result = NewPostResult.new(:counter, true)
        end

        result
      end

      @queue_handler = -> (manager) { manager.args[:raw] =~ /queue me/ ? manager.enqueue('default') : nil }

      NewPostManager.add_handler(&@counter_handler)
      NewPostManager.add_handler(&@queue_handler)
    end

    after do
      NewPostManager.clear_handlers!
    end

    it "has a queue enabled" 


    it "calls custom handlers" 


    it "calls custom enqueuing handlers" 


    it "if nothing returns a result it creates a post" 


  end

  context "user needs approval?" do

    let :user do
      user = Fabricate.build(:user, trust_level: 0)
      user_stat = UserStat.new(post_count: 0)
      user.user_stat = user_stat
      user
    end

    it "handles post_needs_approval? correctly" 

  end

end

