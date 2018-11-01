require 'rails_helper'

describe "crops/index" do
  before(:each) do
    controller.stub(:current_user) { nil }
    page = 1
    per_page = 2
    total_entries = 2
    @tomato = FactoryBot.create(:tomato)
    @maize  = FactoryBot.create(:maize)
    assign(:crops, [@tomato, @maize])
    crops = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([@tomato, @maize])
    end
    assign(:crops, crops)
  end

  it "shows photos where available" 


  it "linkifies crop images" 


  context "logged in and crop wrangler" do
    before(:each) do
      @member = FactoryBot.create(:crop_wrangling_member)
      sign_in @member
      controller.stub(:current_user) { @member }
      render
    end

    it "shows a new crop link" 

  end

  context "downloads" do
    it "offers data downloads" 

  end
end

