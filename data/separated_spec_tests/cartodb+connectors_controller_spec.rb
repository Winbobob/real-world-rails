require 'spec_helper_min'
require 'support/helpers'

describe Carto::Api::ConnectorsController do
  include HelperMethods
  include_context 'organization with users helper'

  before(:all) do
    FactoryGirl.create(:carto_feature_flag, name: 'carto-connectors', restricted: false)
    @user = FactoryGirl.create(:carto_user)
    @connector_provider_postgres = FactoryGirl.create(:connector_provider, name: 'postgres')
    @connector_provider_hive = FactoryGirl.create(:connector_provider, name: 'hive')
    @connector_config_user = FactoryGirl.create(:connector_configuration,
                                                 user_id: @user.id,
                                                 connector_provider_id: @connector_provider_postgres.id,
                                                 enabled: true,
                                                 max_rows: 100)
    @connector_config_org_user = FactoryGirl.create(:connector_configuration,
                                                     user_id: @org_user_1.id,
                                                     connector_provider_id: @connector_provider_hive.id,
                                                     enabled: false,
                                                     max_rows: 100)
    @connector_config_org = FactoryGirl.create(:connector_configuration,
                                                organization_id: @organization.id,
                                                connector_provider_id: @connector_provider_hive.id,
                                                enabled: true,
                                                max_rows: 100)
  end

  after(:all) do
    Carto::FeatureFlag.destroy_all
    @user.destroy
    @connector_config_user.destroy
    @connector_config_org_user.destroy
    @connector_config_org.destroy
    @connector_provider_postgres.destroy
    @connector_provider_hive.destroy
  end

  describe '#index' do
    it 'returns provider enabled for regular user' 


    it 'returns provider false for organization user' 


    it 'returns provider true for organization' 

  end

  describe '#show' do
    it 'returns provider information for regular user' 

    it 'returns 422 if provider doesn\'t exists' 

  end

  describe '#tables' do
    before(:each) do
      pending "Provision odbc_fdw in CI server"
    end
    it 'returns connector tables list' 

  end

  describe '#connect' do
    before(:each) do
      pending "Provision odbc_fdw in CI server"
    end
    it 'returns true if connection went ok' 

    it 'returns 400 if connection went ko' 

  end
end

