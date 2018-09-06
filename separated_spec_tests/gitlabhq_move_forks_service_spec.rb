require 'spec_helper'

describe Projects::MoveForksService do
  include ProjectForksHelper

  let!(:user) { create(:user) }
  let!(:project_with_forks) { create(:project, namespace: user.namespace) }
  let!(:target_project) { create(:project, namespace: user.namespace) }
  let!(:lvl1_forked_project_1) { fork_project(project_with_forks, user) }
  let!(:lvl1_forked_project_2) { fork_project(project_with_forks, user) }
  let!(:lvl2_forked_project_1_1) { fork_project(lvl1_forked_project_1, user) }
  let!(:lvl2_forked_project_1_2) { fork_project(lvl1_forked_project_1, user) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    context 'when moving a root forked project' do
      it 'moves the descendant forks' 


      it 'updates the fork network' 

    end

    context 'when moving a intermediate forked project' do
      it 'moves the descendant forks' 


      it 'moves the ascendant fork' 


      it 'does not update fork network' 

    end

    context 'when moving a leaf forked project' do
      it 'moves the ascendant fork' 


      it 'does not update fork network' 

    end

    it 'rollbacks changes if transaction fails' 

  end
end

