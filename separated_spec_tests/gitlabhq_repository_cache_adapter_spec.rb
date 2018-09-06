require 'spec_helper'

describe Gitlab::RepositoryCacheAdapter do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:cache) { repository.send(:cache) }

  describe '#cache_method_output', :use_clean_rails_memory_store_caching do
    let(:fallback) { 10 }

    context 'with a non-existing repository' do
      let(:project) { create(:project) } # No repository

      subject do
        repository.cache_method_output(:cats, fallback: fallback) do
          repository.cats_call_stub
        end
      end

      it 'returns the fallback value' 


      it 'avoids calling the original method' 

    end

    context 'with a method throwing a non-existing-repository error' do
      subject do
        repository.cache_method_output(:cats, fallback: fallback) do
          raise Gitlab::Git::Repository::NoRepository
        end
      end

      it 'returns the fallback value' 


      it 'does not cache the data' 

    end

    context 'with an existing repository' do
      it 'caches the output' 

    end
  end

  describe '#expire_method_caches' do
    it 'expires the caches of the given methods' 

  end
end

