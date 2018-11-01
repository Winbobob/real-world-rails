# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../api/json/geocodings_controller_shared_examples'
require_relative '../../../../app/controllers/carto/api/geocodings_controller'
require 'mock_redis'

describe Carto::Api::GeocodingsController do
  it_behaves_like 'geocoding controllers' do
  end

describe 'legacy behaviour tests' do
    let(:params) { { :api_key => @user.api_key } }

    before(:all) do
      @user = create_user
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      host! "#{@user.username}.localhost.lan"
      login_as(@user, scope: @user.username)
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    describe 'GET /api/v1/geocodings' do

      it 'returns every geocoding belonging to current_user' 

    end

    describe 'GET /api/v1/geocodings/:id' do

      it 'returns a geocoding' 


      it 'does not return a geocoding owned by another user' 

    end

    describe 'GET /api/v1/geocodings/estimation_for' do

      it 'returns the estimated geocoding cost for the specified table' 


      it 'returns 500 if the table does not exist' 


      it 'takes the parameter force_all_rows into consideration' 


    end
  end


  describe 'available_geometries' do
    include_context 'users helper'
    include_context 'visualization creation helpers'

    before(:each) do
      login(@user1)
    end

    it 'returns 400 if kind is not admin1, namedplace or postalcode' 


    it 'returns "polygon" for "admin1" kind' 


    it 'returns "point" for "namedplace" kind' 


    it 'returns 400 for postal code if "free_text" or "column_name" and "table_name" are not set' 


    it 'returns empty json for postalcode if free text is empty or has non alphanumeric characters' 


    it 'returns point and polygon if SQLApi says there are the same amount of points and polygons services, or the one with more data if they are not equal' 


    it 'returns point from an input column if SQLApi says there is a point service for it' 


    it 'returns 400 if table name does not exist' 


    it 'Queries SQL API with table columns' 


  end

  describe 'estimation_for' do
    include_context 'users helper'
    include_context 'visualization creation helpers'

    before(:each) do
      login(@user1)
    end

    it 'returns estimation and price' 


  end

  def remove_dates(geocoding_hash)
    geocoding_hash.except('created_at', 'updated_at')
  end

  describe 'index' do
    include_context 'users helper'

    before(:each) do
      login(@user1)
    end

    it 'returns started geocodings but not finished' 


  end

  describe 'show' do
    include_context 'users helper'

    before(:each) do
      login(@user1)
    end

    it 'returns requested geocoding' 


  end

  include Rack::Test::Methods
  include Warden::Test::Helpers
end

