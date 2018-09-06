require 'spec_helper'

describe 'Data Quality Summaries', reset: false do
  before :all do
    Capybara.reset_sessions!
    load_page :search, overlay: false
    login
  end

  context "when configuring retrieval for a collection with quality information" do
    before :all do
      load_page '/data/configure', project: ['C115003855-NSIDC_ECS']
      wait_for_xhr
    end

    it "shows data quality summaries" 

  end

  context "when configuring retrieval for a collection with no quality information" do
    before :all do
      load_page '/data/configure', project: ['C179003030-ORNL_DAAC']
      wait_for_xhr
    end

    it "shows no data quality summaries" 

  end
end

