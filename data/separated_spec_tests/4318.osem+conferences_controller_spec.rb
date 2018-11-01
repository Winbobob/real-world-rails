# frozen_string_literal: true

require 'spec_helper'

describe Admin::ConferencesController do

  # It is necessary to use bang version of let to build roles before user
  let!(:organization) { create(:organization, name: 'organization') }
  let!(:conference) { create(:conference, organization: organization, end_date: Date.new(2014, 05, 26) + 15) }
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let!(:organization_admin_role) { Role.find_by(name: 'organization_admin', resource: organization) }
  let(:organization_admin) { create(:user, role_ids: organization_admin_role.id) }
  let(:organizer) { create(:user, role_ids: organizer_role.id) }
  let(:organizer2) { create(:user, email: 'organizer2@email.osem', role_ids: organizer_role.id) }
  let(:participant) { create(:user) }

  shared_examples 'access as organizer or organization_admin' do
    describe 'PATCH #update' do
      context 'valid attributes' do
        it 'locates the requested conference' 


        it 'changes conference attributes' 


        it 'redirects to the updated conference' 


        it 'sends email notification on conference date update' 

      end

      context 'invalid attributes' do
        it 'does not change conference attributes' 


        it 're-renders the #show template' 

      end
    end

    describe 'GET #edit' do
      it 'assigns the requested conference to conference' 


      it 'renders the show template' 

    end

    describe 'GET #show' do
      it 'assigns the requested conference to conference' 


      it 'renders the show template' 


      it 'assigns conference withdrawn events distribution to event_type_distribution_withdrawn' 


      it 'assigns conference withdrawn difficulty level distribution to difficulty_levels_distribution_withdrawn' 


      it 'assigns conference withdrawn track distribution to tracks_distribution_withdrawn' 

    end

    describe 'GET #index' do
      context 'with more than 0 conferences' do
        it 'populates an array with conferences' 


        it 'assigns cfp_max an array with maximum weeks' 


        it 'renders the index template' 

      end

      context 'no conferences' do
        it 'redirect to new conference' 

      end
    end
  end

  shared_examples 'access as organization_admin' do
    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves the conference to the database' 


        it 'redirects to conference#show' 


        it 'creates roles for the conference' 

      end

      context 'with invalid attributes' do
        it 'does not save the conference to the database' 


        it 're-renders the new template' 

      end

      context 'with duplicate conference short title' do
        it 'does not save the conference to the database' 


        it 're-renders the new template' 

      end
    end

    describe 'GET #new' do
      it 'assigns a new conference to conference' 


      it 'renders the :new template' 

    end
  end

  describe 'organization admin access' do
    before do
      sign_in(organization_admin)
    end

    it_behaves_like 'access as organizer or organization_admin'
    it_behaves_like 'access as organization_admin'
  end

  shared_examples 'access as organizer, participant or guest' do |path, message|
    describe 'GET #new' do
      it 'requires organizer privileges' 

    end

    describe 'POST #create' do
      it 'requires organizer privileges' 

    end
  end

  describe 'organizer access' do
    before do
      sign_in(organizer)
    end

    it_behaves_like 'access as organizer or organization_admin'
    it_behaves_like 'access as organizer, participant or guest', :root_path, 'You are not authorized to access this page.'
  end

  shared_examples 'access as participant or guest' do |path, message|
    describe 'GET #show' do
      it 'requires organizer privileges' 

    end

    describe 'GET #index' do
      it 'requires organizer privileges' 

    end

    describe 'PATCH #update' do
      it 'requires organizer privileges' 

    end
  end

  describe 'participant access' do
    before(:each) do
      sign_in(participant)
    end

    it_behaves_like 'access as participant or guest', :root_path, 'You are not authorized to access this page.'
    it_behaves_like 'access as organizer, participant or guest', :root_path, 'You are not authorized to access this page.'
  end

  describe 'guest access' do

    it_behaves_like 'access as participant or guest', :new_user_session_path
    it_behaves_like 'access as organizer, participant or guest', :new_user_session_path
  end
end

