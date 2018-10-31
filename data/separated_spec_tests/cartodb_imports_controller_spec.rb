# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../api/json/imports_controller_shared_examples'
require_relative '../../../../app/controllers/carto/api/imports_controller'
require 'helpers/unique_names_helper'

describe Carto::Api::ImportsController do
  include UniqueNamesHelper
  it_behaves_like 'imports controllers' do
  end

  @headers = { 'CONTENT_TYPE'  => 'application/json' }

  before(:all) do
    @user = FactoryGirl.create(:valid_user)
    host! "#{@user.username}.localhost.lan"
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    bypass_named_maps
    delete_user_data @user
  end

  let(:params) { { api_key: @user.api_key } }

  it 'gets a list of all pending imports' 


  it "doesn't return old pending imports" 


  it 'gets the detail of an import' 


  it 'gets the detail of an import stuck unpacking' 


  it 'tries to import a tgz' 


  it 'fails with password protected files' 


  it 'imports files with weird filenames' 


  it 'creates a table from a sql query' 


  it 'returns derived visualization id if created with create_vis flag' 


  describe 'service_token_valid?' do
    it 'returns oauth_valid false for unknown service tokens' 


    it 'returns 400 for known service token without known service datasource' 


    it 'returns 400 for known service token for a service datasource which is not BaseOAuth' 


    it 'returns oauth_valid false for not valid tokens and deletes them' 


    it 'returns 401 for expired tokens on assignment and deletes them' 


    it 'returns 401 for expired tokens on validation and deletes them' 


  end

  describe 'list_files_for_service' do

    def fake_item_data(datasource_name = 'fake_datasource')
      id = unique_integer
      {
        id:       id,
        title:    "title_#{id}",
        filename: "filename_#{id}",
        service:  datasource_name,
        checksum: id,
        size:     rand(50)
      }
    end

    def fake_resource_list(datasource_name = 'fake_datasource')
      [ fake_item_data(datasource_name), fake_item_data(datasource_name) ]
    end

    it 'returns datasource resources list for known, valid tokens' 


    it 'returns 401 for expired tokens on resource listing and deletes them' 


  end

  describe 'auth_url' do

    it 'returns 400 for existing tokens services' 


    it 'returns auth url for known, valid tokens' 


    it 'returns 401 for expired tokens on url and deletes them' 

  end

  describe 'validate_service_oauth_code' do

    it 'returns 400 for existing tokens services' 


    it 'returns 400 if it does not find datasource' 


    it 'returns 401 for expired tokens on url and deletes them' 


    it 'returns not success 200 and does not store oauth for not valid codes' 


    it 'returns 400 if validation fails catastrophically' 


    it 'returns success 200 and stores oauth for valid codes' 


  end

  describe 'service_oauth_callback' do

    it 'returns 400 for existing tokens services' 


    it 'returns 401 for expired tokens and deletes them' 


    it 'returns success 200 and stores oauth for valid params' 


  end

end

