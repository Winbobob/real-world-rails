# frozen_string_literal: true

require 'spec_helper'

describe BoothsController do

  let(:user) { create(:user) }
  let(:conference) { create(:conference) }
  let(:booth) { create(:booth, title: 'Title', conference: conference) }

  context 'user is signed in with submitter role' do
    before :each do
      create(:cfp, program: conference.program, cfp_type: 'booths')
      sign_in booth.submitter
    end

    describe 'GET index' do
      before { get :index, conference_id: conference.short_title }

      it 'assigns attributes for booths' 


      it 'renders index template' 

    end

    describe 'GET #new' do
      before { get :new, conference_id: conference.short_title }

      it 'assigns attributes for booths' 


      it 'renders new template' 

    end

    describe 'POST #create' do
      context 'successfully created' do
        before { post :create, booth: attributes_for(:booth), conference_id: conference.short_title }

        it 'creates a new booth' 


        it 'redirects to booth index' 


        it 'has responsibles' 


        it 'shows success message' 

      end

      context 'create action fails' do
        before { post :create, booth: attributes_for(:booth, title: ''), conference_id: conference.short_title }

        it 'does not create any record' 


        it 'redirects to new' 


        it 'shows flash message' 

      end
    end

    describe 'GET #edit' do
      before { get :edit, id: booth.id, conference_id: conference.short_title }

      it 'renders edit template' 


      it 'assigns booth variable' 

    end

    describe 'PATCH #update' do
      context 'updates suchessfully' do
        before { patch :update, id: booth.id, booth: attributes_for(:booth, title: 'different'), conference_id: conference.short_title }

        it 'redirects to booth index path' 


        it 'shows success message' 


        it 'updates booth' 

      end
    end
  end
end

