require 'rails_helper'

feature 'Organizations page' do
  context 'when not signed in' do
    before :each do
      visit '/admin/organizations'
    end

    it 'redirects to the admin sign in page' 


    it 'prompts the user to sign in or sign up' 


    it 'does not include a link to organizations in the navigation' 

  end

  context 'when signed in' do
    before :each do
      login_admin
      visit '/admin/organizations'
    end

    it 'displays instructions for editing organizations' 


    it 'only shows links that belong to the admin' 

  end

  context 'when signed in as super admin' do
    before :each do
      create(:location_for_org_admin)
      @loc = create(:location)
      login_super_admin
      visit '/admin/organizations'
    end

    it 'displays instructions for editing organizations' 


    it 'shows all organizations' 


    it 'takes you to the right organization when clicked' 


    it 'sorts organizations alphabetically by name' 

  end
end

