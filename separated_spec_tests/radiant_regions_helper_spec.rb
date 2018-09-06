require File.dirname(__FILE__) + "/../../spec_helper"
require 'ostruct'

describe Radiant::Admin::RegionsHelper do
  before :each do
    @controller_name = 'page'
    allow(@controller).to receive(:controller_name).and_return(@controller_name)
    allow(@controller).to receive(:template_name).and_return('edit')
    assigns[:controller_name] = @controller_name
    @admin = Radiant::AdminUI.instance
    allow(helper).to receive(:admin).and_return(@admin)
    @region_set_mock = Radiant::AdminUI::RegionSet.new
    allow(@admin).to receive(:page).and_return(OpenStruct.new(edit: @region_set_mock))
  end

  it "should initialize relevant region variables" 


  describe "rendering a region" do
    before :each do
      @region_set_mock.add :main, "test"
      allow(helper).to receive(:capture).and_return("foo")
      helper.lazy_initialize_region_set
    end

    it "should render a region with no default partials" 


    it "should capture the passed block, yielding the RegionPartials object and concatenating" 

  end
end

