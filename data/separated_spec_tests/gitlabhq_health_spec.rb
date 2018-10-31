require 'spec_helper'

describe Gitlab::Git::Storage::Health, broken_storage: true do
  let(:host1_key) { 'storage_accessible:broken:web01' }
  let(:host2_key) { 'storage_accessible:default:kiq01' }

  def set_in_redis(cache_key, value)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.zadd(Gitlab::Git::Storage::REDIS_KNOWN_KEYS, 0, cache_key)
      redis.hmset(cache_key, :failure_count, value)
    end.first
  end

  describe '.for_failing_storages' do
    it 'only includes health status for failures' 

  end

  describe '.for_all_storages' do
    it 'loads health status for all configured storages' 

  end

  describe '#failing_info' do
    it 'only contains storages that have failures' 

  end

  describe '#total_failures' do
    it 'sums up all the failures' 

  end

  describe '#failing_on_hosts' do
    it 'collects only the failing hostnames' 

  end
end

