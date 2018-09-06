require 'spec_helper'

feature 'Dashboard Groups page', :js do
  let(:user) { create :user }
  let(:group) { create(:group) }
  let(:nested_group) { create(:group, :nested) }
  let(:another_group) { create(:group) }

  def click_group_caret(group)
    within("#group-#{group.id}") do
      first('.folder-caret').click
    end
    wait_for_requests
  end

  it 'shows groups user is member of' 


  it 'shows subgroups the user is member of', :nested_groups do
    group.add_owner(user)
    nested_group.add_owner(user)

    sign_in(user)
    visit dashboard_groups_path
    wait_for_requests

    expect(page).to have_content(nested_group.parent.name)
    click_group_caret(nested_group.parent)
    expect(page).to have_content(nested_group.name)
  end

  context 'when filtering groups', :nested_groups do
    before do
      group.add_owner(user)
      nested_group.add_owner(user)
      expect(another_group).to be_persisted

      sign_in(user)

      visit dashboard_groups_path
    end

    it 'expands when filtering groups' 


    it 'resets search when user cleans the input' 

  end

  context 'with subgroups', :nested_groups do
    let!(:subgroup) { create(:group, :public, parent: group) }

    before do
      group.add_owner(user)
      subgroup.add_owner(user)

      sign_in(user)

      visit dashboard_groups_path
    end

    it 'shows subgroups inside of its parent group' 


    it 'can toggle parent group' 

  end

  context 'when using pagination' do
    let(:group)  { create(:group, created_at: 5.days.ago) }
    let(:group2) { create(:group, created_at: 2.days.ago) }

    before do
      group.add_owner(user)
      group2.add_owner(user)

      allow(Kaminari.config).to receive(:default_per_page).and_return(1)

      sign_in(user)
      visit dashboard_groups_path
    end

    it 'loads results for next page' 

  end

  context 'when signed in as admin' do
    let(:admin) { create(:admin) }

    it 'shows only groups admin is member of' 

  end
end

