# frozen_string_literal: true

require 'rails_helper'

describe 'onboarding', type: :feature, js: true do
  before { stub_list_users_query }
  let(:user) { create(:user, onboarded: onboarded, real_name: 'test', email: 'email@email.com') }

  describe 'onboarding redirect checks' do
    describe 'when not logged in' do
      let(:onboarded) { false }
      it 'should not be able to access onboarding' 

    end

    describe 'when logged in and not onboarded' do
      let(:onboarded) { false }

      before :each do
        login_as(user, scope: :user)
      end

      it 'should be able to access onboarding' 


      it 'should not be able to access other parts of the app' 


      it 'should be able to log out' 

    end
  end

  describe 'onboarding forms' do
    let(:onboarded) { false }

    before :each do
      login_as(user, scope: :user)
    end

    it 'should pre-populate' 


    it 'should update user when submitted' 

  end

  describe 'onboarding supplement' do
    let(:onboarded) { false }

    before :each do
      login_as(user, scope: :user)
    end

    it 'should go to supplementary' 

  end
end

