# frozen_string_literal: true

require 'spec_helper'

describe Users::KeysCountService, :use_clean_rails_memory_store_caching do
  let(:user) { create(:user) }
  let(:service) { described_class.new(user) }

  describe '#count' do
    before do
      create(:personal_key, user: user)
    end

    it 'returns the number of SSH keys as an Integer' 


    it 'caches the number of keys in Redis', :request_store do
      service.delete_cache
      control_count = ActiveRecord::QueryRecorder.new { service.count }.count
      service.delete_cache

      expect { 2.times { service.count } }.not_to exceed_query_limit(control_count)
    end
  end

  describe '#refresh_cache' do
    it 'refreshes the Redis cache' 

  end

  describe '#delete_cache' do
    it 'removes the cache' 

  end

  describe '#uncached_count' do
    it 'returns the number of SSH keys' 


    it 'does not cache the number of keys' 

  end

  describe '#cache_key' do
    it 'returns the cache key' 

  end
end

