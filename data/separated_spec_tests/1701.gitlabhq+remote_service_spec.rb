require 'spec_helper'

describe Gitlab::GitalyClient::RemoteService do
  let(:project) { create(:project) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:remote_name) { 'my-remote' }
  let(:client) { described_class.new(project.repository) }

  describe '#add_remote' do
    let(:url) { 'http://my-repo.git' }
    let(:mirror_refmap) { :all_refs }

    it 'sends an add_remote message' 

  end

  describe '#remove_remote' do
    it 'sends an remove_remote message and returns the result value' 

  end

  describe '#fetch_internal_remote' do
    let(:remote_repository) { Gitlab::Git::Repository.new('default', TEST_MUTABLE_REPO_PATH, '') }

    it 'sends an fetch_internal_remote message and returns the result value' 

  end

  describe '#find_remote_root_ref' do
    it 'sends an find_remote_root_ref message and returns the root ref' 


    it 'ensure ref is a valid UTF-8 string' 

  end

  describe '#update_remote_mirror' do
    let(:ref_name) { 'remote_mirror_1' }
    let(:only_branches_matching) { ['my-branch', 'master'] }

    it 'sends an update_remote_mirror message' 

  end

  describe '.exists?' do
    context "when the remote doesn't exist" do
      let(:url) { 'https://gitlab.com/gitlab-org/ik-besta-niet-of-ik-word-geplaagd.git' }

      it 'returns false' 

    end
  end
end

