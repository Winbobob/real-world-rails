require 'spec_helper'

describe Gitlab::HashedStorage::Migrator do
  describe '#bulk_schedule' do
    it 'schedules job to StorageMigratorWorker' 

  end

  describe '#bulk_migrate' do
    let(:projects) { create_list(:project, 2, :legacy_storage) }
    let(:ids) { projects.map(&:id) }

    it 'enqueue jobs to ProjectMigrateHashedStorageWorker' 


    it 'sets projects as read only' 


    it 'rescues and log exceptions' 


    it 'delegates each project in specified range to #migrate' 

  end

  describe '#migrate' do
    let(:project) { create(:project, :legacy_storage, :empty_repo) }

    it 'enqueues job to ProjectMigrateHashedStorageWorker' 


    it 'rescues and log exceptions' 


    it 'sets project as read only' 


    it 'migrate project' 

  end
end

