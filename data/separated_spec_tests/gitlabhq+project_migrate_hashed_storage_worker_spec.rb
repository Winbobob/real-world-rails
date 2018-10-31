require 'spec_helper'

describe ProjectMigrateHashedStorageWorker, :clean_gitlab_redis_shared_state do
  include ExclusiveLeaseHelpers

  describe '#perform' do
    let(:project) { create(:project, :empty_repo) }
    let(:lease_key) { "project_migrate_hashed_storage_worker:#{project.id}" }
    let(:lease_timeout) { ProjectMigrateHashedStorageWorker::LEASE_TIMEOUT }

    it 'skips when project no longer exists' 


    it 'skips when project is pending delete' 


    it 'delegates removal to service class when have exclusive lease' 


    it 'skips when dont have lease when dont have exclusive lease' 

  end
end

