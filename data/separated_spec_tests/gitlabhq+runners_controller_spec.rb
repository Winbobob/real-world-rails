require 'spec_helper'

describe Groups::RunnersController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:runner) { create(:ci_runner, :group, groups: [group]) }

  let(:params) do
    {
      group_id: group,
      id: runner
    }
  end

  before do
    sign_in(user)
    group.add_maintainer(user)
  end

  describe '#update' do
    it 'updates the runner and ticks the queue' 

  end

  describe '#destroy' do
    it 'destroys the runner' 

  end

  describe '#resume' do
    it 'marks the runner as active and ticks the queue' 

  end

  describe '#pause' do
    it 'marks the runner as inactive and ticks the queue' 

  end
end

