require 'spec_helper'

describe '' do

  include ApiHelper
  include_context "shared setup"

  before do
    INITIALIZE_ADMIN_USER.call
    @admin_user = User.last
    @admin_token = @admin_user.authentication_token
    user = User.create! @good_creds[:user]
  end

  describe 'get user via GET /admin/:authentication_token/users/?email=:email' do

    describe 'success' do
      before { get "/admin/#{@admin_token}/users?email=#{@email}" }

      it 'returns 200 OK status code' 


      it 'returns email in JSON' 


      it 'returns suspended flag in JSON' 


      it 'returns is_admin_user flag in JSON' 


      it 'returns locked flag in JSON' 


      it 'does not return authentication_token in JSON' 

    end

    context 'user account locked' do
      before do
        user(@email).lock_access!
        get "/admin/#{@admin_token}/users?email=#{@email}"
      end

      it 'returns locked true' 

    end

    context 'user account suspended' do
      before do
        user = user(@email)
        user.suspended = true
        user.save
        get "/admin/#{@admin_token}/users?email=#{@email}"
      end

      it 'returns suspended true' 

    end

    describe 'failure due to suspended admin user' do
      before do
        @admin_user.suspended = true
        @admin_user.save

        get "/admin/#{@admin_token}/users?email=#{@email}"
      end

      it_behaves_like 'account suspended response'
    end

    describe 'failure due to invalid user email' do
      before { get "/admin/#{@admin_token}/users?email=wrong@example.com" }

      it 'returns 422 status code' 


      it 'returns error message' 

    end

    describe 'failure due to invalid token' do
      before { get "/admin/bad_token/users?email=#{@email}" }

      it_behaves_like 'unauthorized with invalid token error'
    end
  end

end

