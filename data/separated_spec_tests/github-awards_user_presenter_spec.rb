require 'rails_helper'

describe "UserPresenter" do
  before(:each) do
    @user = FactoryGirl.create(:user, city: "paris", country: "france")

    FactoryGirl.create(:repository, user: @user, language: "ruby", stars: 1)
    FactoryGirl.create(:repository, user: @user, language: "javascript", stars: 2)
    FactoryGirl.create(:repository, user: @user, language: "ruby", stars: 0)
    
    $redis.zadd("user_ruby_paris", 1.5, @user.id)
    $redis.zadd("user_javascript_paris", 2.0, @user.id)
    $redis.zadd("user_ruby_france", 1.5, @user.id)
    $redis.zadd("user_javascript_france", 2.0, @user.id)
    
    @presenter = UserPresenter.new(@user)
  end

  describe "best_rank_tweet" do
    it "returns language with best city rank" 

    
    context "no ranking" do
      it "returns nil" 

    end
    
    context "no city" do
      it "returns nil" 

    end
  end
end

