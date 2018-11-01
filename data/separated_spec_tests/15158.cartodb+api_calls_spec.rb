require 'spec_helper'
require_relative '../../lib/cartodb/stats/api_calls'
require 'helpers/unique_names_helper'

describe CartoDB::Stats::APICalls do
  include UniqueNamesHelper

  describe "Stats API Calls" do
    before(:all) do
      @api_calls = CartoDB::Stats::APICalls.new

      @default_date_to = Date.today
      @default_date_from = @default_date_to - 29.days
      @dates = @default_date_to.downto(@default_date_from).map {|d| d.strftime("%Y%m%d")}
      @dates_example_values = {}
      @dates.each do |d|
        @dates_example_values[d] = rand(50)
      end
      @redis_sources_count = CartoDB::Stats::APICalls::REDIS_SOURCES.length
    end

    it "should sum correctly api calls from all sources and return array without date" 


    it "should sum correctly api calls from all redis sources and return hash with dates" 


    it "should sum correctly api calls from all redis sources and return absolute value" 


    it "should sum correctly api calls with custom dates from all redis sources and return hash with dates" 

  end

  describe 'get_api_calls_from_redis_source' do

    before(:each) do
      @api_calls = CartoDB::Stats::APICalls.new
      @username = unique_name('user')
      @type = unique_name('type')
      @options = { stat_tag: '000d1206-1fed-11e5-9964-080027880ca6' }
    end

    it 'fetches 30 days in inverse order even if there is no data' 


    it 'fetches data' 


    it 'fetches random data from 2 months' 


    it 'fetches data for one day' 


    describe 'should execute ZSCAN' do
      it 'once for a single month' 


      it 'twice across month boundaries' 


      it 'twice across year boundaries' 

    end
  end
end

