require 'spec_helper'

describe 'registration of user via POST /admin/:token/users' do

  include ApiHelper
  include_context "shared setup"

  before do
    @user_params = {user: {email: @email} }
  end

  context 'by non-admin user' do
    before do
      user = User.create! @good_creds[:user]
      @token = user.authentication_token
    end

    describe 'failure' do
      before do
        post("/admin/#{@token}/users", @user_params)
      end

      it_behaves_like 'unauthorized with invalid token error'
    end
  end

  context 'by admin user' do
    before do
      INITIALIZE_ADMIN_USER.call
      @admin_user = User.last
      @admin_token = @admin_user.authentication_token
    end

    describe 'success' do
      before do
        ActionMailer::Base.deliveries.clear
        post("/admin/#{@admin_token}/users", @user_params)
      end

      it 'returns 201 Created status code' 


      it 'returns "Cache-Control: no-cache" in header' 


      it 'returns "Content-Type: application/json; charset=utf-8" in header' 


      it 'returns Content-Length in header' 


      it 'returns email in JSON' 


      it 'returns confirmation_token_for_tests_only in JSON' 


      it 'does not return _id in JSON' 


      it 'does not return authentication_token in JSON' 


      it 'does not return confirmation_token in JSON' 


      include_examples 'sends confirmation email'

      it 'sets user password blank' 


      it 'sets is_admin_user to false' 

    end

    describe 'failure due to suspended admin user' do
      before do
        @admin_user.suspended = true
        @admin_user.save

        ActionMailer::Base.deliveries.clear
        post("/admin/#{@admin_token}/users", @user_params)
      end

      it_behaves_like 'account suspended response'

      it 'does not send confirmation email' 

    end

    describe 'failure due to bad email' do
      before do
        ActionMailer::Base.deliveries.clear
        post("/admin/#{@admin_token}/users", {user: {email: 'bademail'} } )
      end

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns errors in JSON' 


      it 'does not send confirmation email' 

    end

    describe 'failure due to password being provided' do
      before do
        ActionMailer::Base.deliveries.clear
        post("/admin/#{@admin_token}/users", {user: {email: @email, password: 'test1234'} } )
      end

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns errors in JSON' 


      it 'does not send confirmation email' 

    end

  end
end

