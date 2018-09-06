require 'rails_helper'

RSpec.describe Auth::RegistrationsController, type: :controller do
  render_views

  shared_examples 'checks for enabled registrations' do |path|
    around do |example|
      open_registrations = Setting.open_registrations
      example.run
      Setting.open_registrations = open_registrations
    end

    it 'redirects if it is in single user mode while it is open for registration' 


    it 'redirects if it is not open for registration while it is not in single user mode' 

  end

  describe 'GET #edit' do
    it 'returns http success' 

  end

  describe 'GET #update' do
    it 'returns http success' 

  end

  describe 'GET #new' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context do
      around do |example|
        open_registrations = Setting.open_registrations
        example.run
        Setting.open_registrations = open_registrations
      end

      it 'returns http success' 

    end

    include_examples 'checks for enabled registrations', :new
  end

  describe 'POST #create' do
    let(:accept_language) { Rails.application.config.i18n.available_locales.sample.to_s }

    around do |example|
      current_locale = I18n.locale
      example.run
      I18n.locale = current_locale
    end

    before { request.env["devise.mapping"] = Devise.mappings[:user] }

    context do
      around do |example|
        open_registrations = Setting.open_registrations
        example.run
        Setting.open_registrations = open_registrations
      end

      subject do
        Setting.open_registrations = true
        request.headers["Accept-Language"] = accept_language
        post :create, params: { user: { account_attributes: { username: 'test' }, email: 'test@example.com', password: '12345678', password_confirmation: '12345678' } }
      end

      it 'redirects to login page' 


      it 'creates user' 

    end

    it 'does nothing if user already exists' 


    include_examples 'checks for enabled registrations', :create
  end

  describe 'DELETE #destroy' do
    let(:user) { Fabricate(:user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(user, scope: :user)
      delete :destroy
    end

    it 'returns http not found' 


    it 'does not delete user' 

  end
end

