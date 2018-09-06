require 'spec_helper'

describe GroupDescendantsFinder do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:params) { {} }
  subject(:finder) do
    described_class.new(current_user: user, parent_group: group, params: params)
  end

  before do
    group.add_owner(user)
  end

  describe '#has_children?' do
    it 'is true when there are projects' 


    context 'when there are subgroups', :nested_groups do
      it 'is true when there are projects' 

    end
  end

  describe '#execute' do
    it 'includes projects' 


    context 'when archived is `true`' do
      let(:params) { { archived: 'true' } }

      it 'includes archived projects' 

    end

    context 'when archived is `only`' do
      let(:params) { { archived: 'only' } }

      it 'includes only archived projects' 

    end

    it 'does not include archived projects' 


    context 'with a filter' do
      let(:params) { { filter: 'test' } }

      it 'includes only projects matching the filter' 

    end

    context 'sorting by name' do
      let!(:project1) { create(:project, namespace: group, name: 'a', path: 'project-a') }
      let!(:project2) { create(:project, namespace: group, name: 'z', path: 'project-z') }
      let(:params) do
        {
          sort: 'name_asc'
        }
      end

      it 'sorts elements by name' 


      context 'with nested groups', :nested_groups do
        let!(:subgroup1) { create(:group, parent: group, name: 'a', path: 'sub-a') }
        let!(:subgroup2) { create(:group, parent: group, name: 'z', path: 'sub-z') }

        it 'sorts elements by name' 

      end
    end
  end

  context 'with nested groups', :nested_groups do
    let!(:project) { create(:project, namespace: group) }
    let!(:subgroup) { create(:group, :private, parent: group) }

    describe '#execute' do
      it 'contains projects and subgroups' 


      it 'does not include subgroups the user does not have access to' 


      it 'only includes public groups when no user is given' 


      context 'when archived is `true`' do
        let(:params) { { archived: 'true' } }

        it 'includes archived projects in the count of subgroups' 

      end

      context 'with a filter' do
        let(:params) { { filter: 'test' } }

        it 'contains only matching projects and subgroups' 


        it 'does not include subgroups the user does not have access to' 


        context 'with matching children' do
          it 'includes a group that has a subgroup matching the query and its parent' 


          it 'includes the parent of a matching project' 


          context 'with a small page size' do
            let(:params) { { filter: 'test', per_page: 1 } }

            it 'contains all the ancestors of a matching subgroup regardless the page size' 

          end

          it 'does not include the parent itself' 

        end
      end
    end
  end
end

