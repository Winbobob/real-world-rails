# encoding: utf-8

require_relative '../../../spec_helper'
require_relative 'geocodings_controller_shared_examples'
require_relative '../../../../app/controllers/api/json/geocodings_controller'

describe Api::Json::GeocodingsController do
  it_behaves_like 'geocoding controllers' do
  end

  include Rack::Test::Methods
  include Warden::Test::Helpers
  include CacheHelper

  describe 'POST api/v1/geocodings' do

    before(:all) do
      @user = create_user
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    let(:params) { { api_key: @user.api_key, kind: 'ipaddress', formatter: '{some_column}' } }

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      host! "#{@user.username}.localhost.lan"
      login_as(@user, scope: @user.username)
    end

    it 'takes an optional argument force_all_rows and stores it in the model' 


    it 'sets force_all_rows to nil if not present' 


  end
end

