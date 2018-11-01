require 'spec_helper'

describe Gitlab::GitalyClient::RefService do
  let(:project) { create(:project, :repository) }
  let(:storage_name) { project.repository_storage }
  let(:relative_path) { project.disk_path + '.git' }
  let(:repository) { project.repository }
  let(:client) { described_class.new(repository) }

  describe '#branches' do
    it 'sends a find_all_branches message' 

  end

  describe '#remote_branches' do
    let(:remote_name) { 'my_remote' }
    subject { client.remote_branches(remote_name) }

    it 'sends a find_all_remote_branches message' 


    it 'concantes and returns the response branches as Gitlab::Git::Branch objects' 

  end

  describe '#branch_names' do
    it 'sends a find_all_branch_names message' 

  end

  describe '#tag_names' do
    it 'sends a find_all_tag_names message' 

  end

  describe '#default_branch_name' do
    it 'sends a find_default_branch_name message' 

  end

  describe '#local_branches' do
    it 'sends a find_local_branches message' 


    it 'parses and sends the sort parameter' 


    it 'translates known mismatches on sort param values' 


    it 'raises an argument error if an invalid sort_by parameter is passed' 

  end

  describe '#find_ref_name', :seed_helper do
    subject { client.find_ref_name(SeedRepo::Commit::ID, 'refs/heads/master') }

    it { is_expected.to be_utf8 }
    it { is_expected.to eq('refs/heads/master') }
  end

  describe '#ref_exists?', :seed_helper do
    it 'finds the master branch ref' 


    it 'returns false for an illegal tag name ref' 


    it 'raises an argument error if the ref name parameter does not start with refs/' 

  end

  describe '#delete_refs' do
    let(:prefixes) { %w(refs/heads refs/keep-around) }

    it 'sends a delete_refs message' 

  end
end

