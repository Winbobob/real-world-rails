require 'spec_helper'

describe Admin::CategoriesController, type: :controller do
  before(:each) do
    @community = FactoryGirl.create(:community)

    @cat1 = FactoryGirl.create(:category, sort_priority: 1, community: @community)
    @cat2 = FactoryGirl.create(:category, sort_priority: 2, community: @community)
    @cat3 = FactoryGirl.create(:category, sort_priority: 3, community: @community)

    @request.host = "#{@community.ident}.lvh.me"
    @request.env[:current_marketplace] = @community

    @user = create_admin_for(@community)
    sign_in_for_spec(@user)
  end

  describe "#order" do
    it "responds with 200 ok" 


    it "reorders the categories" 


    it "does not allow updates to other communities' categories" 

  end
end

