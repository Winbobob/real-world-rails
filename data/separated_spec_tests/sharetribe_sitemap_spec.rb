require 'spec_helper'

RSpec.describe SitemapController, type: :request do

  let(:valid_session) { {} }

  before(:each) do
    @domain = "marketplace.example.com"
    @community = FactoryGirl.create(:community, domain: @domain, use_domain: true)

    @listing = FactoryGirl.create(:listing, community_id: @community.id)
    @community2 = FactoryGirl.create(:community)
    @listing2 = FactoryGirl.create(:listing, community_id: @community2.id)
  end

  describe "GET #sitemap" do
    it "creates sitemap" 


    it "contains root url" 


    it "contains listing" 


    it "contains listing's nice name" 


    it "doesn't contain other community listing" 


    it "if community is private returns forbidden" 


    it "if community is deleted returns not found" 


    it "if community is deleted and private returns not found" 

  end

end

