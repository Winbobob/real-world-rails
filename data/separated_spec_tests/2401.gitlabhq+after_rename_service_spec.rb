# frozen_string_literal: true

require 'spec_helper'

describe Projects::AfterRenameService do
  let(:rugged_config) { rugged_repo(project.repository).config }

  describe '#execute' do
    context 'using legacy storage' do
      let(:project) { create(:project, :repository, :legacy_storage) }
      let(:gitlab_shell) { Gitlab::Shell.new }
      let(:project_storage) { project.send(:storage) }

      before do
        # Project#gitlab_shell returns a new instance of Gitlab::Shell on every
        # call. This makes testing a bit easier.
        allow(project).to receive(:gitlab_shell).and_return(gitlab_shell)

        allow(project)
          .to receive(:previous_changes)
          .and_return('path' => ['foo'])

        allow(project)
          .to receive(:path_was)
          .and_return('foo')

        stub_feature_flags(skip_hashed_storage_upgrade: false)
      end

      it 'renames a repository' 


      context 'container registry with images' do
        let(:container_repository) { create(:container_repository) }

        before do
          stub_container_registry_config(enabled: true)
          stub_container_registry_tags(repository: :any, tags: ['tag'])
          project.container_repositories << container_repository
        end

        it 'raises a RenameFailedError' 

      end

      context 'gitlab pages' do
        before do
          expect(project_storage).to receive(:rename_repo) { true }
        end

        it 'moves pages folder to new location' 

      end

      context 'attachments' do
        before do
          expect(project_storage).to receive(:rename_repo) { true }
        end

        it 'moves uploads folder to new location' 

      end

      it 'updates project full path in .git/config' 

    end

    context 'using hashed storage' do
      let(:project) { create(:project, :repository, skip_disk_validation: true) }
      let(:gitlab_shell) { Gitlab::Shell.new }
      let(:hash) { Digest::SHA2.hexdigest(project.id.to_s) }
      let(:hashed_prefix) { File.join('@hashed', hash[0..1], hash[2..3]) }
      let(:hashed_path) { File.join(hashed_prefix, hash) }

      before do
        # Project#gitlab_shell returns a new instance of Gitlab::Shell on every
        # call. This makes testing a bit easier.
        allow(project).to receive(:gitlab_shell).and_return(gitlab_shell)
        allow(project).to receive(:previous_changes).and_return('path' => ['foo'])

        stub_feature_flags(skip_hashed_storage_upgrade: false)
        stub_application_setting(hashed_storage_enabled: true)
      end

      context 'migration to hashed storage' do
        it 'calls HashedStorageMigrationService with correct options' 

      end

      it 'renames a repository' 


      context 'container registry with images' do
        let(:container_repository) { create(:container_repository) }

        before do
          stub_container_registry_config(enabled: true)
          stub_container_registry_tags(repository: :any, tags: ['tag'])
          project.container_repositories << container_repository
        end

        it 'raises a RenameFailedError' 

      end

      context 'gitlab pages' do
        it 'moves pages folder to new location' 

      end

      context 'attachments' do
        it 'keeps uploads folder location unchanged' 


        context 'when not rolled out' do
          let(:project) { create(:project, :repository, storage_version: 1, skip_disk_validation: true) }

          it 'moves pages folder to hashed storage' 

        end
      end

      it 'updates project full path in .git/config' 

    end
  end
end

