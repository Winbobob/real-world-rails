# encoding: utf-8

require_relative '../../../spec_helper'
require 'helpers/unique_names_helper'

describe Carto::Api::TablesController do
  include UniqueNamesHelper

  describe '#show legacy tests' do

    before(:all) do
      @user = FactoryGirl.create(:valid_user, private_tables_enabled: true)
      @carto_user = Carto::User.find(@user.id)

      CartoDB::Varnish.any_instance.stubs(:send_command).returns(true)
      host! "#{@user.username}.localhost.lan"
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
    end

    after(:all) do
      @user.destroy
    end

    let(:params) {{ api_key: @user.api_key }}

    it 'returns table attributes' 


    it 'returns dependent visualizations' 


    it "check imported table metadata" 


    it "creates a new table without schema" 


    it "creates a new table without schema when a table of the same name exists on the database" 


    it "creates a new table specifing a name, description and a schema" 


    it "updates the metadata of an existing table" 


    it "updates with bad values the metadata of an existing table" 


    it "updates a table and sets the lat and long columns" 


  end

  describe '#show' do
    include_context 'visualization creation helpers'
    include_context 'organization with users helper'

    it 'loads my table if other user has shared a table with the same name with me' 

  end

  private

  # Filter out timestamp columns for compatibility as they won't be
  # present in next version of cartodb-postgresql extension.
  def filter_timestamps(schema)
    schema.reject { |item| ['created_at', 'updated_at'].include?(item[0]) }
  end

end

