require 'spec_helper'

describe Gitlab::Git::Storage::Checker, :clean_gitlab_redis_shared_state do
  let(:storage_name) { 'default' }
  let(:hostname) { Gitlab::Environment.hostname }
  let(:cache_key) { "storage_accessible:#{storage_name}:#{hostname}" }

  subject(:checker) { described_class.new(storage_name) }

  def value_from_redis(name)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.hmget(cache_key, name)
    end.first
  end

  def set_in_redis(name, value)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.hmset(cache_key, name, value)
    end.first
  end

  describe '.check_all' do
    it 'calls a check for each storage' 


    context 'with broken storage', :broken_storage do
      it 'returns the results' 

    end
  end

  describe '#initialize' do
    it 'assigns the settings' 

  end

  describe '#check_with_lease' do
    it 'only allows one check at a time' 


    it 'returns a result hash' 

  end

  describe '#check' do
    it 'tracks that the storage was accessible' 


    it 'calls the check with the correct arguments' 


    it 'returns `true`' 


    it 'maintains known storage keys' 


    context 'the storage is not available', :broken_storage do
      let(:storage_name) { 'broken' }

      it 'tracks that the storage was inaccessible' 


      it 'returns `false`' 

    end
  end
end

