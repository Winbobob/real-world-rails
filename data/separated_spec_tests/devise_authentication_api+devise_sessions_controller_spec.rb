require 'spec_helper'

describe 'sign in via POST /sessions' do

  include ApiHelper
  include_context "shared setup"

  context 'unauthenticated user' do

    before { register_and_confirm @good_creds }

    describe 'success' do
      before { sign_in @good_creds }

      it 'returns 201 status code' 


      it 'returns a secure token' 

    end

    shared_examples 'unauthorized with invalid credentials error' do
      it 'returns 401 Unauthorized status code' 


      it 'doesn\'t return a secure token' 


      it 'returns "Invalid email or password." error' 


      it 'returns "Invalid email or password." error in JSON' 

    end

    describe 'after MAXIMUM_ATTEMPTS failed attempts' do
      before do
        attempts = ENV['MAXIMUM_ATTEMPTS'].to_i
        attempts.times do |i|
          sign_in @bad_password_creds
        end
      end

      it "has not locked user's access" 


      context 'sign in attempt with good password' do
        before { sign_in @good_creds }

        it 'returns 201 status code' 


        it 'returns a secure token' 

      end
    end

    describe 'after MAXIMUM_ATTEMPTS + 1 failed attempts' do
      before do
        ActionMailer::Base.deliveries.clear
        attempts = ENV['MAXIMUM_ATTEMPTS'].to_i
        attempts.times do |i|
          sign_in @bad_password_creds
        end
        sign_in @bad_password_creds
      end

      it "has locked user's access" 


      context 'sign in attempt with good password' do
        before { sign_in @good_creds }

        it 'returns 403 Forbidden status code' 


        it 'has account is locked error JSON' 


        it 'sends email to user' 

      end
    end

    describe 'failure due to invalid password' do
      before { sign_in @bad_password_creds }

      it_behaves_like 'unauthorized with invalid credentials error'
    end

    describe 'failure due to invalid email' do
      before { sign_in @bad_creds }

      it_behaves_like 'unauthorized with invalid credentials error'
    end
  end

end

