require_relative '../../../spec_helper_min'
require_relative '../../../support/helpers'

describe Carto::Superadmin::UserMigrationExportsController do
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

    let(:export_for_user) do
      {
        user_id: @user.id
      }
    end

    let(:export_for_organization) do
      {
        organization_id: @organization.id
      }
    end

    it 'returns 401 if not authorized' 


    it 'creates an export for user' 


    it 'creates an export for organization' 


    it 'returns an error if passing both user and organization' 


    it 'returns an error if not passing parameters' 

  end

  describe '#show' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @export = Carto::UserMigrationExport.create(user: @user)
    end

    after(:all) do
      @export.destroy
      @user.destroy
    end

    it 'returns 401 if not authorized' 


    it 'returns the export if authorized and task is pending' 


    it 'includes the exported file paths when task is complete' 

  end
end

