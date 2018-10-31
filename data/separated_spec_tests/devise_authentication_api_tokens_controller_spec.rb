require 'spec_helper'

describe 'get X-USER-ID via GET /users/:authentication_token' do

  include ApiHelper
  include_context "shared setup"

  context 'by authenticated user' do
    before do
      @user = User.create! @good_creds[:user]
      @token = @user.authentication_token
    end

    describe 'success' do
      before do
        get "/users/#{@token}"
      end

      it 'returns 200' 


      it 'returns X-USER-ID header' 


      it 'returns blank body' 

    end

    describe 'failure due to suspended user' do
      before do
        @user.suspended = true
        @user.save!
        get "/users/#{@token}"
      end

      it_behaves_like 'account suspended response'

      it 'does not return X-USER-ID header' 

    end

    describe 'failure due to bad_token' do
      before do
        get "/users/bad_token"
      end

      it 'returns 401 Unauthorized status code' 


      it 'does not return X-USER-ID header' 


      it 'returns blank body' 

    end

  end
end

