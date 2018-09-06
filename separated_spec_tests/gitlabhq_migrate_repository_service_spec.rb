require 'spec_helper'

describe Projects::HashedStorage::MigrateRepositoryService do
  let(:gitlab_shell) { Gitlab::Shell.new }
  let(:project) { create(:project, :legacy_storage, :repository, :wiki_repo) }
  let(:service) { described_class.new(project) }
  let(:legacy_storage) { Storage::LegacyProject.new(project) }
  let(:hashed_storage) { Storage::HashedProject.new(project) }

  describe '#execute' do
    before do
      allow(service).to receive(:gitlab_shell) { gitlab_shell }
    end

    context 'when succeeds' do
      it 'renames project and wiki repositories' 


      it 'updates project to be hashed and not read-only' 


      it 'move operation is called for both repositories' 


      it 'writes project full path to .git/config' 

    end

    context 'when one move fails' do
      it 'rollsback repositories to original name' 


      context 'when rollback fails' do
        let(:from_name) { legacy_storage.disk_path }
        let(:to_name) { hashed_storage.disk_path }

        before do
          hashed_storage.ensure_storage_path_exists
          gitlab_shell.mv_repository(project.repository_storage, from_name, to_name)
        end

        it 'does not try to move nil repository over hashed' 

      end
    end

    def expect_move_repository(from_name, to_name)
      expect(gitlab_shell).to receive(:mv_repository).with(project.repository_storage, from_name, to_name).and_call_original
    end
  end
end

