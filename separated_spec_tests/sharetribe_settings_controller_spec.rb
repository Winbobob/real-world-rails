require 'spec_helper'

describe SettingsController, type: :controller do

  before(:each) do
    @community = FactoryGirl.create(:community)
    @request.host = "#{@community.ident}.lvh.me"
    @request.env[:current_marketplace] = @community
    @person = FactoryGirl.create(:person)

    FactoryGirl.create(:community_membership, :person => @person, :community => @community)
  end

  describe "#unsubscribe" do

    it "should unsubscribe the user from the email specified in parameters" 


    it "should unsubscribe with auth token" 


    it "should not unsubscribe if no token provided" 

  end
end

