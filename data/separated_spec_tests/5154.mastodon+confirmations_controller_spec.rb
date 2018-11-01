# frozen_string_literal: true

require 'rails_helper'

describe Auth::ConfirmationsController, type: :controller do
  render_views

  describe 'GET #new' do
    it 'returns http success' 

  end

  describe 'GET #show' do
    context 'when user is unconfirmed' do
      let!(:user) { Fabricate(:user, confirmation_token: 'foobar', confirmed_at: nil) }

      before do
        allow(BootstrapTimelineWorker).to receive(:perform_async)
        @request.env['devise.mapping'] = Devise.mappings[:user]
        get :show, params: { confirmation_token: 'foobar' }
      end

      it 'redirects to login' 


      it 'queues up bootstrapping of home timeline' 

    end

    context 'when user is updating email' do
      let!(:user) { Fabricate(:user, confirmation_token: 'foobar', unconfirmed_email: 'new-email@example.com') }

      before do
        allow(BootstrapTimelineWorker).to receive(:perform_async)
        @request.env['devise.mapping'] = Devise.mappings[:user]
        get :show, params: { confirmation_token: 'foobar' }
      end

      it 'redirects to login' 


      it 'does not queue up bootstrapping of home timeline' 

    end
  end

  describe 'GET #finish_signup' do
    subject { get :finish_signup }

    let(:user) { Fabricate(:user) }
    before do
      sign_in user, scope: :user
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'renders finish_signup' 

  end

  describe 'PATCH #finish_signup' do
    subject { patch :finish_signup, params: { user: { email: email } } }

    let(:user) { Fabricate(:user) }
    before do
      sign_in user, scope: :user
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'when email is valid' do
      let(:email) { 'new_' + user.email }

      it 'redirects to root_path' 

    end

    context 'when email is invalid' do
      let(:email) { '' }

      it 'renders finish_signup' 

    end
  end
end

