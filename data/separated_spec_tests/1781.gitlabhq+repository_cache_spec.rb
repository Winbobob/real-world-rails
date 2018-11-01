require 'spec_helper'

describe Gitlab::RepositoryCache do
  let(:backend) { double('backend').as_null_object }
  let(:project) { create(:project) }
  let(:repository) { project.repository }
  let(:namespace) { "#{repository.full_path}:#{project.id}" }
  let(:cache) { described_class.new(repository, backend: backend) }

  describe '#cache_key' do
    subject { cache.cache_key(:foo) }

    it 'includes the namespace' 


    context 'with a given namespace' do
      let(:extra_namespace) { 'my:data' }
      let(:cache) do
        described_class.new(repository, extra_namespace: extra_namespace,
                                        backend: backend)
      end

      it 'includes the full namespace' 

    end
  end

  describe '#expire' do
    it 'expires the given key from the cache' 

  end

  describe '#fetch' do
    it 'fetches the given key from the cache' 


    it 'accepts a block' 

  end

  describe '#fetch_without_caching_false', :use_clean_rails_memory_store_caching do
    let(:key) { :foo }
    let(:backend) { Rails.cache }

    it 'requires a block' 


    context 'when the key does not exist in the cache' do
      context 'when the result of the block is truthy' do
        it 'returns the result of the block' 


        it 'caches the value' 

      end

      context 'when the result of the block is falsey' do
        let(:p) { -> { false } }

        it 'returns the result of the block' 


        it 'does not cache the value' 

      end
    end

    context 'when the cached value is truthy' do
      before do
        backend.write("#{key}:#{namespace}", true)
      end

      it 'returns the cached value' 


      it 'does not execute the block' 


      it 'does not write to the cache' 

    end

    context 'when the cached value is falsey' do
      before do
        backend.write("#{key}:#{namespace}", false)
      end

      it 'returns the result of the block' 


      it 'writes the truthy value to the cache' 

    end
  end
end

