# frozen_string_literal: true

require 'spec_helper'

describe Admin::RoomsController do
  let!(:admin) { create(:admin) }
  let(:conference) { create(:conference) }
  let!(:venue) { create(:venue, conference: conference) }
  let(:room) { create(:room, venue: venue, size: 4) }

  context 'admin is signed in' do
    before { sign_in admin }

    describe 'GET #index' do
      before { get :index, conference_id: conference.short_title }

      it 'assigns conference, venue and rooms variables' 


      it 'renders index template' 

    end

    describe 'GET #edit' do
      before { get :edit, conference_id: conference.short_title, id: room.id }

      it 'renders edit template' 


      it 'assigns room variable' 

    end

    describe 'GET #new' do
      before { get :new, conference_id: conference.short_title }

      it 'renders new template' 


      it 'assigns room variable' 

    end

    describe 'POST #create' do
      context 'saves successfuly' do
        before do
          post :create, room: attributes_for(:room), conference_id: conference.short_title
        end

        it 'redirects to admin room index path' 


        it 'shows success message in flash notice' 


        it 'creates new room' 

      end

      context 'save fails' do
        before do
          allow_any_instance_of(Room).to receive(:save).and_return(false)
          post :create, room: attributes_for(:room), conference_id: conference.short_title
        end

        it 'renders new template' 


        it 'shows error in flash message' 


        it 'does not create new room' 

      end
    end

    describe 'PATCH #update' do
      context 'updates successfully' do
        before do
          patch :update, room: attributes_for(:room, size: 2),
                         conference_id: conference.short_title,
                         id: room.id
        end

        it 'redirects to admin room index path' 


        it 'shows success message in flash notice' 


        it 'updates the room' 

      end

      context 'update fails' do
        before do
          allow_any_instance_of(Room).to receive(:save).and_return(false)
          patch :update, room: attributes_for(:room, size: 2),
                         conference_id: conference.short_title,
                         id: room.id
        end

        it 'renders edit template' 


        it 'shows error in flash message' 


        it 'does not update room' 

      end
    end

    describe 'DELETE #destroy' do
      context 'deletes successfully' do
        before { delete :destroy, conference_id: conference.short_title, id: room.id }

        it 'redirects to admin room index path' 


        it 'shows success message in flash notice' 


        it 'deletes the room' 

      end

      context 'delete fails' do
        before do
          allow_any_instance_of(Room).to receive(:destroy).and_return(false)
          delete :destroy, conference_id: conference.short_title, id: room.id
        end

        it 'redirects to admin room index path' 


        it 'shows error in flash message' 


        it 'does not delete room' 

      end
    end
  end
end

