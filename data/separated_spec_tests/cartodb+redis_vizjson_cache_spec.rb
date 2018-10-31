require 'spec_helper_min'
require_relative '../../../lib/cartodb/redis_vizjson_cache'
require 'mock_redis'
require 'ostruct'
require_relative '../../support/redis_test_doubles'
require_relative '../../../lib/carto/uuidhelper'

describe CartoDB::Visualization::RedisVizjsonCache do
  include Carto::UUIDHelper

  # http and https
  PROTOCOL_KEYS_COUNT = 2

  # v2 and v3 and v3 forcing named/anonymous maps
  VIZJSON_VERSION_COUNT = 4

  KEYS_PER_VISUALIZATION = PROTOCOL_KEYS_COUNT * VIZJSON_VERSION_COUNT

  let(:redis_spy) { RedisDoubles::RedisSpy.new }
  let(:redis_mock) { MockRedis.new }

  describe '#cached' do
    let(:fake_vizjson) { { test: 1 } }

    it 'caches by id' 

  end

  describe '#invalidate' do
    it 'deletes all keys from a visualization' 

  end

  describe '#purge' do
    it 'deletes all keys from all visualizations from redis' 

  end
end

