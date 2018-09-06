require 'rails_helper'

describe Admin::OrganizationsController do
  describe 'create' do
    let(:attrs) do
      {
        name: 'New org',
        description: 'New description',
        licenses: [''],
        accreditations: ['']
      }
    end

    context 'when admin is super admin' do
      it 'allows access to create organization' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end
  end

  describe 'update' do
    let(:attrs) do
      {
        name: 'Updated org',
        description: 'Updated description',
        licenses: [''],
        accreditations: ['']
      }
    end

    before(:each) do
      loc = create(:location_with_admin)
      @org = loc.organization
    end

    context 'when admin is super admin' do
      it 'allows access to update organization' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to edit this organization' do
      it 'updates the organization' 

    end
  end

  describe 'destroy' do
    before(:each) do
      location = create(:location_with_admin)
      @organization = location.organization
    end

    context 'when admin is super admin' do
      it 'allows access to destroy organization' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to destroy this organization' do
      it 'destroys the organization' 

    end
  end

  describe 'edit' do
    before(:each) do
      location = create(:location_with_admin)
      @organization = location.organization
    end

    context 'when admin is super admin' do
      it 'allows access to destroy organization' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to destroy this organization' do
      it 'destroys the organization' 

    end
  end

  describe 'new' do
    context 'when admin is super admin' do
      it 'allows access to create a new organization' 

    end

    context 'when admin is not a super_admin' do
      it 'redirects to admin dashboard' 

    end
  end
end

