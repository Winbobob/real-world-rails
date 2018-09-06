# frozen_string_literal: true

require 'rails_helper'

describe Auth::PasswordsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #new' do
    it 'returns http success' 

  end

  describe 'GET #edit' do
    let(:user) { Fabricate(:user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @token = user.send_reset_password_instructions
    end

    context 'with valid reset_password_token' do
      it 'returns http success' 

    end

    context 'with invalid reset_password_token' do
      it 'redirects to #new' 

    end
  end
end

