require 'rails_helper'

describe Jobs::Tl3Promotions do

  def create_qualifying_stats(user)
    user.create_user_stat if user.user_stat.nil?
    user.user_stat.update_attributes!(
      days_visited: 1000,
      topic_reply_count: 1000,
      topics_entered: 1000,
      posts_read_count: 1000,
      likes_given: 1000,
      likes_received: 1000
    )
  end

  subject(:run_job) { described_class.new.execute({}) }

  it "promotes tl2 user who qualifies for tl3" 


  it "doesn't promote tl1 and tl0 users who have met tl3 requirements" 


  context "tl3 user who doesn't qualify for tl3 anymore" do
    def create_leader_user
      user = Fabricate(:user, trust_level: TrustLevel[2])
      TrustLevel3Requirements.any_instance.stubs(:requirements_met?).returns(true)
      expect(Promotion.new(user).review_tl2).to eq(true)
      user
    end

    before do
      SiteSetting.tl3_promotion_min_duration = 3
    end

    it "demotes if was promoted more than X days ago" 


    it "doesn't demote if user was promoted recently" 


    it "doesn't demote if user hasn't lost requirements (low water mark)" 


  end
end

