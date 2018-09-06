# encoding: UTF-8
require_relative '../spec_helper'
require_relative '../../lib/explore_api'
require_relative '../factories/visualization_creation_helpers'

describe 'ExploreAPI' do
  include_context 'visualization creation helpers'

  before(:each) do
    @explore_api = ExploreAPI.new
  end

  it 'should return the visualization table' 


  it 'should return the visualizations tables with multiple layers' 


  it 'should return the visualizations tables with multiple layers without duplicates' 


  it 'should empty if the is no user name or table name in the layer' 


  it 'should return the geometry data properly setted' 


  it 'should return empty if there is no map associated to the visualization' 


  it 'should return the table data properly setted for two vis of the same user' 


  it 'should return the table data properly setted for two vis of the different users' 


  it 'should return nil if the coordinates are out of the bounds' 


  describe 'likes' do
    it 'should return 0 elements if dont have likes' 


    it 'should return 10 likes the visualization' 

  end

  describe 'mapviews' do
    it 'should return 0 elements if not mapviews in the checked date' 


    it 'should return 1 of 4 elements if not mapviews in the checked date' 

  end
end

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
  api_calls = CartoDB::Stats::APICalls.new
  api_calls.redis_api_call_key(username, "mapviews", visualization_id)
end

