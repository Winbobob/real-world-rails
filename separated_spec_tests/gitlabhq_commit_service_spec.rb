require 'spec_helper'

describe Gitlab::GitalyClient::CommitService do
  let(:project) { create(:project, :repository) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:repository) { project.repository }
  let(:repository_message) { repository.gitaly_repository }
  let(:revision) { '913c66a37b4a45b9769037c55c2d238bd0942d2e' }
  let(:commit) { project.commit(revision) }
  let(:client) { described_class.new(repository) }

  describe '#diff_from_parent' do
    context 'when a commit has a parent' do
      it 'sends an RPC request with the parent ID as left commit' 

    end

    context 'when a commit does not have a parent' do
      it 'sends an RPC request with empty tree ref as left commit' 

    end

    it 'returns a Gitlab::GitalyClient::DiffStitcher' 


    it 'encodes paths correctly' 

  end

  describe '#commit_deltas' do
    context 'when a commit has a parent' do
      it 'sends an RPC request with the parent ID as left commit' 

    end

    context 'when a commit does not have a parent' do
      it 'sends an RPC request with empty tree ref as left commit' 

    end
  end

  describe '#between' do
    let(:from) { 'master' }
    let(:to) { Gitlab::Git::EMPTY_TREE_ID }

    it 'sends an RPC request' 

  end

  describe '#tree_entries' do
    let(:path) { '/' }

    it 'sends a get_tree_entries message' 


    context 'with UTF-8 params strings' do
      let(:revision) { "branch\u011F" }
      let(:path) { "foo/\u011F.txt" }

      it 'handles string encodings correctly' 

    end
  end

  describe '#commit_count' do
    before do
      expect_any_instance_of(Gitaly::CommitService::Stub)
        .to receive(:count_commits)
        .with(gitaly_request_with_path(storage_name, relative_path),
              kind_of(Hash))
        .and_return([])
    end

    it 'sends a commit_count message' 


    context 'with UTF-8 params strings' do
      let(:revision) { "branch\u011F" }
      let(:path) { "foo/\u011F.txt" }

      it 'handles string encodings correctly' 

    end
  end

  describe '#find_commit' do
    let(:revision) { Gitlab::Git::EMPTY_TREE_ID }
    it 'sends an RPC request' 


    describe 'caching', :request_store do
      let(:commit_dbl) { double(id: 'f01b' * 10) }

      context 'when passed revision is a branch name' do
        it 'calls Gitaly' 

      end

      context 'when passed revision is a commit ID' do
        it 'returns a cached commit' 

      end
    end
  end

  describe '#patch' do
    let(:request) do
      Gitaly::CommitPatchRequest.new(
        repository: repository_message, revision: revision
      )
    end
    let(:response) { [double(data: "my "), double(data: "diff")] }

    subject { described_class.new(repository).patch(revision) }

    it 'sends an RPC request' 


    it 'concatenates the responses data' 

  end

  describe '#commit_stats' do
    let(:request) do
      Gitaly::CommitStatsRequest.new(
        repository: repository_message, revision: revision
      )
    end
    let(:response) do
      Gitaly::CommitStatsResponse.new(
        oid: revision,
        additions: 11,
        deletions: 15
      )
    end

    subject { described_class.new(repository).commit_stats(revision) }

    it 'sends an RPC request' 

  end
end

