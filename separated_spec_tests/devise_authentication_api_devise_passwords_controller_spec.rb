require 'spec_helper'

describe '' do

  include ApiHelper
  include_context "shared setup"

  context 'unauthenticated user' do

    before { register_and_confirm @good_creds }

    describe 'request password reset for confirmed user via POST /users/password' do
      before do
        ActionMailer::Base.deliveries.clear
        post '/users/password', {user: {email: @email}}
      end

      it 'returns 201 Created status code' 


      it 'returns empty JSON' 


      it 'sends email to user' 

    end
  end

  context 'unauthenticated user' do

    before { register @good_creds }

    describe 'request password reset for unconfirmed user via POST /users/password' do
      before do
        ActionMailer::Base.deliveries.clear
        post '/users/password', {user: {email: @email}}
      end

      it 'be sure that user is unconfirmed' 


      it 'returns 201 Created status code' 


      it 'returns empty JSON' 


      it 'sends email to user' 

    end
  end
end

