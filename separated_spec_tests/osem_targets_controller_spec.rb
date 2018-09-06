# frozen_string_literal: true

require 'spec_helper'

describe Admin::TargetsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:conference) { create(:conference) }
  let(:target) { create(:target, conference: conference, target_count: 100) }

  context 'user is admin' do
    before { sign_in admin }

    describe 'GET #index' do
      before { get :index, conference_id: conference.short_title }

      it 'renders index template' 


      it 'assigns targets and conference variables' 

    end

    describe 'GET #new' do
      before { get :new, conference_id: conference.short_title }

      it 'renders new template' 


      it 'assigns target variable' 

    end

    describe 'POST #create' do
      context 'saves successfuly' do
        before do
          post :create, target: attributes_for(:target), conference_id: conference.short_title
        end

        it 'redirects to admin target index path' 


        it 'shows success message in flash notice' 


        it 'creates new target' 

      end

      context 'save fails' do
        before do
          allow_any_instance_of(Target).to receive(:save).and_return(false)
          post :create, target: attributes_for(:target), conference_id: conference.short_title
        end

        it 'renders new template' 


        it 'shows error in flash message' 


        it 'does not create new target' 

      end
    end

    describe 'GET #edit' do
      before { get :edit, conference_id: conference.short_title, id: target.id }

      it 'renders edit template' 


      it 'assigns target variable' 

    end

    describe 'PATCH #update' do
      context 'updates successfully' do
        before do
          patch :update, target: attributes_for(:target, target_count: 2),
                         conference_id: conference.short_title,
                         id: target.id
        end

        it 'redirects to admin target index path' 


        it 'shows success message in flash notice' 


        it 'updates the target' 

      end

      context 'update fails' do
        before do
          allow_any_instance_of(Target).to receive(:save).and_return(false)
          patch :update, target: attributes_for(:target, target_count: 2),
                         conference_id: conference.short_title,
                         id: target.id
        end

        it 'renders edit template' 


        it 'shows error in flash message' 


        it 'does not update target' 

      end
    end

    describe 'DELETE #destroy' do
      context 'deletes successfully' do
        before { delete :destroy, conference_id: conference.short_title, id: target.id }

        it 'redirects to admin target index path' 


        it 'shows success message in flash notice' 


        it 'deletes target' 

      end

      context 'delete fails' do
        before do
          allow_any_instance_of(Target).to receive(:destroy).and_return(false)
          delete :destroy, conference_id: conference.short_title, id: target.id
        end

        it 'redirects to admin target index path' 


        it 'shows error in flash message' 


        it 'does not delete target' 

      end
    end
  end
end

