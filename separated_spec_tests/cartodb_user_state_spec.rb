# encoding: utf-8

require_relative '../spec_helper'
include Warden::Test::Helpers
include Carto::Factories::Visualizations

def login(user)
  login_as(user, scope: user.username)
  host! "#{user.username}.localhost.lan"
end

def follow_redirects(limit = 10)
  while response.redirect? && (limit -= 1) > 0
    follow_redirect!
  end
end

describe "UserState" do

  before(:all) do
    @feature_flag = FactoryGirl.create(:feature_flag, name: 'no_free_tier', restricted: false)
    @locked_user = FactoryGirl.create(:locked_user)
    @map, @table, @table_visualization, @visualization = create_full_builder_vis(@locked_user)
    @visualization.create_mapcap!
    @non_locked_user = FactoryGirl.create(:valid_user)
    @dashboard_endpoints = ['/dashboard', '/dashboard/tables', '/dashboard/datasets', '/dashboard/visualizations',
                            '/dashboard/maps'].freeze
    @public_user_endpoints = ['/me'].freeze
    @user_endpoints = ['/account', '/profile'].freeze
    @tables_endpoints = ["/tables/#{@table.id}", "/tables/#{@table.id}/public",
                         "/tables/#{@table.id}/embed_map"].freeze
    @viz_endpoints = ["/viz/#{@visualization.id}/public",
                      "/viz/#{@visualization.id}/embed_map", "/viz/#{@visualization.id}/public_map",
                      "/builder/#{@visualization.id}", "/builder/#{@visualization.id}/embed"].freeze
    @public_api_endpoints = ["/api/v1/viz", "/api/v1/viz/#{@visualization.id}",
                             "/api/v2/viz/#{@visualization.id}/viz",
                             "/api/v3/me", "/api/v3/viz/#{@visualization.id}/viz"].freeze
    @private_api_endpoints = ["/api/v1/tables/#{@table.id}", "/api/v1/tables/#{@table.id}/columns",
                              "/api/v1/imports", "/api/v1/users/#{@locked_user.id}/layers",
                              "/api/v1/synchronizations", "/api/v1/geocodings",
                              "/api/v1/users/#{@locked_user.id}"]
    @headers = {}
    @api_headers = { 'CONTENT_TYPE' => 'application/json', :format => "json" }
  end

  after(:all) do
    @locked_user.destroy
    @non_locked_user.destroy
  end

  describe '#locked user' do
    it 'owner accessing their resources' 

    it 'user accessing a locked user resources' 

    it 'non-logged user accessing a locked user resources' 

  end
  describe '#non locked user' do
    before(:all) do
      @locked_user.state = 'active'
      @locked_user.save
    end
    after(:all) do
      @locked_user.state = 'locked'
      @locked_user.save
    end
    it 'owner accessing their resources' 

    it 'non locked user accessing a locked user resources' 

    it 'non-logged user accessing a locked user resources' 

  end
end

