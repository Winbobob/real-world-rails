require File.dirname(__FILE__) + "/../../../spec_helper"

describe Radiant::AdminUI::RegionSet do
  before :each do
    @region_set = Radiant::AdminUI::RegionSet.new
  end

  it "should create empty regions on first access" 


  it "should use indifferent access on regions" 


  it "should access regions as methods" 


  it "should yield itself to a passed block when initializing" 


  describe "adding partials" do
    before :each do
      @region_set["main"] << "one"
    end

    it "should add to the end of a region by default" 


    it "should add a partial before a specified partial" 


    it "should add a partial after a specified partial" 


    it "should add a partial at the end if the before partial is not found" 


    it "should add a partial at the end if the after partial is not found" 

  end
end

