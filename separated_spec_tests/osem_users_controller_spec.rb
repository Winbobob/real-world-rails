# frozen_string_literal: true

require 'spec_helper'
describe Admin::UsersController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  before(:each) do
    sign_in(admin)
  end
  describe 'GET #index' do
    it 'sets up users array with existing users records' 

    it 'renders index template' 

  end
  describe 'PATCH #toggle_confirmation' do
    it 'confirms user' 

    it 'undo confirmation of user' 

  end
  describe 'PATCH #update' do
    context 'valid attributes' do
      before :each do
        patch :update, id: user.id, user: { name: 'new name', email: 'new_email@osem.io' }
      end

      it 'locates requested @user' 

      it 'changes @users attributes' 

      it 'redirects to the updated user' 

    end
  end
  describe 'GET #new' do
    it 'sets up a user instance for the form' 

    it 'renders new user template' 

  end

  describe 'POST #create' do
    context 'saves successfuly' do
      before do
        post :create, user: attributes_for(:user)
      end

      it 'redirects to admin users index path' 


      it 'shows success message in flash notice' 


      it 'creates new user' 

    end

    context 'save fails' do
      before do
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post :create, user: attributes_for(:user)
      end

      it 'renders new template' 


      it 'shows error in flash message' 


      it 'does not create new user' 

    end
  end
end

