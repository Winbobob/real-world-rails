require 'spec_helper'

describe Gitlab::BareRepositoryImport::Importer, :seed_helper do
  let!(:admin) { create(:admin) }
  let!(:base_dir) { Dir.mktmpdir + '/' }
  let(:bare_repository) { Gitlab::BareRepositoryImport::Repository.new(base_dir, File.join(base_dir, "#{project_path}.git")) }
  let(:gitlab_shell) { Gitlab::Shell.new }
  let(:source_project) { TEST_REPO_PATH }

  subject(:importer) { described_class.new(admin, bare_repository) }

  before do
    allow(described_class).to receive(:log)
  end

  after do
    FileUtils.rm_rf(base_dir)
    TestEnv.clean_test_path
    ensure_seeds
  end

  shared_examples 'importing a repository' do
    describe '.execute' do
      it 'creates a project for a repository in storage' 


      it 'skips wiki repos' 


      context 'without admin users' do
        let(:admin) { nil }

        it 'raises an error' 

      end
    end

    describe '#create_project_if_needed' do
      it 'starts an import for a project that did not exist' 


      it 'skips importing when the project already exists' 


      it 'creates a project with the correct path in the database' 


      it 'does not schedule an import' 


      it 'creates the Git repo on disk' 


      context 'hashed storage enabled' do
        it 'creates a project with the correct path in the database' 

      end
    end
  end

  context 'with subgroups', :nested_groups do
    let(:project_path) { 'a-group/a-sub-group/a-project' }

    let(:existing_group) do
      group = create(:group, path: 'a-group')
      create(:group, path: 'a-sub-group', parent: group)
    end

    it_behaves_like 'importing a repository'
  end

  context 'without subgroups' do
    let(:project_path) { 'a-group/a-project' }
    let(:existing_group) { create(:group, path: 'a-group') }

    it_behaves_like 'importing a repository'
  end

  context 'without groups' do
    let(:project_path) { 'a-project' }

    it 'starts an import for a project that did not exist' 


    it 'creates a project with the correct path in the database' 


    it 'creates the Git repo in disk' 


    context 'with a repository already on disk' do
      let!(:base_dir) { TestEnv.repos_path }
      # This is a quick way to get a valid repository instead of copying an
      # existing one. Since it's not persisted, the importer will try to
      # create the project.
      let(:project) { build(:project, :legacy_storage, :repository) }
      let(:project_path) { project.full_path }

      it 'moves an existing project to the correct path' 

    end
  end

  context 'with Wiki' do
    let(:project_path) { 'a-group/a-project' }
    let(:existing_group) { create(:group, path: 'a-group') }

    it_behaves_like 'importing a repository'

    it 'creates the Wiki git repo in disk' 

  end

  context 'when subgroups are not available' do
    let(:project_path) { 'a-group/a-sub-group/a-project' }

    before do
      expect(Group).to receive(:supports_nested_groups?) { false }
    end

    describe '#create_project_if_needed' do
      it 'raises an error' 

    end
  end

  def prepare_repository(project_path, source_project)
    repo_path = File.join(base_dir, project_path)

    return create_bare_repository(repo_path) unless source_project

    cmd = %W(#{Gitlab.config.git.bin_path} clone --bare #{source_project} #{repo_path})

    system(git_env, *cmd, chdir: SEED_STORAGE_PATH, out: '/dev/null', err: '/dev/null')
  end
end

