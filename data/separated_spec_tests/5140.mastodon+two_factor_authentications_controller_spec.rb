# frozen_string_literal: true

require 'rails_helper'

describe Settings::TwoFactorAuthenticationsController do
  render_views

  let(:user) { Fabricate(:user) }

  describe 'GET #show' do
    context 'when signed in' do
      before do
        sign_in user, scope: :user
      end

      describe 'when user requires otp for login already' do
        it 'returns http success' 

      end

      describe 'when user does not require otp for login' do
        it 'returns http success' 

      end
    end

    context 'when not signed in' do
      it 'redirects' 

    end
  end

  describe 'POST #create' do
    context 'when signed in' do
      before do
        sign_in user, scope: :user
      end

      describe 'when user requires otp for login already' do
        it 'redirects to show page' 

      end

      describe 'when creation succeeds' do
        it 'updates user secret' 

      end
    end

    context 'when not signed in' do
      it 'redirects' 

    end
  end

  describe 'POST #destroy' do
    before do
      user.update(otp_required_for_login: true)
    end

    context 'when signed in' do
      before do
        sign_in user, scope: :user
      end

      it 'turns off otp requirement with correct code' 


      it 'does not turn off otp if code is incorrect' 


      it 'raises ActionController::ParameterMissing if code is missing' 

    end

    it 'redirects if not signed in' 

  end
end

