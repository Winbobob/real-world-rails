require "spec_helper"

describe "Timeline data direction", reset: false do
  before :all do
    load_page :search, focus: 'C179003030-ORNL_DAAC'

    wait_for_xhr
  end

  context "when the timeline shows data for a collection" do
    end_date = DateTime.new(1987, 3, 1, 0, 0, 0, '+0')
    before :all do
      pan_to_time(end_date - 6.months)
      wait_for_xhr
    end

    it "shows no indicator that there is earlier data" 


    it "shows no indicator that there is later data" 

  end

  context "when the timeline is scrolled to before a collection's first data" do
    end_date = DateTime.new(1971, 1, 1, 0, 0, 0, '+0')
    before :all do
      pan_to_time(end_date - 6.months)
      wait_for_xhr
    end

    it "shows no indicator that there is earlier data" 


    it "shows an indicator that there is later data" 

  end

  context "when the timeline is scrolled to after a collection's first data" do
    end_date = DateTime.new(2014, 3, 1, 0, 0, 0, '+0')
    before :all do
      pan_to_time(end_date - 6.months)
      wait_for_xhr
    end

    it "shows an indicator that there is earlier data" 


    it "shows no indicator that there is later data" 

  end
end

