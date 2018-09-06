# frozen_string_literal: true

require 'spec_helper'

describe SubscriptionsController do
  let(:conference) { create(:conference) }
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'when user is a guest' do
      it 'redirects to sign in page' 

    end

    context 'when user is signed in' do
      before(:each) do
        sign_in(user)
      end

      it 'redirects to home page' 


      it 'shows success message in flash notice' 


      it 'subscribes user to conference' 

    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      sign_in(user)
      post :create, conference_id: conference.short_title
    end

    it 'redirects to home page' 


    it 'shows success message in flash notice' 

  end
end

