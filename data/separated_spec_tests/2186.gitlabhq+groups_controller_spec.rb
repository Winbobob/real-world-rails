require 'spec_helper'

describe Dashboard::GroupsController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  it 'renders group trees' 


  it 'only includes projects the user is a member of' 


  context 'when rendering an expanded hierarchy with public groups you are not a member of', :nested_groups do
    let!(:top_level_result) { create(:group, name: 'chef-top') }
    let!(:top_level_a) { create(:group, name: 'top-a') }
    let!(:sub_level_result_a) { create(:group, name: 'chef-sub-a', parent: top_level_a) }
    let!(:other_group) { create(:group, name: 'other') }

    before do
      top_level_result.add_maintainer(user)
      top_level_a.add_maintainer(user)
    end

    it 'renders only groups the user is a member of when searching hierarchy correctly' 

  end
end

