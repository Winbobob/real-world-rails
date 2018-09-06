# EDSC-37 As a user, I want to clear my collection filters so that I may start a new search

require 'spec_helper'

describe "'Clear Filters' button", reset: false do
  before :all do
    load_page :search, facets: true, env: :sit
  end

  it "clears keywords" 


  it 'clears spatial' 


  context "clears temporal" do
    after :each do
      # close temporal dropdown
      click_link "Temporal"
      click_link "Clear Filters"
      wait_for_xhr
    end

    it "range" 


    it "recurring" 

  end

  it 'clears facets' 

end

