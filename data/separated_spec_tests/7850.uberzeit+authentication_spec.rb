require 'spec_helper'

describe 'Authentication for App API' do

  it 'disallows connection attempts when no SSL_CLIENT_VERIFY env var is set' 


  it 'disallows connection attempts when the client SSL cert was not verified' 


  it 'authenticates when a client SSL cert was verified succesfully' 


  context 'Token authentication' do
    include Warden::Test::Helpers

    let(:token) { 'abcd' }
    let(:user) { FactoryGirl.create :user, active: user_active?, authentication_token: token }

    before do
      login_as user
      get '/api/ping'
    end

    context 'for an active user' do
      let(:user_active?) { true }

      it 'allows authentication' 

    end

    context 'for an inactive user' do
      let(:user_active?) { false }

      it 'denies authentication for active users' 

    end
  end
end

