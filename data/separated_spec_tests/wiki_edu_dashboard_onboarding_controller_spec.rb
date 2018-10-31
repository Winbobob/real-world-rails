# frozen_string_literal: true

require 'rails_helper'

describe OnboardingController do
  before { stub_list_users_query }
  let(:user) { create(:user, onboarded: onboarded) }

  describe 'onboarding route' do
    describe 'when not authenticated' do
      let(:onboarded) { false }

      it 'should redirect to root_path' 

    end

    describe 'when not onboarded' do
      let(:onboarded) { false }

      it 'should not redirect' 

    end
  end

  describe '#onboard' do
    let(:user) { create(:user, onboarded: false) }

    before do
      login_as(user, scope: user)
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'should onboard with valid params' 


    it 'should not onboard with invalid params' 


    it 'should remain an admin regardless of instructor param' 


    it 'should strip name field of excessive whitespace' 

  end

  describe '#supplementary' do
    let(:user) { create(:user, onboarded: false, username: 'JonSnow') }

    it 'should create an alert for instructor' 

  end
end

