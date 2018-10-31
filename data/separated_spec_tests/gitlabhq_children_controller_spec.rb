require 'spec_helper'

describe Groups::ChildrenController do
  let(:group) { create(:group, :public) }
  let(:user) { create(:user) }
  let!(:group_member) { create(:group_member, group: group, user: user) }

  describe 'GET #index' do
    context 'for projects' do
      let!(:public_project) { create(:project, :public, namespace: group) }
      let!(:private_project) { create(:project, :private, namespace: group) }

      context 'as a user' do
        before do
          sign_in(user)
        end

        it 'shows all children' 


        context 'being member of private subgroup' do
          it 'shows public and private children the user is member of' 

        end
      end

      context 'as a guest' do
        it 'shows the public children' 

      end
    end

    context 'for subgroups', :nested_groups do
      let!(:public_subgroup) { create(:group, :public, parent: group) }
      let!(:private_subgroup) { create(:group, :private, parent: group) }
      let!(:public_project) { create(:project, :public, namespace: group) }
      let!(:private_project) { create(:project, :private, namespace: group) }

      context 'as a user' do
        before do
          sign_in(user)
        end

        it 'shows all children' 


        context 'being member of private subgroup' do
          it 'shows public and private children the user is member of' 

        end
      end

      context 'as a guest' do
        it 'shows the public children' 

      end

      context 'filtering children' do
        it 'expands the tree for matching projects' 


        it 'expands the tree for matching subgroups' 


        it 'merges the trees correctly' 


        it 'expands the tree upto a specified parent' 


        it 'returns an array with one element when only one result is matched' 


        it 'returns an empty array when there are no search results' 


        it 'succeeds if multiple pages contain matching subgroups' 


        it 'includes pagination headers' 

      end

      context 'queries per rendered element', :request_store do
        # We need to make sure the following counts are preloaded
        # otherwise they will cause an extra query
        # 1. Count of visible projects in the element
        # 2. Count of visible subgroups in the element
        # 3. Count of members of a group
        let(:expected_queries_per_group) { 0 }
        let(:expected_queries_per_project) { 0 }

        def get_list
          get :index, group_id: group.to_param, format: :json
        end

        it 'queries the expected amount for a group row' 


        it 'queries the expected amount for a project row' 


        context 'when rendering hierarchies' do
          # When loading hierarchies we load the all the ancestors for matched projects
          # in 1 separate query
          let(:extra_queries_for_hierarchies) { 1 }

          def get_filtered_list
            get :index, group_id: group.to_param, filter: 'filter', format: :json
          end

          it 'queries the expected amount when nested rows are increased for a group' 


          it 'queries the expected amount when a new group match is added' 


          it 'queries the expected amount when nested rows are increased for a project' 

        end
      end
    end

    context 'pagination' do
      let(:per_page) { 3 }

      before do
        allow(Kaminari.config).to receive(:default_per_page).and_return(per_page)
      end

      context 'with only projects' do
        let!(:other_project) { create(:project, :public, namespace: group) }
        let!(:first_page_projects) { create_list(:project, per_page, :public, namespace: group ) }

        it 'has projects on the first page' 


        it 'has projects on the second page' 

      end

      context 'with subgroups and projects', :nested_groups do
        let!(:first_page_subgroups) { create_list(:group,  per_page, :public,  parent: group) }
        let!(:other_subgroup) { create(:group, :public, parent: group) }
        let!(:next_page_projects) { create_list(:project, per_page, :public, namespace: group) }

        it 'contains all subgroups' 


        it 'contains the project and group on the second page' 


        context 'with a mixed first page' do
          let!(:first_page_subgroups) { [create(:group,  :public,  parent: group)] }
          let!(:first_page_projects) { create_list(:project, per_page, :public, namespace: group) }

          it 'correctly calculates the counts' 

        end
      end
    end
  end
end

