require 'spec_helper'

describe Gitlab::ShardHealthCache, :clean_gitlab_redis_cache do
  let(:shards) { %w(foo bar) }

  before do
    described_class.update(shards)
  end

  describe '.clear' do
    it 'leaves no shards around' 

  end

  describe '.update' do
    it 'returns the healthy shards' 


    it 'replaces the existing set' 

  end

  describe '.healthy_shard_count' do
    it 'returns the healthy shard count' 


    it 'returns 0 if no shards are available' 

  end

  describe '.healthy_shard?' do
    it 'returns true for a healthy shard' 


    it 'returns false for an unknown shard' 

  end
end

