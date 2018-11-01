require 'spec_helper'

describe 'change password via PATCH /users/:authentication_token' do

  include ApiHelper
  include_context "shared setup"

  context 'authenticated user' do
    before do
      @user = User.create! @good_creds[:user]
      @token = @user.authentication_token
    end

    describe 'success' do
      before { patch "/users/#{@token}", @new_password_params }

      it_behaves_like 'no content success response'

      it 'changes user password' 

    end

    describe 'failure due to suspended user' do
      before do
        @user.suspended = true
        @user.save!
        patch "/users/#{@token}", @new_password_params
      end

      it_behaves_like 'account suspended response'

      it 'does not change user password' 

    end

    describe 'failure due to missing password' do
      before { patch "/users/#{@token}", {} }

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns "Invalid password." error' 

    end

    describe 'failure due to short password' do
      before { patch "/users/#{@token}", @too_short_password_params }

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns "Invalid token." error' 


      it 'does not change user password' 

    end

    describe 'failure due to invalid token' do
      before { patch '/users/bad_token', @new_password_params }

      it_behaves_like 'unauthorized with invalid token error'

      it 'does not change user password' 

    end

  end
end

