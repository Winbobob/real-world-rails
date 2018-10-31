# frozen_string_literal: true

require 'spec_helper'

describe Admin::TracksController do
  let(:admin) { create(:admin) }

  let(:conference) { create(:conference, start_date: Date.current - 1.day) }
  let(:venue) { create(:venue, conference: conference) }
  let(:room) { create(:room, venue: venue) }
  let!(:track) { create(:track, program: conference.program, color: '#800080') }
  let!(:self_organized_track) { create(:track, :self_organized, program: conference.program, name: 'My awesome track', start_date: Date.current, end_date: Date.current, room: room) }

  before :each do
    sign_in(admin)
  end

  describe 'GET #index' do
    before :each do
      get :index, conference_id: conference.short_title
    end

    it 'assigns @tracks with the correct values' 


    it 'renders the index template' 

  end

  describe 'GET #show' do
    before :each do
      get :show, conference_id: conference.short_title, id: track.short_name
    end

    it 'assigns the correct track' 


    it 'renders the show template' 

  end

  describe 'GET #new' do
    before :each do
      get :new, conference_id: conference.short_title
    end

    it 'assigns a new track with the correct conference' 


    it 'renders the new template' 

  end

  describe 'POST #create' do
    context 'saves successfuly' do
      before :each do
        post :create, track: attributes_for(:track), conference_id: conference.short_title
      end

      it 'assigns a new track with the correct conference' 


      it 'redirects to admin tracks index path' 


      it 'shows success message in flash notice' 


      it 'creates new track' 


      it 'the new track has the correct attributes' 

    end

    context 'save fails' do
      before :each do
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        post :create, track: attributes_for(:track, short_name: 'my_track'), conference_id: conference.short_title
      end

      it 'assigns a new track with the correct conference' 


      it 'renders the new template' 


      it 'shows error in flash message' 


      it 'does not create a new track' 

    end
  end

  describe 'GET #edit' do
    before :each do
      get :edit, conference_id: conference.short_title, id: track.short_name
    end

    it 'assigns the correct track' 


    it 'renders the show template' 

  end

  describe 'PATCH #update' do
    context 'updates successfully' do
      before :each do
        patch :update, track: attributes_for(:track, color: '#FF0000'),
                       conference_id: conference.short_title,
                       id: track.short_name
      end

      it 'assigns the correct track' 


      it 'redirects to admin tracks index path' 


      it 'shows success message in flash notice' 


      it 'updates the track' 

    end

    context 'update fails' do
      before :each do
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        patch :update, track: attributes_for(:track, color: '#FF0000'),
                       conference_id: conference.short_title,
                       id: track.short_name
      end

      it 'assigns the correct track' 


      it 'renders edit template' 


      it 'shows error in flash message' 


      it 'does not update the track' 

    end
  end

  describe 'DELETE #destroy' do
    context 'deletes successfully' do
      before :each do
        delete :destroy, conference_id: conference.short_title, id: track.short_name
      end

      it 'redirects to admin tracks index path' 


      it 'shows success message in flash notice' 


      it 'deletes the track' 

    end

    context 'delete fails' do
      before :each do
        allow_any_instance_of(Track).to receive(:destroy).and_return(false)
        delete :destroy, conference_id: conference.short_title, id: track.short_name
      end

      it 'assigns the correct track' 


      it 'redirects to admin tracks index path' 


      it 'shows error in flash message' 


      it 'does not delete the track' 

    end
  end

  describe 'PATCH #toggle_cfp_inclusion' do
    context 'cfp_active is false' do
      before :each do
        self_organized_track.cfp_active = false
        self_organized_track.save!
      end

      context 'toggles successfully' do
        before :each do
          patch :toggle_cfp_inclusion, conference_id: conference.short_title, id: self_organized_track.short_name, format: :js
          self_organized_track.reload
        end

        it 'assigns the correct track' 


        it 'shows success message in flash notice' 


        it 'becomes true' 

      end

      context 'save fails' do
        before :each do
          allow_any_instance_of(Track).to receive(:save).and_return(false)
          patch :toggle_cfp_inclusion, conference_id: conference.short_title, id: self_organized_track.short_name, format: :js
          self_organized_track.reload
        end

        it 'assigns the correct track' 


        it 'shows error message in flash notice' 


        it 'stays false' 

      end
    end

    context 'cfp_active is true' do
      before :each do
        self_organized_track.cfp_active = true
        self_organized_track.save!
      end

      context 'toggles successfully' do
        before :each do
          patch :toggle_cfp_inclusion, conference_id: conference.short_title, id: self_organized_track.short_name, format: :js
          self_organized_track.reload
        end

        it 'assigns the correct track' 


        it 'shows success message in flash notice' 


        it 'becomes false' 

      end

      context 'save fails' do
        before :each do
          allow_any_instance_of(Track).to receive(:save).and_return(false)
          patch :toggle_cfp_inclusion, conference_id: conference.short_title, id: self_organized_track.short_name, format: :js
          self_organized_track.reload
        end

        it 'assigns the correct track' 


        it 'shows error message in flash notice' 


        it 'stays true' 

      end
    end
  end

  describe 'PATCH #restart' do
    before :each do
      self_organized_track.state = 'canceled'
      self_organized_track.save!
      patch :restart, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to new' 

  end

  describe 'PATCH #to_accept' do
    before :each do
      patch :to_accept, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to to_accept' 

  end

  describe 'PATCH #accept' do
    shared_examples 'fails to accept' do
      before :each do
        patch :accept, conference_id: conference.short_title, id: self_organized_track.short_name
      end

      it 'assigns the correct track' 


      it 'redirects to Tracks#edit' 


      it 'shows message in flash alert' 

    end

    context 'has start_date, end_date and room' do
      before :each do
        patch :accept, conference_id: conference.short_title, id: self_organized_track.short_name
        self_organized_track.reload
      end

      it 'assigns the correct track' 


      it 'shows message in flash notice' 


      it 'changes the track\'s state to accepted' 

    end

    context 'has start_date and end_date' do
      before :each do
        self_organized_track.room = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has start_date and room' do
      before :each do
        self_organized_track.end_date = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has start_date' do
      before :each do
        self_organized_track.end_date = nil
        self_organized_track.room = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has end_date and room' do
      before :each do
        self_organized_track.start_date = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has end_date' do
      before :each do
        self_organized_track.start_date = nil
        self_organized_track.room = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has room' do
      before :each do
        self_organized_track.start_date = nil
        self_organized_track.end_date = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end

    context 'has none of start_date, end_date, room' do
      before :each do
        self_organized_track.start_date = nil
        self_organized_track.end_date = nil
        self_organized_track.room = nil
        self_organized_track.save!
      end

      it_behaves_like 'fails to accept'
    end
  end

  describe 'PATCH #confirm' do
    before :each do
      self_organized_track.state = 'accepted'
      self_organized_track.save!
      patch :confirm, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to confirmed' 

  end

  describe 'PATCH #to_reject' do
    before :each do
      patch :to_reject, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to to_reject' 

  end

  describe 'PATCH #reject' do
    before :each do
      patch :reject, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to rejected' 

  end

  describe 'PATCH #cancel' do
    before :each do
      self_organized_track.state = 'confirmed'
      self_organized_track.save!
      patch :cancel, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to canceled' 

  end
end

