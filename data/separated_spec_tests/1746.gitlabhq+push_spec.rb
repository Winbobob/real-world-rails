require 'spec_helper'

describe Gitlab::Git::Push do
  set(:project) { create(:project, :repository) }

  let(:oldrev) { project.commit('HEAD~2').id }
  let(:newrev) { project.commit.id }
  let(:ref) { 'refs/heads/some-branch' }

  subject { described_class.new(project, oldrev, newrev, ref) }

  describe '#branch_name' do
    context 'when it is a branch push' do
      let(:ref) { 'refs/heads/my-branch' }

      it 'returns branch name' 

    end

    context 'when it is a tag push' do
      let(:ref) { 'refs/tags/my-branch' }

      it 'returns nil' 

    end
  end

  describe '#branch_push?' do
    context 'when pushing a branch ref' do
      let(:ref) { 'refs/heads/my-branch' }

      it { is_expected.to be_branch_push }
    end

    context 'when it is a tag push' do
      let(:ref) { 'refs/tags/my-tag' }

      it { is_expected.not_to be_branch_push }
    end
  end

  describe '#branch_updated?' do
    context 'when it is a branch push with correct old and new revisions' do
      it { is_expected.to be_branch_updated }
    end

    context 'when it is not a branch push' do
      let(:ref) { 'refs/tags/my-tag' }

      it { is_expected.not_to be_branch_updated }
    end

    context 'when old revision is blank' do
      let(:oldrev) { Gitlab::Git::BLANK_SHA }

      it { is_expected.not_to be_branch_updated }
    end

    context 'when it is not a branch push' do
      let(:newrev) { Gitlab::Git::BLANK_SHA }

      it { is_expected.not_to be_branch_updated }
    end

    context 'when oldrev is nil' do
      let(:oldrev) { nil }

      it { is_expected.not_to be_branch_updated }
    end
  end

  describe '#force_push?' do
    context 'when old revision is an ancestor of the new revision' do
      let(:oldrev) { 'HEAD~3' }
      let(:newrev) { 'HEAD~1' }

      it { is_expected.not_to be_force_push }
    end

    context 'when old revision is not an ancestor of the new revision' do
      let(:oldrev) { 'HEAD~3' }
      let(:newrev) { '123456' }

      it { is_expected.to be_force_push }
    end
  end

  describe '#branch_added?' do
    context 'when old revision is defined' do
      it { is_expected.not_to be_branch_added }
    end

    context 'when old revision is not defined' do
      let(:oldrev) { Gitlab::Git::BLANK_SHA }

      it { is_expected.to be_branch_added }
    end
  end

  describe '#branch_removed?' do
    context 'when new revision is defined' do
      it { is_expected.not_to be_branch_removed }
    end

    context 'when new revision is not defined' do
      let(:newrev) { Gitlab::Git::BLANK_SHA }

      it { is_expected.to be_branch_removed }
    end
  end

  describe '#modified_paths' do
    context 'when a push is a branch update' do
      let(:newrev) { '498214d' }
      let(:oldrev) { '281d3a7' }

      it 'returns modified paths' 

    end

    context 'when a push is not a branch update' do
      let(:oldrev) { Gitlab::Git::BLANK_SHA }

      it 'raises an error' 

    end
  end

  describe '#oldrev' do
    context 'when a valid oldrev is provided' do
      it 'returns oldrev' 

    end

    context 'when a nil valud is provided' do
      let(:oldrev) { nil }

      it 'returns blank SHA' 

    end
  end

  describe '#newrev' do
    context 'when valid newrev is provided' do
      it 'returns newrev' 

    end

    context 'when a nil valud is provided' do
      let(:newrev) { nil }

      it 'returns blank SHA' 

    end
  end
end

