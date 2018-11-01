require 'spec_helper'

describe Gitlab::Database::RenameReservedPathsMigration::V1::RenameBase, :delete do
  let(:migration) { FakeRenameReservedPathMigrationV1.new }
  let(:subject) { described_class.new(['the-path'], migration) }

  before do
    allow(migration).to receive(:say)
    TestEnv.clean_test_path
  end

  def migration_namespace(namespace)
    Gitlab::Database::RenameReservedPathsMigration::V1::MigrationClasses::
      Namespace.find(namespace.id)
  end

  def migration_project(project)
    Gitlab::Database::RenameReservedPathsMigration::V1::MigrationClasses::
      Project.find(project.id)
  end

  describe "#remove_last_ocurrence" do
    it "removes only the last occurance of a string" 

  end

  describe '#remove_cached_html_for_projects' do
    let(:project) { create(:project, description_html: 'Project description') }

    it 'removes description_html from projects' 


    it 'removes issue descriptions' 


    it 'removes merge request descriptions' 


    it 'removes note html' 


    it 'removes milestone description' 

  end

  describe '#rename_path_for_routable' do
    context 'for namespaces' do
      let(:namespace) { create(:namespace, path: 'the-path') }
      it "renames namespaces called the-path" 


      it "renames the route to the namespace" 


      it "renames the route for projects of the namespace" 


      it 'returns the old & the new path' 


      it "doesn't rename routes that start with a similar name" 


      context "the-path namespace -> subgroup -> the-path0 project" do
        it "updates the route of the project correctly" 

      end
    end

    context 'for projects' do
      let(:parent) { create(:namespace, path: 'the-parent') }
      let(:project) { create(:project, path: 'the-path', namespace: parent) }

      it 'renames the project called `the-path`' 


      it 'renames the route for the project' 


      it 'returns the old & new path' 

    end
  end

  describe '#perform_rename' do
    describe 'for namespaces' do
      let(:namespace) { create(:namespace, path: 'the-path') }
      it 'renames the path' 


      it 'renames all the routes for the namespace' 

    end
  end

  describe '#move_pages' do
    it 'moves the pages directory' 

  end

  describe "#move_uploads" do
    let(:test_dir) { File.join(Rails.root, 'tmp', 'tests', 'rename_reserved_paths') }
    let(:uploads_dir) { File.join(test_dir, 'public', 'uploads') }

    it 'moves subdirectories in the uploads folder' 


    it "doesn't move uploads when they are stored in object storage" 

  end

  describe '#move_folders' do
    let(:test_dir) { File.join(Rails.root, 'tmp', 'tests', 'rename_reserved_paths') }
    let(:uploads_dir) { File.join(test_dir, 'public', 'uploads') }

    before do
      FileUtils.remove_dir(test_dir) if File.directory?(test_dir)
      FileUtils.mkdir_p(uploads_dir)
      allow(subject).to receive(:uploads_dir).and_return(uploads_dir)
    end

    it 'moves a folder with files' 

  end

  describe '#track_rename', :redis do
    it 'tracks a rename in redis' 

  end

  describe '#reverts_for_type', :redis do
    it 'yields for each tracked rename' 


    it 'keeps the revert in redis if it failed' 

  end
end

