require 'spec_helper'
require 'pry'

include Storytime::StorytimeHelpers

describe "Storytime::StorytimeHelpers", :type => :helper do
  describe "storytime_snippet" do
    before(:each) do
      @site = FactoryGirl.create(:site)
      expect_any_instance_of(Storytime::StorytimeHelpers).to receive(:current_storytime_site).at_least(:once).and_return(@site)
      expect_any_instance_of(ApplicationHelper).to receive(:logged_in_storytime_user?).at_least(:once).and_return(false)
    end

    describe "when no snippet is found" do
      it "creates snippet from I18n translation with same name" 


      it "creates snippet with 'Lorem ipsum' placeholder text" 

    end

    describe "when snippet is found" do
      it "returns snippet partial" 

    end
  end
end

