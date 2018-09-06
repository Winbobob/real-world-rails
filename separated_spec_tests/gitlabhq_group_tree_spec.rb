require 'spec_helper'

describe GroupTree do
  let(:group) { create(:group, :public) }
  let(:user) { create(:user) }

  controller(ApplicationController) do
    # `described_class` is not available in this context
    include GroupTree # rubocop:disable RSpec/DescribedClass

    def index
      render_group_tree GroupsFinder.new(current_user).execute
    end
  end

  before do
    group.add_owner(user)
    sign_in(user)
  end

  describe 'GET #index' do
    it 'filters groups' 


    context 'for subgroups', :nested_groups do
      it 'only renders root groups when no parent was given' 


      it 'contains only the subgroup when a parent was given' 


      it 'allows filtering for subgroups and includes the parents for rendering' 


      it 'does not include groups the user does not have access to' 

    end

    context 'json content' do
      it 'shows groups as json' 


      context 'nested groups', :nested_groups do
        it 'expands the tree when filtering' 

      end
    end
  end
end

