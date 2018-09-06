require 'spec_helper'

describe UserService::API::Users do

  include UserService::API::Users

  include EmailSpec::Helpers
  include EmailSpec::Matchers

  def process_jobs
    success, failure = Delayed::Worker.new(
               quiet: true # you might want to change this to false for debugging
             ).work_off

    if failure > 0
      raise "Delayed job failed"
    end
  end

  PERSON_HASH = {
    given_name: "Raymond",
    family_name: "Xperiment",
    email: "Ray@example.com",
    password: "test",
    locale: "fr"
  }

  describe "#create_user" do

    before { ActionMailer::Base.deliveries = [] }

    before (:each) do
      expect(ActionMailer::Base.deliveries).to be_empty
      @community = FactoryGirl.create(:community)
    end

    it "should create a user" 


    it "should fail if email is taken" 


    it "should send the confirmation email" 


    it "should send the confirmation email in right language" 

  end

  describe "#delete_user" do
    let(:user) { FactoryGirl.create(:person) }
    let!(:membership) { FactoryGirl.create(:community_membership, person: user) }
    let!(:auth_token) { FactoryGirl.create(:auth_token, person: user) }
    let!(:follower) { FactoryGirl.create(:person) }
    let!(:followed) { FactoryGirl.create(:person) }
    let!(:follower_relationship) { FactoryGirl.create(:follower_relationship, person: user, follower: follower) }
    let!(:followed_relationship) { FactoryGirl.create(:follower_relationship, person: followed, follower: user) }

    it "removes user data and adds deleted flag" 

  end

end

