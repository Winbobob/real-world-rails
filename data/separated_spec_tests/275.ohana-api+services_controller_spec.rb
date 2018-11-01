require 'rails_helper'

describe Admin::ServicesController do
  describe 'GET edit' do
    before(:each) do
      @loc = create(:location_with_admin)
      @service = @loc.services.create!(attributes_for(:service))
    end

    context 'when admin is super admin' do
      it 'allows access to edit service' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to edit service' 

    end
  end

  describe 'GET new' do
    before(:each) do
      @loc = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to create service' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to create service' 

    end
  end

  describe 'PATCH update' do
    before(:each) do
      @loc = create(:location_for_org_admin)
      @service = @loc.services.create!(attributes_for(:service))
      @new_loc = create(:far_loc, organization_id: @loc.organization.id)
      @restricted_loc = create(:location)
    end

    context 'when location does not belong to organization' do
      it 'does not copy the service to the location' 

    end

    context 'when location_ids are empty' do
      it 'successfully updates the service' 

    end
  end

  describe 'create' do
    before(:each) do
      @location = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to create service' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to create a service' do
      it 'creates the service' 

    end
  end

  describe 'update' do
    before(:each) do
      @location = create(:location_with_admin)
      @service = @location.services.create!(attributes_for(:service))
      @attrs = {
        name: 'Updated Service',
        description: 'Updated Description',
        keywords: ['']
      }
    end

    context 'when admin is super admin' do
      it 'allows access to update service' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to edit this service' do
      it 'updates the service' 

    end
  end

  describe 'destroy' do
    before(:each) do
      @location = create(:location_with_admin)
      @service = @location.services.create!(attributes_for(:service))
    end

    context 'when admin is super admin' do
      it 'allows access to destroy service' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to destroy this service' do
      it 'destroys the service' 

    end
  end
end

