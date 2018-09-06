require 'rails_helper'

describe 'Copy service to other locations' do
  context 'when organization has more than one location' do
    before do
      @location = create(:location)
      @new_loc = create(:far_loc, organization_id: @location.organization.id)
      @service = @location.services.create!(attributes_for(:service))
      login_super_admin
      visit '/admin/locations/vrs-services'
      click_link 'Literacy Program'
    end

    it 'shows the copy to location header' 


    it 'does not provide the existing location as a choice' 


    it 'unchecks all choices by default' 


    it 'allows copying the service to another location when authorized' 

  end

  context 'when organization only has one location' do
    before do
      @location = create(:location)
      @location.services.create!(attributes_for(:service))
      login_super_admin
      visit '/admin/locations/vrs-services'
      click_link 'Literacy Program'
    end

    it 'does not show the copy to location section' 

  end

  context 'when service is present at more than one location' do
    before do
      @location = create(:location)
      @service = @location.services.create!(attributes_for(:service))
      @new_loc = create(:far_loc, organization_id: @location.organization.id)
      @new_loc.services.create!(attributes_for(:service))
      @third_loc = create(:nearby_loc, organization_id: @location.organization.id)
      @third_loc.services.create!(attributes_for(:service).
        merge(name: 'New Service'))

      login_super_admin
      visit '/admin/locations/belmont-farmers-market'
      click_link 'Literacy Program'
    end

    it 'does not show location that already has the service' 


    it 'shows locations that do not have the service' 

  end
end

