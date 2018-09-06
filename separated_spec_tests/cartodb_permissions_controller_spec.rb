# encoding: utf-8
require 'sequel'
require 'rack/test'
require 'json'
require 'uri'

require 'spec_helper'
require_relative './../../../factories/organizations_contexts'
require 'api/json/synchronizations_controller'


def app
  CartoDB::Application.new
end

describe Carto::Api::PermissionsController do
  include Rack::Test::Methods

  before(:all) do
    @user = create_user
    @api_key = @user.api_key

    @user2 = create_user
  end

  before(:each) do
    delete_user_data @user
    delete_user_data @user2
    @headers = {
      'CONTENT_TYPE' => 'application/json'
    }
    host! "#{@user.username}.localhost.lan"
    @visualization = FactoryGirl.create(:carto_visualization, user: Carto::User.find(@user.id))
    @entity_id = @visualization.id
  end

  after(:all) do
    bypass_named_maps
    @user.destroy
    @user2.destroy
  end

  describe 'PUT /api/v1/perm' do

    it 'modifies an existing permission' 


  end

  describe 'PUT/DELETE /api/v1/perm' do
    it "makes sure we don't expose unwanted call types" 

  end

end

describe 'group permission support' do
  include Rack::Test::Methods
  include_context 'organization with users helper'

  before(:all) do
    @group = FactoryGirl.create(:carto_group, organization_id: @organization.id)
    @group_2 = FactoryGirl.create(:random_group, organization_id: @organization.id)

    @headers = {
      'CONTENT_TYPE'  => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }
  end

  after(:all) do
    @group.destroy
    @group_2.destroy
  end

  it 'adds group read permission' 


  it 'creates a shared entity per shared group' 


end

