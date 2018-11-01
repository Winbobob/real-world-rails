# encoding: utf-8
require 'sequel'
require 'rack/test'
require 'json'
require_relative '../../spec_helper'
require_relative '../../support/factories/organizations'
require_relative '../../../app/controllers/admin/visualizations_controller'
require 'helpers/unique_names_helper'

def app
  CartoDB::Application.new
end #app

describe Admin::VisualizationsController do
  include UniqueNamesHelper
  include Rack::Test::Methods
  include Warden::Test::Helpers
  include CacheHelper
  include Carto::Factories::Visualizations

  # Mock for a Rails context
  class ContextMock
    def initialize(global_context)
      @global_context = global_context
    end

    def request
      nil
    end

    def polymorphic_path(*args)
      @global_context.polymorphic_path(*args)
    end
  end

  before(:all) do
    @user = FactoryGirl.create(:valid_user, private_tables_enabled: true)

    @api_key = @user.api_key
    @user.stubs(:should_load_common_data?).returns(false)

    @headers = {
      'CONTENT_TYPE'  => 'application/json',
    }
    @mock_context = ContextMock.new(self)
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    bypass_named_maps
    delete_user_data @user
    host! "#{@user.username}.localhost.lan"
  end

  describe 'GET /viz' do
    it 'returns a list of visualizations' 


    it 'returns 403 if user not logged in' 

  end # GET /viz

  describe 'GET /viz:id' do
    it 'returns a visualization' 


    it 'redirects to the public view if visualization private' 


    it 'keeps the base path (table|visualization) when redirecting' 


    describe 'redirects to builder' do
      describe 'for tables' do
        before(:each) do
          @id = table_factory.id
        end
        it 'if forced' 


        it 'only if enabled' 


        it 'only if forced' 

      end

      describe 'for visualizations' do
        before(:each) do
          @id = factory.fetch('id')
        end
        it 'if forced' 


        it 'only if enabled' 


        it 'only if forced' 


        it 'never for vizjson2 visualizations' 


        it 'embed redirects to builder for v3 when needed' 

      end
    end
  end # GET /viz/:id

  describe 'GET /tables/:id/public/table' do
    it 'returns 404 for private tables' 

  end

  describe 'GET /viz/:id/protected_public_map' do
    it 'returns 404 for private maps' 

  end

  describe 'GET /viz/:id/protected_embed_map' do
    it 'returns 404 for private maps' 

  end

  describe 'GET /viz/:id/public_map' do
    it 'returns 403 for private maps' 


    it 'returns proper surrogate-keys' 


    it 'returns public map for org users' 


    it 'does not load daily mapviews stats' 


    it 'serves X-Frame-Options: DENY' 

  end

  describe 'public_visualizations_show_map' do

    it 'does not load daily mapviews stats' 


  end

  describe 'GET /viz/:id/public' do
    it 'returns public data for a table visualization' 


    it 'returns a 404 if table is private' 


    it "redirects to embed_map if visualization is 'derived'" 

  end # GET /viz/:id/public

  describe 'GET /tables/:id/embed_map' do
    it 'returns 404 for nonexisting tables when table name is used' 

  end

  describe 'GET /viz/:name/embed_map' do
    it 'renders the view by passing a visualization name' 


    it 'renders embed map error page if visualization private' 


    it 'renders embed map error when an exception is raised' 


    it 'doesnt serve X-Frame-Options: DENY on embedded with name' 

  end

  describe 'GET /viz/:id/embed_map' do
    it 'caches and serves public embed map successful responses' 


    it 'doesnt serve X-Frame-Options: DENY on embedded' 

  end

  describe 'GET /viz/:name/track_embed' do
    it 'renders the view by passing a visualization name' 


    it 'doesnt serve X-Frame-Options: DENY for track_embed' 

  end

  describe 'non existent visualization' do
    it 'returns 404' 

  end # non existent visualization

  describe 'org user visualization redirection' do
    it 'if A shares a (shared) vis link to B with A username, performs a redirect to B username' 


    # @see https://github.com/CartoDB/cartodb/issues/6081
    it 'If logged user navigates to legacy url from org user without org name, gets redirected properly' 

  end

  describe 'find visualizations by name' do
    before(:all) do
      @organization = create_organization_with_users(name: unique_name('organization'))
      @org_user = @organization.users.first
      bypass_named_maps
      @table = new_table(user_id: @org_user.id, privacy: ::UserTable::PRIVACY_PUBLIC).save.reload
      @faketable = new_table(user_id: @user.id, privacy: ::UserTable::PRIVACY_PUBLIC).save.reload
      @faketable_name = @faketable.table_visualization.name
    end

    it 'finds visualization by org and name' 


    it 'does not find visualizations outside org' 


    it 'finds visualization by user and public.name' 


    it 'finds visualization by user and public.id' 


    it 'does not find visualizations outside user with public schema' 


    it 'does not try to search visualizations with invalid user/org' 

  end

  def login_host(user, org = nil)
    login_as(user, scope: user.username)
    host! "#{org.nil? ? user.username : org.name}.localhost.lan"
  end

  def follow_redirects(limit = 10)
    while last_response.status == 302 && (limit -= 1) > 0 do
        follow_redirect!
    end
  end

  def factory(owner=nil)
    owner = @user if owner.nil?
    map     = Map.create(user_id: owner.id)
    payload = {
      name:         unique_name('viz'),
      tags:         ['foo', 'bar'],
      map_id:       map.id,
      description:  'bogus',
      type:         'derived'
    }

    with_host "#{owner.username}.localhost.lan" do
      post "/api/v1/viz?api_key=#{owner.api_key}", payload.to_json
    end


    JSON.parse(last_response.body)
  end

  def table_factory(attrs = {})
    new_table(attrs.merge(user_id: @user.id)).save.reload
  end

end # Admin::VisualizationsController

