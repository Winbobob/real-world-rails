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

  describe '#cache_method_output_asymmetrically', :use_clean_rails_memory_store_caching, :request_store do
    let(:request_store_cache) { repository.send(:request_store_cache) }

    context 'with a non-existing repository' do
      let(:project) { create(:project) } # No repository
      let(:object) { double }

      subject do
        repository.cache_method_output_asymmetrically(:cats) do
          object.cats_call_stub
        end
      end

      it 'returns the output of the original method' 

    end

    context 'with a method throwing a non-existing-repository error' do
      subject do
        repository.cache_method_output_asymmetrically(:cats) do
          raise Gitlab::Git::Repository::NoRepository
        end
      end

      it 'returns nil' 


      it 'does not cache the data' 

    end

    context 'with an existing repository' do
      let(:object) { double }

      context 'when it returns truthy' do
        before do
          expect(object).to receive(:cats).once.and_return('truthy output')
        end

        it 'caches the output in RequestStore' 


        it 'caches the output in RepositoryCache' 

      end

      context 'when it returns false' do
        before do
          expect(object).to receive(:cats).once.and_return(false)
        end

        it 'caches the output in RequestStore' 


        it 'does NOT cache the output in RepositoryCache' 

      end
    end
  end

  describe '#memoize_method_output' do
    let(:fallback) { 10 }

    context 'with a non-existing repository' do
      let(:project) { create(:project) } # No repository

      subject do
        repository.memoize_method_output(:cats, fallback: fallback) do
          repository.cats_call_stub
        end
      end

      it 'returns the fallback value' 


      it 'avoids calling the original method' 


      it 'does not set the instance variable' 

    end

    context 'with a method throwing a non-existing-repository error' do
      subject do
        repository.memoize_method_output(:cats, fallback: fallback) do
          raise Gitlab::Git::Repository::NoRepository
        end
      end

      it 'returns the fallback value' 


      it 'does not set the instance variable' 

    end

    context 'with an existing repository' do
      it 'sets the instance variable' 

    end
  end

  describe '#expire_method_caches' do
    it 'expires the caches of the given methods' 


    it 'does not expire caches for non-existent methods' 

  end
end

