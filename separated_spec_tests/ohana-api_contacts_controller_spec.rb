require 'rails_helper'

describe Admin::ContactsController do
  describe 'GET edit' do
    before(:each) do
      @loc = create(:location_with_admin)
      @contact = @loc.contacts.create!(attributes_for(:contact))
    end

    context 'when admin is super admin' do
      it 'allows access to edit contact' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access' 

    end
  end

  describe 'GET new' do
    before(:each) do
      @loc = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to edit contact' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access' 

    end
  end

  describe 'create' do
    before(:each) do
      @loc = create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to create contact' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to create a contact' do
      it 'creates the contact' 

    end
  end

  describe 'update' do
    before(:each) do
      @loc = create(:location_with_admin)
      @contact = @loc.contacts.create!(attributes_for(:contact))
    end

    context 'when admin is super admin' do
      it 'allows access to update contact' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to edit this contact' do
      it 'updates the contact' 

    end
  end

  describe 'destroy' do
    before(:each) do
      @loc = create(:location_with_admin)
      @contact = @loc.contacts.create!(attributes_for(:contact))
    end

    context 'when admin is super admin' do
      it 'allows access to destroy contact' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to destroy this contact' do
      it 'destroys the contact' 

    end
  end
end

