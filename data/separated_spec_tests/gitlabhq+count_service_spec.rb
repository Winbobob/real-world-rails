require 'spec_helper'

describe Projects::CountService do
  let(:project) { build(:project, id: 1) }
  let(:service) { described_class.new(project) }

  describe '.query' do
    it 'raises NotImplementedError' 

  end

  describe '#relation_for_count' do
    it 'calls the class method query with the project id' 

  end

  describe '#count' do
    before do
      allow(service).to receive(:cache_key_name).and_return('count_service')
    end

    it 'returns the number of rows' 


    it 'caches the number of rows', :use_clean_rails_memory_store_caching do
      expect(service).to receive(:uncached_count).once.and_return(1)

      2.times do
        expect(service.count).to eq(1)
      end
    end
  end

  describe '#refresh_cache', :use_clean_rails_memory_store_caching do
    before do
      allow(service).to receive(:cache_key_name).and_return('count_service')
    end

    it 'refreshes the cache' 

  end

  describe '#delete_cache', :use_clean_rails_memory_store_caching do
    before do
      allow(service).to receive(:cache_key_name).and_return('count_service')
    end

    it 'removes the cache' 

  end

  describe '#cache_key_name' do
    it 'raises NotImplementedError' 

  end

  describe '#cache_key' do
    it 'returns the cache key as an Array' 

  end
end

