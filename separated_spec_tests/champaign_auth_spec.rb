# frozen_string_literal: true
require 'rails_helper'

describe 'API::Stateless Authentication' do
  include Requests::RequestHelpers
  include AuthToken

  let(:member) { create :member }

  before :each do
    member.create_authentication(password: 'password', confirmed_at: Time.now)
  end

  context 'Password Authentication' do
    it 'returns a 400 Bad Request when called with invalid parameters' 


    it 'returns a 401 Unauthorized when credentials are wrong' 


    it 'returns a 200 OK when authentication is successful' 


    it 'returns the member when authentication is successful' 


    it 'returns a valid JWT token when authentication is successful' 

  end

  context 'When a route requires authentication' do
    it 'returns 401 Unauthorized if no valid token was provided' 


    it 'returns 401 Unauthorized if the token is expired' 


    it 'returns 200 OK if a valid token was provided' 

  end
end

