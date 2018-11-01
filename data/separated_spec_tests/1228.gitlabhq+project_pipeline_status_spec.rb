require 'spec_helper'

describe Gitlab::Cache::Ci::ProjectPipelineStatus, :clean_gitlab_redis_cache do
  let!(:project) { create(:project, :repository) }
  let(:pipeline_status) { described_class.new(project) }
  let(:cache_key) { described_class.cache_key_for_project(project) }

  describe '.load_for_project' do
    it "loads the status" 

  end

  describe 'loading in batches' do
    let(:status) { 'success' }
    let(:sha) { '424d1b73bc0d3cb726eb7dc4ce17a4d48552f8c6' }
    let(:ref) { 'master' }
    let(:pipeline_info) { { sha: sha, status: status, ref: ref } }
    let!(:project_without_status) { create(:project, :repository) }

    describe '.load_in_batch_for_projects' do
      it 'preloads pipeline_status on projects' 


      describe 'without a status in redis_cache' do
        it 'loads the status from a commit when it was not in redis_cache' 


        it 'only connects to redis twice' 

      end

      describe 'when a status was cached in redis_cache' do
        before do
          Gitlab::Redis::Cache.with do |redis|
            redis.mapped_hmset(cache_key,
                               { sha: sha, status: status, ref: ref })
          end
        end

        it 'loads the correct status' 


        it 'only connects to redis_cache once' 


        it "doesn't load the status separatly" 

      end
    end

    describe '.cached_results_for_projects' do
      it 'loads a status from caching for all projects' 

    end
  end

  describe '.update_for_pipeline' do
    it 'refreshes the cache if nescessary' 

  end

  describe '#has_status?' do
    it "is false when the status wasn't loaded yet" 


    it 'is true when all status information was loaded' 

  end

  describe '#load_status' do
    it 'loads the status from the cache when there is one' 


    it 'loads the status from the project commit when there is no cache' 


    it 'stores the status in the cache when it loading it from the project' 


    it 'sets the state to loaded' 


    it 'only loads the status once' 

  end

  describe "#load_from_project", :clean_gitlab_redis_cache do
    let!(:pipeline) { create(:ci_pipeline, :success, project: project, sha: project.commit.sha) }

    it 'reads the status from the pipeline for the commit' 


    it "doesn't fail for an empty project" 

  end

  describe "#store_in_cache", :clean_gitlab_redis_cache do
    it "sets the object in caching" 

  end

  describe '#store_in_cache_if_needed', :clean_gitlab_redis_cache do
    it 'stores the state in the cache when the sha is the HEAD of the project' 


    it "doesn't store the status in redis_cache when the sha is not the head of the project" 


    it "deletes the cache if the repository doesn't have a head commit" 

  end

  describe "with a status in caching", :clean_gitlab_redis_cache do
    let(:status) { 'success' }
    let(:sha) { '424d1b73bc0d3cb726eb7dc4ce17a4d48552f8c6' }
    let(:ref) { 'master' }

    before do
      Gitlab::Redis::Cache.with do |redis|
        redis.mapped_hmset(cache_key,
                           { sha: sha, status: status, ref: ref })
      end
    end

    describe '#load_from_cache' do
      it 'reads the status from redis_cache' 


      context 'when status is empty string' do
        before do
          Gitlab::Redis::Cache.with do |redis|
            redis.mapped_hmset(cache_key,
                               { sha: sha, status: '', ref: ref })
          end
        end

        it 'reads the status as nil' 

      end
    end

    describe '#has_cache?' do
      it 'knows the status is cached' 

    end

    describe '#delete_from_cache' do
      it 'deletes values from redis_cache'  do
        pipeline_status.delete_from_cache

        key_exists = Gitlab::Redis::Cache.with { |redis| redis.exists(cache_key) }

        expect(key_exists).to be_falsy
      end
    end
  end
end

