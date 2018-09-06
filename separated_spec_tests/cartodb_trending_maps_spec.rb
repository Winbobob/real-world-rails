# coding: UTF-8
require 'spec_helper'
require_relative '../../lib/cartodb/trending_maps'

describe CartoDB::TrendingMaps do
  describe 'check for trending maps' do

    before(:all) do
      @api_calls = CartoDB::Stats::APICalls.new
      @trending_maps = CartoDB::TrendingMaps.new
      @default_date_to = Date.today
      @default_date_from = Date.today - CartoDB::TrendingMaps::DAYS_TO_CHECK.days
    end

    it "should mark the map as a trending one" 


    it "should mark the map as a trending one with a greater factor" 


    it "should mark the map as a trending one checking in the bounds" 


    it "should not mark the map as a trending one" 


    it "should not mark the map as a trending one checking the bounds" 


    it "should return 4 trending maps" 


    def add_date_data(visualization_id, username, date, value)
      key = build_key(username, visualization_id)
      $users_metadata.ZADD(key, value, date).to_i
      updated_total = $users_metadata.ZSCORE(key, "total").to_f + value.to_f
      $users_metadata.ZADD(key, updated_total, "total").to_i
    end

    def add_total_data(visualization_id, username, value)
      key = build_key(username, visualization_id)
      $users_metadata.ZADD(key, value, "total").to_i
    end

    def build_key(username, visualization_id)
      @api_calls.redis_api_call_key(username, "mapviews", visualization_id)
    end

    def stub_find_visualization(visualization, user)
      Carto::Visualization.stubs("find").with(visualization.id).returns(visualization)
      visualization.stubs("user").returns(user)
    end

  end
end

