require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:test_user) { create :user }

  context 'logged out user' do
    describe 'GET #index' do
      it 'redirects to login page' 

    end

    describe 'GET #show' do
      it 'redirects to login page' 

    end

    describe 'GET #edit' do
      it 'redirects to login page' 

    end
  end
end

