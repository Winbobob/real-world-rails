require 'spec_helper'

feature 'User creates a project', :js do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    create(:personal_key, user: user)
  end

  it 'creates a new project' 


  context 'in a subgroup they do not own', :nested_groups do
    let(:parent) { create(:group) }
    let!(:subgroup) { create(:group, parent: parent) }

    before do
      parent.add_owner(user)
    end

    it 'creates a new project' 

  end
end

