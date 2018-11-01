require 'spec_helper'

describe Gitlab::Database::RenameReservedPathsMigration::V1::RenameProjects, :delete do
  let(:migration) { FakeRenameReservedPathMigrationV1.new }
  let(:subject) { described_class.new(['the-path'], migration) }
  let(:project) do
    create(:project,
           :legacy_storage,
           path: 'the-path',
           namespace: create(:namespace, path: 'known-parent' ))
  end

  before do
    allow(migration).to receive(:say)
    TestEnv.clean_test_path
  end

  describe '#projects_for_paths' do
    it 'searches using nested paths' 


    it 'includes the correct projects' 

  end

  describe '#rename_projects' do
    let!(:projects) { create_list(:project, 2, :legacy_storage, path: 'the-path') }

    it 'renames each project' 


    it 'invalidates the markdown cache of related projects' 

  end

  describe '#rename_project' do
    it 'renames path & route for the project' 


    it 'tracks the rename' 


    it 'renames the folders for the project' 

  end

  describe '#move_project_folders' do
    it 'moves the wiki & the repo' 


    it 'does not move the repositories when hashed storage is enabled' 


    it 'moves uploads' 


    it 'does not move uploads when hashed storage is enabled for attachments' 


    it 'moves pages' 

  end

  describe '#move_repository' do
    let(:known_parent) { create(:namespace, path: 'known-parent') }
    let(:project) { create(:project, :repository, :legacy_storage, path: 'the-path', namespace: known_parent) }

    it 'moves the repository for a project' 

  end

  describe '#revert_renames', :redis do
    it 'renames the routes back to the previous values' 


    it 'moves the repositories back to their original place' 


    it "doesn't break when the project was renamed" 

  end
end

