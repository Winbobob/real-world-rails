require 'spec_helper'

describe Gitlab::Git::Storage::FailureInfo, :broken_storage do
  let(:storage_name) { 'default' }
  let(:hostname) { Gitlab::Environment.hostname }
  let(:cache_key) { "storage_accessible:#{storage_name}:#{hostname}" }

  def value_from_redis(name)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.hmget(cache_key, name)
    end.first
  end

  def set_in_redis(name, value)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.zadd(Gitlab::Git::Storage::REDIS_KNOWN_KEYS, 0, cache_key)
      redis.hmset(cache_key, name, value)
    end.first
  end

  describe '.reset_all!' do
    it 'clears all entries form redis' 


    it 'does not break when there are no keys in redis' 

  end

  describe '.load' do
    it 'loads failure information for a storage on a host' 

  end

  describe '#no_failures?' do
    it 'is true when there are no failures' 


    it 'is false when there are failures' 

  end
end

