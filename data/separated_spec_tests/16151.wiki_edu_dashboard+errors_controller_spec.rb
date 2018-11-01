# frozen_string_literal: true

require 'rails_helper'

describe ErrorsController do
  let!(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'file_not_found' do
    it 'returns status 404' 

  end

  describe 'unprocessable' do
    it 'returns status 422' 

  end

  describe 'internal_server_error' do
    it 'returns status 500' 

  end

  describe 'login_error' do
    it 'redirects to root path if user is logged in' 

  end
end

