require 'spec_helper'

describe Projects::HashedStorageMigrationService do
  let(:project) { create(:project, :empty_repo, :wiki_repo, :legacy_storage) }
  let(:logger) { double }

  subject(:service) { described_class.new(project, project.full_path, logger: logger) }

  describe '#execute' do
    context 'repository migration' do
      let(:repository_service) { Projects::HashedStorage::MigrateRepositoryService.new(project, project.full_path, logger: logger) }

      it 'delegates migration to Projects::HashedStorage::MigrateRepositoryService' 


      it 'does not delegate migration if repository is already migrated' 

    end

    context 'attachments migration' do
      let(:attachments_service) { Projects::HashedStorage::MigrateAttachmentsService.new(project, project.full_path, logger: logger) }

      it 'delegates migration to Projects::HashedStorage::MigrateRepositoryService' 


      it 'does not delegate migration if attachments are already migrated' 

    end
  end
end

