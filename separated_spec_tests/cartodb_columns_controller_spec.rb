# encoding: utf-8

require_relative '../../../spec_helper'

describe Carto::Api::ColumnsController do
  describe '#show legacy tests' do

    before(:all) do
      @user = FactoryGirl.create(:valid_user)
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      @table = create_table user_id: @user.id
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    let(:params) { { api_key: @user.api_key, table_id: @table.name, user_domain: @user.username } }

    it "gets the columns from a table" 


    it "adds a new column to a table" 


    it "Try to add a new column of an invalid type" 


    it "Get the type of a column" 


    it "Get the type of a column that doesn't exist" 


    it "Update the type of a given column" 


    it "Update the type of a given column with an invalid type" 


    it "Rename a column" 


    it "Drop a column" 


  end
end

