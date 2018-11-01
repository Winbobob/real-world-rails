# frozen_string_literal: true

require 'rails_helper'

describe OnboardingController do
  before { stub_list_users_query }

  let(:user) { create(:user, onboarded: onboarded) }

  describe 'onboarding route' do
    describe 'when not authenticated' do
      let(:onboarded) { false }

      it 'redirects to root_path' 

    end

    describe 'when not onboarded' do
      let(:onboarded) { false }

      it 'does not redirect' 

    end
  end

  describe '#onboard' do
    let(:user) { create(:user, onboarded: false) }

    before do
      login_as(user, scope: user)
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'onboards with valid params' 


    it 'does not onboard with invalid params' 


    it 'remains an admin regardless of instructor param' 


    it 'strips name field of excessive whitespace' 

  end

  describe '#supplementary' do
    let(:user) { create(:user, onboarded: false, username: 'JonSnow') }

    it 'creates an alert for instructor' 

  end
end

