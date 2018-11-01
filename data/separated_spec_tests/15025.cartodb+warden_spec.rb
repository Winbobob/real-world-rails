require 'spec_helper_min'
require 'support/helpers'

describe 'Warden' do
  describe ':auth_api Strategy' do
    include_context 'users helper'
    include HelperMethods

    def generate_api_key_url
      api_keys_url(user_domain: @user_api_keys.username)
    end

    before :all do
      @user_api_keys = FactoryGirl.create(:valid_user)
      @master_api_key = Carto::ApiKey.where(user_id: @user_api_keys.id).master.first
    end

    after :all do
      @user_api_keys.destroy
    end

    it 'authenticates with header' 


    it 'returns 401 if header is missing' 


    it 'returns 401 if header is malformed' 


    it 'returns 401 if base64 is malforemd' 

  end

  describe 'password expiration' do
    include HelperMethods

    before(:all) do
      @user = FactoryGirl.create(:valid_user)
      @user.password = @user.password_confirmation = 'qwaszx'
      @user.save
    end

    after(:all) do
      @user.destroy
    end

    let (:session_expired_message) { 'Your session has expired' }

    def login
      # Manual login because `login_as` skips normal warden hook processing
      host! "#{@user.username}.localhost.lan"
      post create_session_url(email: @user.email, password: @user.password)
    end

    it 'allows access for non-expired session' 


    it 'UI redirects to login page if password is expired' 


    it 'API returns 403 with an error if password is expired' 


    it 'does not allow access password_change if password is not expired' 


    it 'does not validate password expiration for API-key requests' 

  end
end

