require 'spec_helper'

describe Admin::CommunityMembershipsController, type: :controller do
  before(:each) do
    @community = FactoryGirl.create(:community)
    @request.host = "#{@community.ident}.lvh.me"
    @request.env[:current_marketplace] = @community
    @person = create_admin_for(@community)
    @other_email = FactoryGirl.create(:email, person: @person)
    sign_in_for_spec(@person)
  end

  describe "users CSV export" do
    it "returns 200" 


    it "returns CSV with actual data" 

  end
end

describe Admin::CommunityTransactionsController, type: :controller do
  before(:each) do
    # the @request is shared between test groups here so clear the request store
    RequestStore.clear!

    @community = FactoryGirl.create(:community)
    @person = create_admin_for(@community)
    @listing = FactoryGirl.create(:listing, community_id: @community.id, transaction_process_id: 123, author: @person)
    sign_in_for_spec(@person)
    @request.host = "#{@community.ident}.lvh.me"
    @request.env[:current_marketplace] = @community
    @transaction = FactoryGirl.create(:transaction, starter: @person, listing: @listing, community: @community)
  end

  describe "transactions CSV export" do
    it "returns 200" 


    it "returns CSV with actual data" 

  end
end

