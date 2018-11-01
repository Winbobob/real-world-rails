# frozen_string_literal: true

require 'spec_helper'

describe Admin::SponsorshipLevelsController do
  let(:admin) { create(:admin) }
  let(:conference) { create(:conference) }
  let(:sponsorship_level) { create(:sponsorship_level, conference: conference) }

  context 'admin is signed in' do
    before { sign_in admin }

    describe 'GET #index' do
      before { get :index, conference_id: conference.short_title }

      it 'assigns conference and sponsorship_levels variables' 


      it 'renders index template' 

    end

    describe 'GET #edit' do
      before { get :edit, conference_id: conference.short_title, id: sponsorship_level.id }

      it 'renders edit template' 


      it 'assigns sponsorship_level variable' 

    end

    describe 'GET #new' do
      before { get :new, conference_id: conference.short_title }

      it 'renders new template' 


      it 'assigns sponsorship_level variable' 

    end

    describe 'POST #create' do
      context 'saves successfuly' do
        before(:each, run: true) do
          post :create, sponsorship_level: attributes_for(:sponsorship_level),
                        conference_id: conference.short_title
        end

        it 'redirects to admin sponsorship_level index path', run: true do
          expect(response).to redirect_to admin_conference_sponsorship_levels_path(conference_id: conference.short_title)
        end

        it 'shows success message in flash notice', run: true do
          expect(flash[:notice]).to match('Sponsorship level successfully created.')
        end

        it 'creates new sponsorship_level' 

      end

      context 'save fails' do
        before do
          allow_any_instance_of(SponsorshipLevel).to receive(:save).and_return(false)
          post :create, sponsorship_level: attributes_for(:sponsorship_level),
                        conference_id: conference.short_title
        end

        it 'renders new template' 


        it 'shows error in flash message' 


        it 'does not create new sponsorship_level' 

      end
    end

    describe 'PATCH #update' do
      context 'updates successfully' do
        before do
          patch :update, sponsorship_level: attributes_for(:sponsorship_level, title: 'Gold'),
                         conference_id: conference.short_title,
                         id: sponsorship_level.id
        end

        it 'redirects to admin sponsorship_level index path' 


        it 'shows success message in flash notice' 


        it 'updates the sponsorship_level' 

      end

      context 'update fails' do
        before do
          allow_any_instance_of(SponsorshipLevel).to receive(:save).and_return(false)
          patch :update, sponsorship_level: attributes_for(:sponsorship_level, title: 'Gold'),
                         conference_id: conference.short_title,
                         id: sponsorship_level.id
        end

        it 'renders edit template' 


        it 'shows error in flash message' 


        it 'does not update sponsorship_level' 

      end
    end

    describe 'DELETE #destroy' do
      context 'deletes successfully' do
        before(:each, run: true) do
          delete :destroy, conference_id: conference.short_title, id: sponsorship_level.id
        end

        it 'redirects to admin sponsorship_level index path', run: true do
          expect(response).to redirect_to admin_conference_sponsorship_levels_path(conference_id: conference.short_title)
        end

        it 'shows success message in flash notice', run: true do
          expect(flash[:notice]).to match('Sponsorship level successfully deleted.')
        end

        it 'deletes the sponsorship_level' 

      end

      context 'delete fails' do
        before do
          allow_any_instance_of(SponsorshipLevel).to receive(:destroy).and_return(false)
          delete :destroy, conference_id: conference.short_title, id: sponsorship_level.id
        end

        it 'redirects to admin sponsorship_level index path' 


        it 'shows error in flash message' 


        it 'does not delete sponsorship_level' 

      end
    end

    describe 'PATCH #up' do
      before do
        sponsorship_level
        @second_sponsorship_level = create(:sponsorship_level, conference: conference)
        patch :up, conference_id: conference.short_title, id: @second_sponsorship_level.id
      end

      it 'moves sponsorship_level up by one position' 

    end

    describe 'PATCH #down' do
      before do
        sponsorship_level
        @second_sponsorship_level = create(:sponsorship_level, conference: conference)
        patch :down, conference_id: conference.short_title, id: sponsorship_level.id
      end

      it 'moves sponsorship_level down by one position' 

    end
  end
end

