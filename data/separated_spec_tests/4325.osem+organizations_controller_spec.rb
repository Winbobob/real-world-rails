# frozen_string_literal: true

require 'spec_helper'

describe Admin::OrganizationsController do
  let!(:admin) { create(:admin) }
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user) }

  context 'logged in as user with no role' do
    before :each do
      sign_in user
    end

    describe 'GET #new' do
      before :each do
        get :new
      end

      it 'redirects to root' 

    end

    describe 'GET #index' do
      before :each do
        get :index
      end

      it 'redirects to root' 

    end

    describe 'POST #create' do
      it 'does not create new organization' 


      it 'redirects to root' 

    end

    describe 'PATCH #update' do
      it 'does not update and redirects to root' 

    end

    describe 'DELETE #destroy' do
      context 'for a valid organization' do
        it 'does not destroy a resource' 


        it 'redirects to root' 

      end
    end
  end

  context 'logged in as admin' do
    before :each do
      sign_in admin
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it { expect(response).to render_template('new') }
    end

    describe 'GET #index' do
      before do
        get :index
      end
      it { expect(response).to render_template('index') }
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates new organization' 


        it 'redirects to index' 

      end

      context 'with invalid attributes' do
        it 'does not create new organization' 


        it 'redirects to new' 

      end
    end

    describe 'PATCH #update' do
      it 'saves and redirects to index when the attributes are valid' 


      it 'redirects to edit when attributes are invalid' 

    end

    describe 'DELETE #destroy' do
      context 'for a valid organization' do
        it 'should successfully destroy a resource' 


        it 'redirects to index' 

      end
    end

    describe 'POST #assign_org_admins' do
      let(:org_admin_role) { Role.find_by(name: 'organization_admin', resource: organization) }

      before do
        post :assign_org_admins, id: organization.id,
                                 user: { email: user.email }
      end

      it 'assigns organization_admin role' 

    end

    describe 'DELETE #unassign_org_admins' do
      let(:org_admin_role) { Role.find_by(name: 'organization_admin', resource: organization) }
      let!(:org_admin_user) { create(:user, role_ids: [org_admin_role.id]) }

      before do
        delete :unassign_org_admins, id: organization.id,
                                     user: { email: org_admin_user.email }
      end

      it 'unassigns organization_admin role' 

    end
  end
end

