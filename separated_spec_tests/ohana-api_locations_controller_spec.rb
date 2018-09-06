require 'rails_helper'

describe Admin::LocationsController do
  describe 'create' do
    before(:each) do
      location = create(:location_with_admin)
      @org = location.organization
    end

    context 'when admin is super admin' do
      it 'allows access to create location' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows location creation' 

    end
  end

  describe 'update' do
    before(:each) do
      @loc = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to update location' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to edit this location' do
      it 'updates the location' 

    end
  end

  describe 'destroy' do
    before(:each) do
      @location = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to destroy location' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to destroy this location' do
      it 'destroys the location' 

    end
  end

  describe 'edit' do
    before(:each) do
      @location = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to edit location' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to edit location' 

    end
  end

  describe 'new' do
    before(:each) do
      location = create(:location_with_admin)
      @org = location.organization
    end

    context 'when admin is super admin' do
      it 'allows access to add location' 

    end

    context 'when admin does not have access to any locations' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to add new location' 

    end
  end
end

