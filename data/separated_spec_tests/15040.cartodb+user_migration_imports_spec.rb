require_relative '../../../spec_helper_min'
require_relative '../../../support/helpers'

describe Carto::Superadmin::UserMigrationImportsController do
  include HelperMethods

  let(:superadmin_headers) do
    credentials = Cartodb.config[:superadmin]
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(
        credentials['username'],
        credentials['password']),
      'HTTP_ACCEPT' => "application/json"
    }
  end

  let(:invalid_headers) do
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('not', 'trusworthy'),
      'HTTP_ACCEPT' => "application/json"
    }
  end

  describe '#create' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @organization = FactoryGirl.create(:organization)
    end

    after(:all) do
      @user.destroy
      @organization.destroy
    end

    let(:import_for_user) do
      {
        exported_file: 'https://carto.com/something/else',
        database_host: '127.0.0.1',
        org_import: false,
        json_file: 'id/user_id.json',
        import_metadata: false
      }
    end

    let(:import_for_organization) do
      {
        exported_file: '/path/to/nowhere',
        database_host: '127.0.0.1',
        org_import: true,
        json_file: 'my_pretty_json',
        import_metadata: false
      }
    end

    it 'returns 401 if not authorized' 


    it 'creates an import for user' 


    it 'creates an import for organization' 


    it 'returns an error if not passing parameters' 

  end

  describe '#show' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @import = Carto::UserMigrationImport.create(
        exported_file: 'some_url',
        database_host: 'some_ip',
        org_import: false,
        json_file: 'some_path'
      )
    end

    after(:all) do
      @import.destroy
      @user.destroy
    end

    it 'returns 401 if not authorized' 


    it 'returns the import if authorized and task is pending' 


    it 'includes the log when task is complete' 

  end
end

