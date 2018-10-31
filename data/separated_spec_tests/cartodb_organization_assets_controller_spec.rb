# encoding: utf-8

require 'spec_helper_min'
require 'support/helpers'
require 'helpers/storage_helper'

describe Carto::Api::OrganizationAssetsController do
  include HelperMethods, StorageHelper
  include_context 'organization with users helper'

  before(:all) do
    @owner = @carto_organization.owner
    @sub = @carto_org_user_1
    @intruder = FactoryGirl.create(:carto_user)
  end

  after(:all) do
    @intruder.destroy
    @owner = nil
    @sub = nil
  end

  let(:storage_info) do
    {
      type: 'local',
      location: 'manolo_folder',
      identifier: 'could_be_a_manolo_hash_23as4g5sh6sd7hd8j9jfgk'
    }
  end

  def asset_should_be_correct(asset_response)
    indifferent_response = asset_response.with_indifferent_access
    asset = Carto::Asset.find(indifferent_response['id'])

    asset.public_url.should eq indifferent_response['public_url']
  end

  describe('#index') do
    before(:all) do
      5.times do
        FactoryGirl.create(:organization_asset,
                           organization_id: @carto_organization.id)
      end
    end

    after(:all) do
      bypass_storage
      Carto::Asset.all.map(&:destroy)
    end

    def index_url(user: @owner, organization: @carto_organization)
      assets_url(user_domain: user.username,
                 organization_id: organization.id,
                 api_key: user.api_key)
    end

    it 'works for organization owners' 


    it 'works for organization users' 


    it 'fails for intruders' 


    it 'fails for unauthenticated' 

  end

  describe('#show') do
    before(:all) do
      @asset = FactoryGirl.create(:organization_asset,
                                  organization_id: @carto_organization.id)
    end

    after(:all) do
      bypass_storage
      @asset.destroy
    end

    def show_url(user: @owner, organization: @carto_organization, asset: @asset)
      asset_url(user_domain: user.username,
                organization_id: organization.id,
                id: asset.id,
                api_key: user.api_key)
    end

    it 'works for organization owners' 


    it 'works for organization users' 


    it 'fails for intruders' 


    it 'fails for unauthenticated' 


    it 'fails for inexistent assets' 

  end

  describe('#destroy') do
    before(:each) do
      bypass_storage

      @asset = FactoryGirl.create(:organization_asset,
                                  organization_id: @carto_organization.id)
    end

    after(:each) do
      bypass_storage
      @asset.destroy
    end

    def destroy_url(user: @owner, organization: @carto_organization, asset: @asset)
      asset_url(user_domain: user.username,
                organization_id: organization.id,
                id: asset.id,
                api_key: user.api_key)
    end

    it 'works for organization owners' 


    it 'fails for organization users' 


    it 'fails for intruders' 


    it 'fails for unauthenticated' 


    it 'fails for inexistent assets' 

  end

  describe('#create') do
    def create_url(user: @owner, organization: @carto_organization)
      assets_url(user_domain: user.username,
                 organization_id: organization.id,
                 api_key: user.api_key)
    end

    let(:payload) do
      {
        resource: 'https://manolo.es/es/co/bar.png'
      }
    end

    before(:each) { bypass_storage }

    after(:all) do
      bypass_storage
      Carto::Asset.all.map(&:destroy)
    end

    it 'works for organization owners' 


    it 'fails for organization users' 


    it 'fails for intruders' 


    it 'fails for unauthenticated' 


    it 'fails if resource unspecified' 

  end
end

