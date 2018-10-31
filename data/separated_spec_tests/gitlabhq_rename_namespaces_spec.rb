require 'spec_helper'

describe Gitlab::Database::RenameReservedPathsMigration::V1::RenameNamespaces, :delete do
  let(:migration) { FakeRenameReservedPathMigrationV1.new }
  let(:subject) { described_class.new(['the-path'], migration) }
  let(:namespace) { create(:group, name: 'the-path') }

  before do
    allow(migration).to receive(:say)
    TestEnv.clean_test_path
  end

  def migration_namespace(namespace)
    Gitlab::Database::RenameReservedPathsMigration::V1::MigrationClasses::
      Namespace.find(namespace.id)
  end

  describe '#namespaces_for_paths' do
    context 'nested namespaces' do
      let(:subject) { described_class.new(['parent/the-Path'], migration) }

      it 'includes the namespace' 

    end

    context 'for child namespaces' do
      it 'only returns child namespaces with the correct path' 


      it 'has no namespaces that look the same' 

    end

    context 'for top levelnamespaces' do
      it 'only returns child namespaces with the correct path' 


      it 'has no namespaces that just look the same' 

    end
  end

  describe '#move_repositories' do
    let(:namespace) { create(:group, name: 'hello-group') }
    it 'moves a project for a namespace' 


    it 'moves a namespace in a subdirectory correctly' 


    it 'moves a parent namespace with subdirectories' 

  end

  describe "#child_ids_for_parent" do
    it "collects child ids for all levels" 

  end

  describe "#rename_namespace" do
    it 'renames paths & routes for the namespace' 


    it 'tracks the rename' 


    it 'renames things related to the namespace' 

  end

  describe '#rename_namespace_dependencies' do
    it "moves the the repository for a project in the namespace" 


    it "moves the uploads for the namespace" 


    it "moves the pages for the namespace" 


    it 'invalidates the markdown cache of related projects' 


    it "doesn't rename users for other namespaces" 


    it 'renames the username of a namespace for a user' 

  end

  describe '#rename_user' do
    it 'renames a username' 

  end

  describe '#rename_namespaces' do
    let!(:top_level_namespace) { create(:group, path: 'the-path') }
    let!(:child_namespace) do
      create(:group, path: 'the-path', parent: create(:group))
    end

    it 'renames top level namespaces the namespace' 


    it 'renames child namespaces' 

  end

  describe '#revert_renames', :redis do
    it 'renames the routes back to the previous values' 


    it 'moves the repositories back to their original place' 


    it "doesn't break when the namespace was renamed" 

  end
end

