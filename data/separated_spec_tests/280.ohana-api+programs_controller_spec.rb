require 'rails_helper'

describe Admin::ProgramsController do
  describe 'GET edit' do
    before(:each) do
      location = create(:location_with_admin)
      org = location.organization
      @program = org.programs.create!(attributes_for(:program))
    end

    context 'when admin is super admin' do
      it 'allows access to edit program' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to edit program' 

    end
  end

  describe 'GET new' do
    before(:each) do
      create(:location_with_admin)
    end

    context 'when admin is super admin' do
      it 'allows access to add a new program' 

    end

    context 'when admin is regular admin without privileges' do
      it 'allows access to create a program' 

    end

    context 'when admin is regular admin with privileges' do
      it 'allows access to create a program' 

    end
  end

  describe 'create' do
    before(:each) do
      loc = create(:location_with_admin)
      @org = loc.organization
    end

    context 'when admin is super admin' do
      it 'allows access to create program' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin included in location admin_emails' do
      it 'allows program creation' 

    end
  end

  describe 'update' do
    before(:each) do
      loc = create(:location_with_admin)
      org = loc.organization
      @program = org.programs.create!(name: 'New Program')
    end

    context 'when admin is super admin' do
      it 'allows access to update program' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is regular admin allowed to edit this program' do
      it 'updates the program' 

    end
  end

  describe 'destroy' do
    before(:each) do
      loc = create(:location_with_admin)
      org = loc.organization
      @program = org.programs.create!(name: 'New Program')
    end

    context 'when admin is super admin' do
      it 'allows access to destroy program' 

    end

    context 'when admin is regular admin without privileges' do
      it 'redirects to admin dashboard' 

    end

    context 'when admin is a regular admin who is allowed to destroy this program' do
      it 'destroys the program' 

    end
  end
end

