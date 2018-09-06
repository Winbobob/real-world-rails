# encoding: utf-8

require_relative '../../../spec_helper'

describe Carto::Api::RecordsController do
  describe '#show legacy tests' do

    before(:all) do
      @user = FactoryGirl.create(:valid_user)
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      @table = create_table(user_id: @user.id)
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    let(:params) { { api_key: @user.api_key, table_id: @table.name, user_domain: @user.username } }

    it "Insert a new row and get the record" 


    it "Get a record that doesn't exist" 


    it "Update a row" 


    it "Update a row that doesn't exist" 


    it "Updates a row with id column" 


    it "Remove a row" 


    it "Remove multiple rows" 


    it 'Create a new row of type number and insert float values' 


    it "Create a new row including the_geom field" 


    it "Update a row including the_geom field" 

  end
end

