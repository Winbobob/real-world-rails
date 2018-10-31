require 'spec_helper'

describe Gitlab::GithubImport::Importer::RepositoryImporter do
  let(:repository) { double(:repository) }
  let(:import_state) { double(:import_state) }
  let(:client) { double(:client) }

  let(:project) do
    double(
      :project,
      import_url: 'foo.git',
      import_source: 'foo/bar',
      repository_storage: 'foo',
      disk_path: 'foo',
      repository: repository,
      create_wiki: true,
      import_state: import_state
    )
  end

  let(:importer) { described_class.new(project, client) }
  let(:shell_adapter) { Gitlab::Shell.new }

  before do
    # The method "gitlab_shell" returns a new instance every call, making
    # it harder to set expectations. To work around this we'll stub the method
    # and return the same instance on every call.
    allow(importer).to receive(:gitlab_shell).and_return(shell_adapter)
  end

  describe '#import_wiki?' do
    it 'returns true if the wiki should be imported' 


    it 'returns false if the GitHub wiki is disabled' 


    it 'returns false if the wiki has already been imported' 

  end

  describe '#execute' do
    it 'imports the repository and wiki' 


    it 'does not import the repository if it already exists' 


    it 'does not import the wiki if it is disabled' 


    it 'does not import the wiki if the repository could not be imported' 

  end

  describe '#import_repository' do
    it 'imports the repository' 


    it 'marks the import as failed when an error was raised' 

  end

  describe '#import_wiki_repository' do
    it 'imports the wiki repository' 


    it 'marks the import as failed and creates an empty repo if an error was raised' 

  end

  describe '#fail_import' do
    it 'marks the import as failed' 

  end

  describe '#update_clone_time' do
    it 'sets the timestamp for when the cloning process finished' 

  end
end

