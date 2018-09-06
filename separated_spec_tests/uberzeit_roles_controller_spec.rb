require 'spec_helper'

describe RolesController do
  context 'for non-signed in users' do
    let!(:user) { FactoryGirl.create(:user) }

    describe 'GET "index"' do
      it 'redirects to login' 

    end

    describe 'GET "new"' do
      it 'redirects to login' 

    end

    describe 'POST "create"' do
      it 'redirects to login' 


      it 'does not add the role to the user' 

    end
  end

  context 'for signed in users' do
    let!(:user) { FactoryGirl.create(:admin) }

    before do
      test_sign_in user
    end

    let(:roles) { user.roles }

    describe 'GET "index"' do
      it 'assigns the to-be edited roles to @roles' 


      it 'renders the :index template' 

    end

    describe 'GET "new"' do
      it 'renders the :new template' 

    end

    describe 'POST "create"' do
      it 'assigns the role to the user' 


      it 'redirects to the roles overview' 

    end

    describe 'DELETE "destroy"' do
      before(:each) do
        user.add_role :accountant
      end

      let(:role) { Role.where(name: 'accountant').first }

      it 'un-assigns the role from the user' 

    end
  end
end


