require 'spec_helper'

describe ::Gitlab::BareRepositoryImport::Repository do
  context 'legacy storage' do
    subject { described_class.new('/full/path/', '/full/path/to/repo.git') }

    it 'stores the repo path' 


    it 'stores the group path' 


    it 'stores the project name' 


    it 'stores the wiki path' 


    describe '#processable?' do
      it 'returns false if it is a wiki' 


      it 'returns true if group path is missing' 


      it 'returns true when group path and project name are present' 

    end

    describe '#project_full_path' do
      it 'returns the project full path with trailing slash in the root path' 


      it 'returns the project full path with no trailing slash in the root path' 

    end
  end

  context 'hashed storage' do
    let(:gitlab_shell) { Gitlab::Shell.new }
    let(:repository_storage) { 'default' }
    let(:root_path) { Gitlab.config.repositories.storages[repository_storage].legacy_disk_path }
    let(:hash) { '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b' }
    let(:hashed_path) { "@hashed/6b/86/6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b" }
    let(:repo_path) { File.join(root_path, "#{hashed_path}.git") }
    let(:wiki_path) { File.join(root_path, "#{hashed_path}.wiki.git") }

    before do
      gitlab_shell.create_repository(repository_storage, hashed_path)
      Gitlab::GitalyClient::StorageSettings.allow_disk_access do
        repository = Rugged::Repository.new(repo_path)
        repository.config['gitlab.fullpath'] = 'to/repo'
      end
    end

    after do
      gitlab_shell.remove_repository(repository_storage, hashed_path)
    end

    subject { described_class.new(root_path, repo_path) }

    it 'stores the repo path' 


    it 'stores the wiki path' 


    it 'reads the group path from .git/config' 


    it 'reads the project name from .git/config' 


    describe '#processable?' do
      it 'returns false if it is a wiki' 


      it 'returns false when group and project name are missing' 


      it 'returns true when group path and project name are present' 

    end

    describe '#project_full_path' do
      it 'returns the project full path with trailing slash in the root path' 


      it 'returns the project full path with no trailing slash in the root path' 

    end
  end
end

