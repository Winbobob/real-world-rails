require 'rails_helper'

RSpec.describe SuperAdmins::Admin::SuperAdminsController, type: :controller do

  let(:super_admin) { create(:super_admin) }

  subject { super_admin }
  before { sign_in subject.user }

  describe "GET #show" do
    before { get :show, params: { id: subject } }

    it "returns http success" 


    it 'assigns @super_admin' 

  end

  describe "GET #edit" do

    before { get :edit, params: { id: subject } }

    it "returns http success" 


    it 'assigns @super_admin' 


    it 'renders the edit template' 

  end

  describe "GET #change_password" do

    before { get :change_password, params: { id: subject } }

    it "returns http success" 


    it 'assigns @super_admin' 


    it 'renders the change password template' 

  end

  describe "PUT #update_password" do

    before do
      subject.user.update(password: 'password', password_confirmation: 'password')
      sign_in subject.user #need to sign in again after password change
    end

    context 'when valid' do
      before { put :update_password, params: { id: subject, super_admin: { user_attributes: { current_password: 'password', password: 'password123', password_confirmation: 'password123' } } } }

      it 'redirects to super admin show action' 

    end

    context 'when mandatory params for super admin are not provided' do
      it 'raises a paramenter missing error' 

    end

    context 'when invalid' do
      it 'renders the change password template' 

    end
  end

 describe "PUT #update" do
    before(:each) do
      put :update, params: { id: subject, super_admin: { user_attributes: { first_name: 'Joshua', last_name: 'Dude', password: 'password', email: 'superadmin@bigblackhhole.com'} } }
    end

    context 'when valid' do

      it 'updates a super admin' 


      it 'redirects to super admin show page' 

    end

    context 'when invalid' do
      before(:each) do
        put :update, params: { id: subject, super_admin: { user_attributes: { first_name: '' } } }
      end

      it 'does not update super admin' 


      it 'renders the edit template' 

    end
  end

end

