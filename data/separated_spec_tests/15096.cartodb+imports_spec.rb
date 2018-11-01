# encoding: utf-8

require 'spec_helper'

describe "Imports API" do

  before(:all) do
    @user = FactoryGirl.create(:valid_user)
  end

  before(:each) do
    bypass_named_maps
    delete_user_data @user
    host! "#{@user.username}.localhost.lan"
  end

  after(:all) do
    @user.destroy
  end

  let(:params) { { :api_key => @user.api_key } }

  it 'performs asynchronous imports' 


  it 'performs asynchronous imports (file parameter, used in API docs)' 


  it 'performs asynchronous url imports' 


  pending 'appends data to an existing table' do
    @table = FactoryGirl.create(:table, :user_id => @user.id)

    f = upload_file('db/fake_data/column_number_to_boolean.csv', 'text/csv')
    post api_v1_imports_create_url(params.merge(table_id: @table.id, append: true)),
         f.read.force_encoding('UTF-8'),
         filename: f

    response.code.should be == '200'
    response_json = JSON.parse(response.body)

    last_import = DataImport[response_json['item_queue_id']]
    last_import.state.should be == 'complete'

    @table.reload.rows_counted.should be == 4
  end

  it 'duplicates a table' 


  it 'detects lat/long columns and produces a the_geom column from them' 


  it 'duplicates a table without geometries' 


  it 'imports all the sample data' 


  it 'raises an error if the user attempts to import tables when being over quota' 


  it 'raises an error if the user attempts to import tables when being over disk quota' 


  it 'raises an error if the user attempts to duplicate a table when being over quota' 


  it 'imports data when the user has infinite tables' 


  it 'updates tables_created_count upon finished import' 


  it 'properly reports table row count limit' 


end

