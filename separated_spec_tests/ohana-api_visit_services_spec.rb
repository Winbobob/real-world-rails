require 'rails_helper'

feature 'Services page' do
  context 'when not signed in' do
    before :each do
      visit '/admin/services'
    end

    it 'redirects to the admin sign in page' 


    it 'prompts the user to sign in or sign up' 


    it 'does not include a link to services in the navigation' 

  end

  context 'when signed in' do
    before :each do
      login_admin
      visit '/admin/services'
    end

    it 'displays instructions for editing services' 


    it 'only shows links that belong to the admin' 

  end

  context 'when signed in as super admin' do
    before :each do
      @nearby = create(:nearby_loc)
      @service = @nearby.services.
                 create!(attributes_for(:service).
                 merge(name: 'Nearby Service'))

      loc = create(:location_for_org_admin)
      loc.services.create!(attributes_for(:service))

      login_super_admin
      visit '/admin/services'
    end

    it 'displays instructions for editing services' 


    it 'shows all services' 


    it 'takes you to the right service when clicked' 


    it 'sorts services alphabetically by name' 

  end
end

