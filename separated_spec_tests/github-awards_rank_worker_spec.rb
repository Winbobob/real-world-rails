require "rails_helper"

describe RankWorker do
  
  describe "perform" do

    before(:each) do
      FactoryGirl.create(:repository, user: user, language: "ruby", stars: 2)
      FactoryGirl.create(:repository, user: user, language: "ruby", stars: 0)
      FactoryGirl.create(:repository, user: user, language: "javascript", stars: 0)
      FactoryGirl.create(:repository, user: user, language: nil, stars: 0)
    end

    context "user has city and country" do
      let(:user) { FactoryGirl.create(:user, city: "paris", country: "france") }
  
      it "sets city rank" 

      
      it "sets country rank" 

      
      it "sets world rank" 

    end
    
    context "user has country but no city" do
      let(:user) { FactoryGirl.create(:user, city: nil, country: "france") }
  
      it "doesn't set city rank" 

    end
    
    context "user has no country and no city" do
      let(:user) { FactoryGirl.create(:user, city: nil, country: nil) }
  
      it "doesn't set country rank" 

    end
  end
end

