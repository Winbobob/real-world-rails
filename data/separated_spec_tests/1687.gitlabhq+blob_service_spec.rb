require 'spec_helper'

describe Gitlab::GitalyClient::BlobService do
  let(:project) { create(:project, :repository) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:repository) { project.repository }
  let(:client) { described_class.new(repository) }

  describe '#get_new_lfs_pointers' do
    let(:revision) { 'master' }
    let(:limit) { 5 }
    let(:not_in) { ['branch-a', 'branch-b'] }
    let(:expected_params) do
      { revision: revision, limit: limit, not_in_refs: not_in, not_in_all: false }
    end

    subject { client.get_new_lfs_pointers(revision, limit, not_in) }

    it 'sends a get_new_lfs_pointers message' 


    context 'with not_in = :all' do
      let(:not_in) { :all }
      let(:expected_params) do
        { revision: revision, limit: limit, not_in_refs: [], not_in_all: true }
      end

      it 'sends the correct message' 

    end
  end

  describe '#get_all_lfs_pointers' do
    let(:revision) { 'master' }

    subject { client.get_all_lfs_pointers(revision) }

    it 'sends a get_all_lfs_pointers message' 

  end
end

