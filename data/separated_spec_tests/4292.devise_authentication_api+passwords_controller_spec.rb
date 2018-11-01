require 'spec_helper'

describe '' do

  include ApiHelper
  include_context "shared setup"

  context 'unauthenticated user' do

    before { register_and_confirm @good_creds }

    describe 'reset password via PATCH /users/password' do
      before do
        ActionMailer::Base.deliveries.clear
        post '/users/password', {user: {email: @email}}

        message = ActionMailer::Base.deliveries.last
        @reset_token = message.body.raw_source[/password\/([^"]+)/,1]
      end

      describe 'success' do
        before do
          patch "/users/password/#{@reset_token}", {user: {password: 'newpassword'}}
        end

        it_behaves_like 'no content success response'

        it 'changes password' 

      end

      describe 'failure due to missing password' do
        before do
          patch "/users/password/#{@reset_token}", {user: {email: @email}}
        end

        it 'returns 422 Unprocessible status code' 


        it 'returns error message' 


        it 'does not change password' 

      end

      describe 'failure due to bad token' do
        before do
          patch "/users/password/bad_token", {user: {password: 'newpassword'}}
        end

        it_behaves_like 'unauthorized with invalid token error'

        it 'does not change password' 

      end

      describe 'failure due to suspended user' do
        before do
          user = user(@email)
          user.suspended = true
          user.save!
          patch "/users/password/#{@reset_token}", {user: {password: 'newpassword'}}
        end

        it_behaves_like 'account suspended response'
      end

    end
  end

end

