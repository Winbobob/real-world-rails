require 'spec_helper'

describe LabelsFinder do
  describe '#execute' do
    let(:group_1) { create(:group) }
    let(:group_2) { create(:group) }
    let(:group_3) { create(:group) }
    let(:private_group_1) { create(:group, :private) }
    let(:private_subgroup_1) { create(:group, :private, parent: private_group_1) }

    let(:project_1) { create(:project, namespace: group_1) }
    let(:project_2) { create(:project, namespace: group_2) }
    let(:project_3) { create(:project) }
    let(:project_4) { create(:project, :public) }
    let(:project_5) { create(:project, namespace: group_1) }

    let!(:project_label_1) { create(:label, project: project_1, title: 'Label 1') }
    let!(:project_label_2) { create(:label, project: project_2, title: 'Label 2') }
    let!(:project_label_4) { create(:label, project: project_4, title: 'Label 4') }
    let!(:project_label_5) { create(:label, project: project_5, title: 'Label 5') }

    let!(:group_label_1) { create(:group_label, group: group_1, title: 'Label 1 (group)') }
    let!(:group_label_2) { create(:group_label, group: group_1, title: 'Group Label 2') }
    let!(:group_label_3) { create(:group_label, group: group_2, title: 'Group Label 3') }
    let!(:private_group_label_1) { create(:group_label, group: private_group_1, title: 'Private Group Label 1') }
    let!(:private_subgroup_label_1) { create(:group_label, group: private_subgroup_1, title: 'Private Sub Group Label 1') }

    let(:user) { create(:user) }

    before do
      create(:label, project: project_3, title: 'Label 3')
      create(:group_label, group: group_3, title: 'Group Label 4')

      project_1.add_developer(user)
    end

    context 'with no filter' do
      it 'returns labels from projects the user have access' 


      it 'returns labels available if nil title is supplied' 

    end

    context 'filtering by group_id' do
      it 'returns labels available for any non-archived project within the group' 


      context 'when only_group_labels is true' do
        it 'returns only group labels' 

      end

      context 'when group has no projects' do
        let(:empty_group) { create(:group) }
        let!(:empty_group_label_1) { create(:group_label, group: empty_group, title: 'Label 1 (empty group)') }
        let!(:empty_group_label_2) { create(:group_label, group: empty_group, title: 'Label 2 (empty group)') }

        before do
          empty_group.add_developer(user)
        end

        context 'when only group labels is false' do
          it 'returns group labels' 

        end
      end

      context 'when including labels from group ancestors', :nested_groups do
        it 'returns labels from group and its ancestors' 


        it 'ignores labels from groups which user can not read' 

      end

      context 'when including labels from group descendants', :nested_groups do
        it 'returns labels from group and its descendants' 


        it 'ignores labels from groups which user can not read' 

      end
    end

    context 'filtering by project_id', :nested_groups do
      context 'when include_ancestor_groups is true' do
        let!(:sub_project) { create(:project, namespace: private_subgroup_1 ) }
        let!(:project_label) { create(:label, project: sub_project, title: 'Label 5') }
        let(:finder) { described_class.new(user, project_id: sub_project.id, include_ancestor_groups: true) }

        before do
          private_group_1.add_developer(user)
        end

        it 'returns all ancestor labels' 

      end

      it 'returns labels available for the project' 


      context 'as an administrator' do
        it 'does not return labels from another project' 

      end
    end

    context 'filtering by title' do
      it 'returns label with that title' 


      it 'returns label with title alias' 


      it 'returns no labels if empty title is supplied' 


      it 'returns no labels if blank title is supplied' 


      it 'returns no labels if empty name is supplied' 

    end
  end
end

