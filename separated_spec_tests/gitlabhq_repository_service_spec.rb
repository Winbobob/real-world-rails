require 'spec_helper'

describe Gitlab::GitalyClient::RepositoryService do
  let(:project) { create(:project) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:client) { described_class.new(project.repository) }

  describe '#exists?' do
    it 'sends a repository_exists message' 

  end

  describe '#cleanup' do
    it 'sends a cleanup message' 

  end

  describe '#garbage_collect' do
    it 'sends a garbage_collect message' 

  end

  describe '#repack_full' do
    it 'sends a repack_full message' 

  end

  describe '#repack_incremental' do
    it 'sends a repack_incremental message' 

  end

  describe '#repository_size' do
    it 'sends a repository_size message' 

  end

  describe '#apply_gitattributes' do
    let(:revision) { 'master' }

    it 'sends an apply_gitattributes message' 

  end

  describe '#info_attributes' do
    it 'reads the info attributes' 

  end

  describe '#has_local_branches?' do
    it 'sends a has_local_branches message' 

  end

  describe '#fetch_remote' do
    let(:ssh_auth) { double(:ssh_auth, ssh_import?: true, ssh_key_auth?: false, ssh_known_hosts: nil) }
    let(:import_url) { 'ssh://example.com' }

    it 'sends a fetch_remote_request message' 

  end

  describe '#rebase_in_progress?' do
    let(:rebase_id) { 1 }

    it 'sends a repository_rebase_in_progress message' 

  end

  describe '#squash_in_progress?' do
    let(:squash_id) { 1 }

    it 'sends a repository_squash_in_progress message' 

  end

  describe '#calculate_checksum' do
    it 'sends a calculate_checksum message' 

  end

  describe '#create_from_snapshot' do
    it 'sends a create_repository_from_snapshot message' 

  end

  describe '#raw_changes_between' do
    it 'sends a create_repository_from_snapshot message' 

  end
end

