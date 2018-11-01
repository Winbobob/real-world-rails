require 'rails_helper'
require 'promotion'

describe Promotion do

  describe "review" do
    it "skips regular users" 

  end

  context "newuser" do

    let(:user) { Fabricate(:user, trust_level: TrustLevel[0], created_at: 2.days.ago) }
    let(:promotion) { Promotion.new(user) }

    it "doesn't raise an error with a nil user" 


    context 'that has done nothing' do
      let!(:result) { promotion.review }

      it "returns false" 


      it "has not changed the user's trust level" 

    end

    context "that has done the requisite things" do

      before do
        stat = user.user_stat
        stat.topics_entered = SiteSetting.tl1_requires_topics_entered
        stat.posts_read_count = SiteSetting.tl1_requires_read_posts
        stat.time_read = SiteSetting.tl1_requires_time_spent_mins * 60
        @result = promotion.review
      end

      it "returns true" 


      it "has upgraded the user to basic" 

    end

    context "that has not done the requisite things" do
      it "does not promote the user" 

    end

    context "may send tl1 promotion messages" do
      before do
        stat = user.user_stat
        stat.topics_entered = SiteSetting.tl1_requires_topics_entered
        stat.posts_read_count = SiteSetting.tl1_requires_read_posts
        stat.time_read = SiteSetting.tl1_requires_time_spent_mins * 60
      end
      it "sends promotion message by default" 


      it "does not not send when the user already has the tl1 badge when recalculcating" 


      it "can be turned off" 

    end

  end

  context "basic" do

    let(:user) { Fabricate(:user, trust_level: TrustLevel[1], created_at: 2.days.ago) }
    let(:promotion) { Promotion.new(user) }

    context 'that has done nothing' do
      let!(:result) { promotion.review }

      it "returns false" 


      it "has not changed the user's trust level" 

    end

    context "that has done the requisite things" do

      before do
        stat = user.user_stat
        stat.topics_entered = SiteSetting.tl2_requires_topics_entered
        stat.posts_read_count = SiteSetting.tl2_requires_read_posts
        stat.time_read = SiteSetting.tl2_requires_time_spent_mins * 60
        stat.days_visited = SiteSetting.tl2_requires_days_visited * 60
        stat.likes_received = SiteSetting.tl2_requires_likes_received
        stat.likes_given = SiteSetting.tl2_requires_likes_given
        stat.topic_reply_count = SiteSetting.tl2_requires_topic_reply_count

        @result = promotion.review
      end

      it "returns true" 


      it "has upgraded the user to regular" 

    end

    context "when the account hasn't existed long enough" do
      it "does not promote the user" 

    end

  end

  context "regular" do
    let(:user) { Fabricate(:user, trust_level: TrustLevel[2]) }
    let(:promotion) { Promotion.new(user) }

    context "doesn't qualify for promotion" do
      before do
        TrustLevel3Requirements.any_instance.expects(:requirements_met?).at_least_once.returns(false)
      end

      it "review_tl2 returns false" 


      it "doesn't promote" 


      it "doesn't log a trust level change" 

    end

    context "qualifies for promotion" do
      before do
        TrustLevel3Requirements.any_instance.expects(:requirements_met?).at_least_once.returns(true)
      end

      it "review_tl2 returns true" 


      it "promotes to tl3" 


      it "logs a trust level change" 

    end
  end

end

