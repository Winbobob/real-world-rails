require 'rails_helper'

describe MembersController do
  before :each do
    @member = FactoryBot.create(:member)
    @posts = [FactoryBot.create(:post, author: @member)]
    @twitter_auth = FactoryBot.create(:authentication, member: @member)
    @flickr_auth = FactoryBot.create(:flickr_authentication, member: @member)
  end

  describe "GET index" do
    it "assigns only confirmed members as @members" 

  end

  describe "GET JSON index" do
    it "provides JSON for members" 

  end

  describe "GET show" do
    it "provides JSON for member profile" 


    it "assigns @posts with the member's posts" 


    it "assigns @twitter_auth" 


    it "assigns @flickr_auth" 


    it "doesn't show completely nonsense members" 


    it "doesn't show unconfirmed members" 

  end

  describe "GET member's RSS feed" do
    it "returns an RSS feed" 

  end
end

