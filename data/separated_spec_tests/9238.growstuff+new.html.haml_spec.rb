require 'rails_helper'

describe "photos/new" do
  before(:each) do
    @member = FactoryBot.create(:member)
    controller.stub(:current_user) { @member }
    page = 1
    per_page = 2
    total_entries = 2
    photos = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([])
    end
    assign(:photos, photos)
    assign(:flickr_auth, FactoryBot.create(:flickr_authentication, member: @member))
  end

  context "user has no photosets" do
    it "doesn't show a dropdown with sets from Flickr" 

  end

  context "user has photosets" do
    before(:each) do
      assign(:sets, "foo" => "bar") # Hash of names => IDs
    end

    it "shows a dropdown with sets from Flickr" 


    it "shows the current photoset" 

  end
end

