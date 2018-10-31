# encoding: utf-8
require 'sequel'
require 'rack/test'
require 'json'
require 'uri'
require_relative '../../spec_helper'
require_relative '../../../services/data-repository/backend/sequel'
require 'helpers/unique_names_helper'

describe Carto::Api::VisualizationsController do
  include UniqueNamesHelper
  include Rack::Test::Methods
  include DataRepository

  before(:all) do
    CartoDB::Varnish.any_instance.stubs(:send_command).returns(true)
    @user = create_user(
      private_tables_enabled: true,
      private_maps_enabled: true
    )
    @api_key = @user.api_key
  end

  before(:each) do
    CartoDB::Varnish.any_instance.stubs(:send_command).returns(true)
    bypass_named_maps_requests

    begin
      delete_user_data @user
    rescue => exception
      # Silence named maps problems only here upon data cleaning, not in specs
      raise unless exception.class.to_s == 'CartoDB::NamedMapsWrapper::HTTPResponseError'
    end

    @headers = {
      'CONTENT_TYPE' => 'application/json'
    }
    host! "#{@user.username}.localhost.lan"
  end

  after(:all) do
    bypass_named_maps
    @user.destroy
  end

  describe 'POST /api/v1/viz' do
    it 'creates a visualization' 


    it 'creates a visualization from a source_visualization_id' 


    it 'creates a private visualization from a private table' 


    it 'creates a private visualization if any table in the list is private' 


    it 'creates a private visualization if any table in the list is private' 


    it 'assigns a generated name if name taken' 

  end # POST /api/v1/viz

  describe 'PUT /api/v1/viz/:id' do
    it 'updates an existing visualization' 


    it 'updates the table in a table visualization', now: true do
      table_attributes = table_factory
      id = table_attributes.fetch('table_visualization').fetch('id')

      Delorean.jump(1.minute)
      put "/api/v1/viz/#{id}?api_key=#{@api_key}", { name: 'changed name', id: id }.to_json, @headers
      Delorean.back_to_the_present
      last_response.status.should == 200
      response = JSON.parse(last_response.body)

      response.fetch('table').fetch('updated_at').should_not == table_attributes.fetch('updated_at')
    end

    it 'returns a downcased name' 


    it 'returns a sanitized name' 

  end # PUT /api/v1/viz/:id

  describe 'DELETE /api/v1/viz/:id' do
    it 'deletes the visualization' 


    it 'deletes the associated table' 

  end # DELETE /api/v1/viz/:id

  # Visualizations are always created with default_privacy
  def factory(attributes={})
    {
      name:                     attributes.fetch(:name, unique_name('viz')),
      tags:                     attributes.fetch(:tags, ['foo', 'bar']),
      map_id:                   attributes.fetch(:map_id, ::Map.create(user_id: @user.id).id),
      description:              attributes.fetch(:description, 'bogus'),
      type:                     attributes.fetch(:type, 'derived'),
      privacy:                  attributes.fetch(:privacy, 'public'),
      source_visualization_id:  attributes.fetch(:source_visualization_id, nil),
      parent_id:                attributes.fetch(:parent_id, nil),
      locked:                   attributes.fetch(:locked, false),
      prev_id:                  attributes.fetch(:prev_id, nil),
      next_id:                  attributes.fetch(:next_id, nil)
    }
  end

  def table_factory(options={})
    privacy = options.fetch(:privacy, 1)

    name    = unique_name('table')
    payload = {
      name:         name,
      description:  "#{name} description"
    }
    post "/api/v1/tables?api_key=#{@api_key}", payload.to_json, @headers

    table_attributes  = JSON.parse(last_response.body)
    table_id          = table_attributes.fetch('table_visualization').fetch("id")

    put "/api/v1/viz/#{table_id}?api_key=#{@api_key}", { privacy: privacy }.to_json, @headers

    table_attributes
  end
end

