require 'rails_helper'

describe ProjectOwnership do
  let(:user) { create :user, :with_team, email: 'user@example.com' }
  let(:team) { user.teams.first }
  let(:admin) { create :user, :with_team_and_is_admin }
  let(:another_team) { admin.teams.first }
  let(:project) { create(:project, users: [user]) }
  let(:another_project) { create(:project) }

  before do
    team.ownerships.create(project: project, is_owner: true)
    team.ownerships.create(project: another_project, is_owner: true)
  end

  subject { described_class.new(project, another_team, team, ownership_action) }

  describe '#perform' do
    context 'when booth teams is the same' do
      let(:another_team) { team }
      let(:ownership_action) { 'share' }

      it 'returns false' 

    end

    context 'sharing project' do
      let(:ownership_action) { 'share' }

      it 'shares the project' 

    end

    context 'unsharing project' do
      before { another_team.ownerships.create(project: project, is_owner: false) }

      let(:ownership_action) { 'unshare' }

      it 'unshares the project' 

    end

    context 'transfering project' do
      let(:ownership_action) { 'transfer' }

      it 'transfer the project' 

    end
  end

  describe '#performed_action_message' do
    context 'sharing project' do
      let(:ownership_action) { 'share' }

      it 'returns shared message' 

    end

    context 'unsharing project' do
      let(:ownership_action) { 'unshare' }

      it 'returns shared message' 

    end

    context 'transfering project' do
      let(:ownership_action) { 'transfer' }

      it 'returns shared message' 

    end
  end

  describe '#transfer?' do
    context 'with transfer action' do
      let(:ownership_action) { 'transfer' }

      it { is_expected.to be_transfer }
    end

    context 'with non transfer action' do
      let(:ownership_action) { 'share' }

      it { is_expected.not_to be_transfer }
    end
  end
end

