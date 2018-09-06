require 'rails_helper'

feature 'Locations page' do
  context 'when not signed in' do
    before :each do
      visit '/admin/locations'
    end

    it 'redirects to the admin sign in page' 


    it 'prompts the user to sign in or sign up' 


    it 'does not include a link to the Home page in the navigation' 


    it 'does not include a link to Your locations in the navigation' 

  end

  context 'when signed in' do
    before :each do
      login_admin
      visit '/admin/locations'
    end

    it 'displays instructions for editing locations' 


    it 'only shows links that belong to the admin' 


    it 'does not include a link to the sign up page in the navigation' 


    it 'does not include a link to the sign in page in the navigation' 


    it 'includes a link to sign out in the navigation' 


    it 'includes a link to the Edit Account page in the navigation' 


    it 'displays the name of the logged in admin in the navigation' 


    it 'includes a link to locations in the navigation' 

  end

  context 'when signed in as super admin' do
    before :each do
      @location = create(:location)
      create(:location_for_org_admin)
      login_super_admin
      visit '/admin/locations'
    end

    it 'displays instructions for editing locations' 


    it 'shows all locations' 


    it 'takes you to the right location when clicked' 


    it 'sorts locations alphabetically by name' 

  end
end

