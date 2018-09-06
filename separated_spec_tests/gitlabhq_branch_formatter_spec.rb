require 'spec_helper'

describe Gitlab::LegacyGithubImport::BranchFormatter do
  let(:project) { create(:project, :repository) }
  let(:commit) { create(:commit, project: project) }
  let(:repo) { double }
  let(:raw) do
    {
      ref: 'branch-merged',
      repo: repo,
      sha: commit.id
    }
  end

  describe '#exists?' do
    it 'returns true when branch exists and commit is part of the branch' 


    it 'returns false when branch exists and commit is not part of the branch' 


    it 'returns false when branch does not exist' 

  end

  describe '#repo' do
    it 'returns raw repo' 

  end

  describe '#sha' do
    it 'returns raw sha' 

  end

  describe '#valid?' do
    it 'returns true when raw sha and ref are present' 


    it 'returns false when raw sha is blank' 


    it 'returns false when raw ref is blank' 

  end
end

