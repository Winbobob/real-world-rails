require 'spec_helper'

describe SessionsController do
  let(:user) do
    Fabricate(:user, password: 'papapa22', password_confirmation: 'papapa22')
  end

  describe '#create' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'does not show a notice flash message' 

  end

  describe '#destroy' do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, user: {
        email: user.email,
        password: user.password
      }
    end

    it 'does not show a notice flash message' 

  end
end

