require 'spec_helper'

describe RolesController do
  let(:admin_user) { create(:user, :admin) }

  before { sign_in(admin_user) }

  describe '#index' do
    render_views

    before do
      create(:role, name: 'junior')
      create(:role, name: 'developer')
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes roles' 


    it 'displays roles on view' 

  end

  describe '#show' do
    subject { create(:role, name: 'role1') }
    before { get :show, id: subject }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes role' 

  end

  describe '#create' do
    context 'with valid attributes' do
      subject { attributes_for(:role, name: 'role2') }

      it 'creates a new role' 

    end

    context 'with invalid attributes' do
      subject { attributes_for(:role_invalid) }

      it 'does not save' 

    end
  end

  describe '#destroy' do
    let!(:role) { create(:role) }

    it 'destroys role' 

  end

  describe '#update' do
    let!(:role) { create(:role, name: 'senior4') }

    it 'exposes role' 


    context 'valid attributes' do
      it "changes role's attributes" 

    end

    context 'invalid attributes' do
      it "does not change role's attributes" 

    end
  end
end

