# frozen_string_literal: true

require 'rails_helper'

describe ResetPasswordsController do
  let(:authentication) { instance_double(MemberAuthentication, set_reset_password_token: true, confirm: true) }
  let(:mailer) { double(deliver_now: true) }

  describe 'GET new' do
    it 'renders new' 


    it 'sets locale' 

  end

  describe 'GET edit' do
    context 'with valid token' do
      before do
        allow(MemberAuthentication).to receive(:find_by_valid_reset_password_token) { authentication }
        get :edit, params: { token: '1234' }
      end

      it 'finds authentication by reset_password_token' 


      it 'confirms authentication' 


      it 'renders edit' 

    end

    context 'with invalid token' do
      before do
        allow(MemberAuthentication).to receive(:find_by_valid_reset_password_token) { nil }
        get :edit, params: { token: '1234' }
      end

      it 'finds authentication by reset_password_token' 


      it 'does not confirm authentication' 


      it 'redirects to new action' 

    end
  end

  describe 'PUT update' do
    context 'successfully resets password' do
      before do
        allow(MemberAuthentication).to receive(:find_by) { authentication }
        allow(authentication).to receive(:reset_password) { true }
        put :update, params: { token: '1234', password: 'password', password_confirmation: 'password' }
      end

      it 'finds member authentication' 


      it 'successfully resets password' 


      it 'renders success' 

    end

    context 'does not successfully reset password' do
      before do
        allow(MemberAuthentication).to receive(:find_by) { authentication }
        allow(authentication).to receive(:reset_password) { false }
        put :update, params: { token: '1234', password: 'password', password_confirmation: 'password' }
      end

      it 'renders edit' 

    end
  end

  describe 'POST create' do
    before do
      allow(ResetPasswordMailer).to receive(:reset_password_email) { mailer }
    end

    context 'with valid token' do
      before do
        allow(MemberAuthentication).to receive(:find_by_email) { authentication }
        post :create, params: { email: 'test@example.com' }
      end

      it 'finds member authentication' 


      it 'delivers email' 


      it 'renders show' 

    end

    context 'with invalid token' do
      before do
        allow(MemberAuthentication).to receive(:find_by_email) { nil }
        post :create, params: { email: 'test@example.com' }
      end

      it 'finds member authentication' 


      it 'does not deliver email' 


      it 'renders new' 

    end
  end
end

