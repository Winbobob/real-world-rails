# coding: UTF-8

require 'spec_helper'

describe "Geocodings API" do
  before(:all) do
    @user = FactoryGirl.create(:valid_user, table_quota: 50)

    delete_user_data @user
    host! "#{@user.username}.localhost.lan"
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    bypass_named_maps
  end

  let(:params) { { :api_key => @user.api_key } }

  describe 'POST /api/v1/geocodings' do
    let(:table) { create_table(user_id: @user.id) }

    it 'creates a new geocoding' 


    it 'uses column_name instead of formatter if present' 


    describe 'namedplace geocodings' do
      it "should set the country_code when the name of the country is present" 


      it "should set country_code and country_column when a country column has been selected" 


      it "should set the region_code when the name of the region is present" 


      it "should set region_code and region_column when a region column has been selected" 

    end

    it 'responds with 422 on bad payload' 


    it 'responds with 500 on failure' 

  end

  describe 'PUT /api/v1/geocodings/:id' do
    it 'fails gracefully on job cancel failure' 

  end

end

