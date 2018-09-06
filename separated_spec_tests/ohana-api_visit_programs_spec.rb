require 'rails_helper'

feature 'Programs page' do
  context 'when not signed in' do
    before :each do
      visit '/admin/programs'
    end

    it 'redirects to the admin sign in page' 


    it 'prompts the user to sign in or sign up' 


    it 'does not include a link to programs in the navigation' 

  end

  context 'when signed in' do
    before :each do
      login_admin
      visit '/admin/programs'
    end

    it 'displays instructions for editing programs' 


    it 'only shows links that belong to the admin' 


    it 'does not show add new program button if admin has no organizations' 


    it 'shows add new program button if admin has an organization' 

  end

  context 'when signed in as super admin' do
    before :each do
      nearby = create(:nearby_loc)
      @program = nearby.organization.programs.
                 create!(attributes_for(:program).
                 merge(name: 'Nearby Program'))

      loc = create(:location_for_org_admin)
      loc.organization.programs.create!(attributes_for(:program))

      login_super_admin
      visit '/admin/programs'
    end

    it 'displays instructions for editing programs' 


    it 'shows all programs' 


    it 'takes you to the right program when clicked' 


    it 'sorts programs alphabetically by name' 


    it 'shows the add new program button' 

  end
end

