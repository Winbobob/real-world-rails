# frozen_string_literal: true

require 'spec_helper'

describe UsersController do
  let!(:first_user) { create(:user) }
  let!(:user) { create(:user, name: 'My Name') }

  describe 'GET #show' do
    before :each do
      get :show, id: user.id
    end

    it 'renders show template' 


    it 'assigns the right value to @user' 


    it 'assigns [] to @events, when user does not have any submissions' 


    it 'assigns the correct value to @events, when the user has submissions' 

  end

  describe 'GET #edit' do
    it 'assigns the right value to @user' 

  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      before :each do
        sign_in user
        patch :update, id: user.id, user: attributes_for(:user, name: 'My Test Name')
        user.reload
      end

      it 'assigns the right value to @user' 


      it 'changes user attributes' 


      it 'redirects to show' 


      it 'shows flash message' 

    end
  end
end

