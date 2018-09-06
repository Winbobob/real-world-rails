require 'spec_helper'

describe 'Roles', type: :feature do
  stub_authorization!

  before do
    create(:role, name: 'admin')
    create(:role, name: 'user')
    visit spree.admin_path
    click_link 'Configuration'
    # Crap workaround for animation to finish expanding so click doesn't hit ReimbursementTypes.
    sleep 1
    click_link 'Roles'
  end

  context 'show' do
    it 'displays existing roles' 

  end

  context 'create' do
    it 'is able to create a new role' 

  end

  context 'edit' do
    it 'is not able to edit the admin role' 

    it 'is able to edit the user role' 

  end
end

