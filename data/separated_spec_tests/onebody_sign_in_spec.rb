require 'rails_helper'

describe 'SignIn', type: :request do
  before do
    @user = FactoryGirl.create(:person)
    Setting.set(nil, 'Features', 'SSL', true)
  end

  context 'given sign in with wrong email address' do
    before do
      post '/session',
           params: { email: 'bad-email', password: 'bla' }
    end

    it 'should show error message' 

  end

  context 'given sign in with wrong password' do
    before do
      post '/session',
           params: { email: @user.email, password: 'wrong-password' }
    end

    it 'should show error message' 

  end

  context 'given proper email and password' do
    before do
      post '/session',
           params: { email: @user.email, password: 'secret' }
    end

    it 'should redirect to stream' 

  end

  context 'given two users in the same family with the same email address' do
    before do
      @user2 = FactoryGirl.create(:person, email: @user.email, family: @user.family)
    end

    it 'should allow both to sign in' 

  end

  context 'given a session using a "feed code"' do
    it 'should allow access to stream xml' 


    it 'should allow access to disable group emails' 


    it 'should not allow user to access most other actions' 

  end
end

