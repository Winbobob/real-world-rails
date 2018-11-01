require 'spec_helper'

describe 'activation via POST /users/activation/:confirmation_token' do

  include ApiHelper
  include_context 'shared setup'

  before do
    INITIALIZE_ADMIN_USER.call
    @admin_token = User.last.authentication_token
    user_params = {user: {email: @email} }
    post("/admin/#{@admin_token}/users", user_params)
    @confirmation_token = JSON.parse(last_response.body)['confirmation_token_for_tests_only']
    @password_params = {user: {password: @password} }
  end

  context 'by unactivated user' do

    describe 'success' do
      before do
        post("/users/activation/#{@confirmation_token}", @password_params)
      end

      it_behaves_like 'no content success response'

      it 'sets user password' 


      it 'has confirmed user' 

    end
  end

  context 'by already activated user' do
    describe 'failure' do
      before do
        post("/users/activation/#{@confirmation_token}", @password_params)
        post("/users/activation/#{@confirmation_token}", @password_params)
      end

      it 'returns 401 Unauthorised status code' 


      it 'returns "Invalid token." error' 

    end
  end

  context 'with bad confirmation_token' do
    describe 'failure' do
      before do
        post("/users/activation/bad_token", @password_params)
      end

      it 'returns 401 Unauthorised status code' 


      it 'returns "Invalid token." error' 


      it 'has not set user password' 


      it 'has not confirmed user' 

    end
  end

  context 'by suspended user' do
    before do
      @user = user(@email)
      @user.suspended = true
      @user.save
    end

    describe 'failure' do
      before do
        post("/users/activation/#{@confirmation_token}", @password_params)
      end

      it_behaves_like 'account suspended response'

      it 'has not confirmed user' 

    end

    context 'that is reinstated' do
      before do
        @user.suspended = false
        @user.save
        post("/users/activation/#{@confirmation_token}", @password_params)
      end

      it_behaves_like 'no content success response'

      it 'has confirmed user' 

    end
  end
end

