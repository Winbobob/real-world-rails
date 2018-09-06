# frozen_string_literal: true

require 'spec_helper'

describe Admin::RolesController do
  let(:conference) { create(:conference) }
  let(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let(:cfp_role) { Role.find_by(name: 'cfp', resource: conference) }
  let(:admin) { create(:admin) }

  let!(:user1) { create(:user, email: 'user1@osem.io') }
  let!(:user2) { create(:user, email: 'user2@osem.io') }

  describe 'GET #index' do
    before :each do
      sign_in(admin)
      get :index, conference_id: conference.short_title
    end

    it 'assigns default value to selection variable' 


    it 'finds the correct role' 

  end

  describe 'GET #show' do
    before :each do
      sign_in(admin)
      xhr :get, :show, conference_id: conference.short_title,
                       id: 'organizer'
    end

    it 'assigns correct value to selection variable' 


    it 'assigns correct value to role variable' 

  end

  describe 'PATCH #update' do
    before :each do
      sign_in admin
      patch :update, conference_id: conference.short_title,
                     id: 'cfp',
                     role: { description: 'New description for cfp role!' }
    end

    it 'changes the description of the role' 

  end

  describe 'POST #toggle' do
    before :each do
      sign_in admin
      post :toggle_user, conference_id: conference.short_title,
                         user: { email: 'user1@osem.io' },
                         id: 'cfp'
    end

    context 'assigns correct values to variables' do
      it 'assigns correct value to selection variable' 


      it 'assigns correct value to role variable' 


      it 'assigns role to user' 

    end

    context 'adds role to user' do
      it 'adds second user' 


      it 'assigns second role to user' 

    end

    context 'removes role from user' do
      it 'removes role from user' 


      it 'removes second role from user' 

    end

    it 'does not remove role if user is the last organizer' 

  end
end

