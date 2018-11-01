require 'spec_helper'

describe TodosFinder do
  describe '#execute' do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:project) { create(:project, namespace: group) }
    let(:issue) { create(:issue, project: project) }
    let(:merge_request) { create(:merge_request, source_project: project) }
    let(:finder) { described_class }

    before do
      group.add_developer(user)
    end

    describe '#execute' do
      context 'filtering' do
        let!(:todo1) { create(:todo, user: user, project: project, target: issue) }
        let!(:todo2) { create(:todo, user: user, group: group, target: merge_request) }

        it 'returns correct todos when filtered by a project' 


        it 'returns correct todos when filtered by a group' 


        it 'returns correct todos when filtered by a type' 


        context 'with subgroups', :nested_groups do
          let(:subgroup) { create(:group, parent: group) }
          let!(:todo3) { create(:todo, user: user, group: subgroup, target: issue) }

          it 'returns todos from subgroups when filtered by a group' 

        end
      end
    end

    describe '#sort' do
      context 'by date' do
        let!(:todo1) { create(:todo, user: user, project: project) }
        let!(:todo2) { create(:todo, user: user, project: project) }
        let!(:todo3) { create(:todo, user: user, project: project) }

        it 'sorts with oldest created first' 


        it 'sorts with newest created first' 

      end

      it "sorts by priority" 

    end
  end

  describe '#any_for_target?' do
    it 'returns true if there are any todos for the given target' 


    it 'returns false if there are no todos for the given target' 

  end
end

