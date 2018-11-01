# frozen_string_literal: true

require 'spec_helper'

describe TracksController do
  let(:user) { create(:admin) }

  let(:conference) { create(:conference) }
  let!(:regular_track) { create(:track, program: conference.program) }
  let!(:self_organized_track) { create(:track, :self_organized, program: conference.program, submitter: user, name: 'My awesome track', color: '#800080') }

  before :each do
    sign_in(user)
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
      get :show, conference_id: conference.short_title, id: self_organized_track.short_name
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
        post :create, track: attributes_for(:track, :self_organized, short_name: 'my_track'), conference_id: conference.short_title
      end

      it 'redirects to tracks index path' 


      it 'shows success message in flash notice' 


      it 'creates new track' 


      it 'the new tracks has the correct attributes' 

    end

    context 'save fails' do
      before :each do
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        post :create, track: attributes_for(:track, :self_organized, short_name: 'my_track'), conference_id: conference.short_title
      end

      it 'assigns a new track with the correct conference' 


      it 'renders the new template' 


      it 'shows error in flash message' 


      it 'does not create a new track' 

    end
  end

  describe 'GET #edit' do
    before :each do
      get :edit, conference_id: conference.short_title, id: self_organized_track.short_name
    end

    it 'assigns the correct track' 


    it 'renders the show template' 

  end

  describe 'PATCH #update' do
    context 'updates successfully' do
      before :each do
        patch :update, track: attributes_for(:track, :self_organized, color: '#FF0000'),
                       conference_id: conference.short_title,
                       id: self_organized_track.short_name
      end

      it 'assigns the correct track' 


      it 'redirects to tracks index path' 


      it 'shows success message in flash notice' 


      it 'updates the track' 

    end

    context 'update fails' do
      before :each do
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        patch :update, track: attributes_for(:track, :self_organized, color: '#FF0000'),
                       conference_id: conference.short_title,
                       id: self_organized_track.short_name
      end

      it 'assigns the correct track' 


      it 'renders edit template' 


      it 'shows error in flash message' 


      it 'does not update the track' 

    end
  end

  describe 'PATCH #restart' do
    before :each do
      self_organized_track.state = 'withdrawn'
      self_organized_track.save!
      patch :restart, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to new' 

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

  describe 'PATCH #withdraw' do
    before :each do
      self_organized_track.state = 'confirmed'
      self_organized_track.save!
      patch :withdraw, conference_id: conference.short_title, id: self_organized_track.short_name
      self_organized_track.reload
    end

    it 'assigns the correct track' 


    it 'shows message in flash notice' 


    it 'changes the track\'s state to withdrawn' 

  end
end

