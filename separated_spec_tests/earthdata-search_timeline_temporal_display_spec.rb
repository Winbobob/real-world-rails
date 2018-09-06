# EDSC-199: As a user, I want my currently-selected temporal extents visible on
#           the timeline so I may see the time I have selected

require "spec_helper"

describe "Timeline temporal display", reset: false do
  max_date = DateTime.new(2014, 3, 1, 0, 0, 0, '+0')
  min_date = DateTime.new(1970, 1, 1, 0, 0, 0, '+0')
  start_date = DateTime.new(2014, 2, 10, 12, 30, 0, '+0')
  stop_date = DateTime.new(2014, 2, 20, 16, 30, 0, '+0')
  ds_specific_date = DateTime.new(2014, 2, 15, 14, 10, 0, '+0')
  start_year = 2012
  stop_year = 2014

  before :all do
    load_page :search, project: ['C179002914-ORNL_DAAC', 'C179003030-ORNL_DAAC'], view: :project
    wait_for_xhr
    pan_to_time(max_date)
  end

  context "when there is no temporal range selected" do
    it "displays no temporal" 

  end

  context "when only a temporal start date is selected" do
    before(:all) { set_temporal(start_date) }
    after(:all) { unset_temporal }

    it "displays a temporal range with the given start date and an end date at the present" 

  end


  context "when only a temporal end date is selected" do
    before(:all) { set_temporal(nil, stop_date) }
    after(:all) { unset_temporal }

    it "displays a temporal range with the given end date and a start date of January 1st, 1970" 

  end

  context "when both start date and end date are selected" do
    before(:all) { set_temporal(start_date, stop_date) }
    after(:all) { unset_temporal }

    it "displays the given temporal range" 


    context "and a collection overrides the global temporal range" do
      before(:all) { set_temporal(ds_specific_date, nil, nil, 0) }
      after(:all) { unset_temporal(0) }

      it "displays both the global and collection-specific temporal ranges" 

    end
  end

  context "when a recurring temporal constraint is selected" do
    before(:all) { set_temporal(start_date, stop_date, [start_year, stop_year]) }
    after(:all) { unset_temporal }

    it "displays a temporal range for each recurring year" 

  end

end

