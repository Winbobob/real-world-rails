require "spec_helper"

module Refinery
  describe PagesController, :type => :controller do
    before do
      FactoryBot.create(:page, link_url:  "/")
      FactoryBot.create(:page, title:  "testing")
      FactoryBot.create(:page, link_url: "/items")
    end

    describe "#home" do
      context "when page path set to default ('/') " do
        it "renders home template" 

      end

      context "when home_page_path set to another path" do
        it "redirects to the specified path" 

      end
    end

    describe "#show" do
      it "renders show template" 

    end

    describe "#show" do
      it "does not interfere with active storage" 

    end
  end
end

