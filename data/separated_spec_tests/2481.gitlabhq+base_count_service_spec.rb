require 'spec_helper'

describe BaseCountService, :use_clean_rails_memory_store_caching do
  let(:service) { described_class.new }

  describe '#relation_for_count' do
    it 'raises NotImplementedError' 

  end

  describe '#count' do
    it 'returns the number of values' 

  end

  describe '#uncached_count' do
    it 'returns the uncached number of values' 

  end

  describe '#refresh_cache' do
    it 'refreshes the cache' 

  end

  describe '#delete_cache' do
    it 'deletes the cache' 

  end

  describe '#raw?' do
    it 'returns false' 

  end

  describe '#cache_key' do
    it 'raises NotImplementedError' 

  end

  describe '#cache_options' do
    it 'returns the default in options' 

  end
end

