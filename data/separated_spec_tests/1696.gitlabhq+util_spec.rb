require 'spec_helper'

describe Gitlab::GitalyClient::Util do
  describe '.repository' do
    let(:repository_storage) { 'default' }
    let(:relative_path) { 'my/repo.git' }
    let(:gl_repository) { 'project-1' }
    let(:git_object_directory) { '.git/objects' }
    let(:git_alternate_object_directory) { ['/dir/one', '/dir/two'] }
    let(:git_env) do
      {
        'GIT_OBJECT_DIRECTORY_RELATIVE' => git_object_directory,
        'GIT_ALTERNATE_OBJECT_DIRECTORIES_RELATIVE' => git_alternate_object_directory
      }
    end

    subject do
      described_class.repository(repository_storage, relative_path, gl_repository)
    end

    it 'creates a Gitaly::Repository with the given data' 

  end
end

