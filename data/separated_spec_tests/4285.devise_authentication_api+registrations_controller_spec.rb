require 'spec_helper'

describe 'registration via POST /users' do

  include ApiHelper
  include_context "shared setup"

  context 'unauthenticated user' do

    describe 'success' do
      before { register_and_confirm @good_creds }

      it 'returns 201 Created status code' 


      it 'returns "Cache-Control: no-cache" in header' 


      it 'returns "Content-Type: application/json; charset=utf-8" in header' 


      it 'returns Content-Length in header' 


      it 'returns email in JSON' 


      it 'does not return _id in JSON' 


      it 'does not return authentication_token in JSON' 


      it 'returns confirmation_token in JSON' 


      it 'sets user password' 


      it 'sets is_admin_user to false' 

    end

    describe 'failure due to bad email and missing password' do
      before { register @bad_creds }

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns errors in JSON' 

    end

    describe 'failure due to too short password' do
      before { register @short_password_creds }

      it 'returns 422 Unprocessable Entity status code' 


      it 'returns errors in JSON' 

    end
  end
end

