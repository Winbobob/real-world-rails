# encoding: utf-8

require 'spec_helper'
require Rails.root.join('db', 'migrate', '20161124141322_migrate_process_commit_worker_jobs.rb')

describe MigrateProcessCommitWorkerJobs do
  set(:project) { create(:project, :legacy_storage, :repository) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  set(:user) { create(:user) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let(:commit) do
    Gitlab::Git::Commit.last(project.repository.raw)
  end

  describe 'Project' do
    describe 'find_including_path' do
      it 'returns Project instances' 


      it 'selects the full path for every Project' 

    end

    describe '#repository' do
      it 'returns a mock implemention of ::Repository' 

    end
  end

  describe '#up', :clean_gitlab_redis_shared_state do
    let(:migration) { described_class.new }

    def job_count
      Sidekiq.redis { |r| r.llen('queue:process_commit') }
    end

    def pop_job
      JSON.parse(Sidekiq.redis { |r| r.lpop('queue:process_commit') })
    end

    before do
      Sidekiq.redis do |redis|
        job = JSON.dump(args: [project.id, user.id, commit.id])
        redis.lpush('queue:process_commit', job)
      end
    end

    it 'skips jobs using a project that no longer exists' 


    it 'skips jobs using commits that no longer exist' 


    it 'inserts migrated jobs back into the queue' 


    it 'encodes data to UTF-8' 


    context 'a migrated job' do
      let(:job) do
        migration.up
        pop_job
      end

      let(:commit_hash) do
        job['args'][2]
      end

      it 'includes the project ID' 


      it 'includes the user ID' 


      it 'includes the commit ID' 


      it 'includes the commit message' 


      it 'includes the parent IDs' 


      it 'includes the author date' 


      it 'includes the author name' 


      it 'includes the author Email' 


      it 'includes the commit date' 


      it 'includes the committer name' 


      it 'includes the committer Email' 

    end
  end

  describe '#down', :clean_gitlab_redis_shared_state do
    let(:migration) { described_class.new }

    def job_count
      Sidekiq.redis { |r| r.llen('queue:process_commit') }
    end

    before do
      Sidekiq.redis do |redis|
        job = JSON.dump(args: [project.id, user.id, commit.id])
        redis.lpush('queue:process_commit', job)

        migration.up
      end
    end

    it 'pushes migrated jobs back into the queue' 


    context 'a migrated job' do
      let(:job) do
        migration.down

        JSON.parse(Sidekiq.redis { |r| r.lpop('queue:process_commit') })
      end

      it 'includes the project ID' 


      it 'includes the user ID' 


      it 'includes the commit SHA' 

    end
  end
end

