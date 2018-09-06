# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/layers_controller'
require 'helpers/unique_names_helper'

describe Carto::Api::LayersController do
  include UniqueNamesHelper

  describe '#refactored tests' do
    include Rack::Test::Methods
    include Warden::Test::Helpers
    include CacheHelper
    include Carto::Factories::Visualizations

    include_context 'users helper'

    describe '#operations' do
      after(:each) do
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
        @layer.destroy if @layer
        @layer2.destroy if @layer2
      end

      let(:kind) { 'carto' }

      let(:create_layer_url) do
        api_v1_users_layers_create_url(user_domain: @user1.username, user_id: @user1.id, api_key: @user1.api_key)
      end

      def create_map_layer_url(map_id)
        api_v1_maps_layers_create_url(user_domain: @user1.username, map_id: map_id, api_key: @user1.api_key)
      end

      def update_map_layer_url(map_id, layer_id = nil)
        api_v1_maps_layers_update_url(
          user_domain: @user1.username,
          map_id: map_id,
          id: layer_id,
          api_key: @user1.api_key
        )
      end

      def delete_map_layer_url(map_id, layer_id)
        api_v1_maps_layers_destroy_url(
          user_domain: @user1.username,
          map_id: map_id,
          id: layer_id,
          api_key: @user1.api_key
        )
      end

      let(:layer_json) do
        { kind: kind, options: { table_name: nil, user_name: nil }, order: 1, infowindow: {}, tooltip: {} }
      end

      it 'creates layers' 


      it 'creates layers on maps' 


      it 'registers table dependencies when creating a layer for a map' 


      it 'does not allow to exceed max_layers' 


      it 'updates one layer' 


      it 'register table dependencies when updating layers' 


      it 'updates several layers at once' 


      it 'does not update table_name or users_name options' 


      it 'does not remove table_name or users_name options' 


      it 'destroys layers' 

    end

    describe 'creating a layer from an analysis node moves the style history' do
      def create_layer(new_source, new_letter, from_letter)
        url = api_v1_maps_layers_create_url(user_domain: @user2.username, map_id: @map.id, api_key: @user2.api_key)
        payload = {
          kind: 'carto',
          options: {
            source: new_source,
            letter: new_letter,
            table_name: @table.name,
            user_name: @user2.username
          },
          infowindow: {},
          tooltip: {},
          from_layer_id: @original_layer.id,
          from_letter: from_letter
        }
        post_json url, payload do |response|
          response.status.should eq 200
          layer_response = response.body

          Carto::Layer.find(layer_response[:id])
        end
      end

      before(:each) do
        @map, @table, @table_visualization, @visualization = create_full_visualization(@carto_user2)
        @original_layer = @map.data_layers.first
        @original_layer.options[:source] = 'a2'
        @original_layer.save
        @original_layer.layer_node_styles.each(&:destroy)

        ['a2', 'a1', 'a0'].each do |node_id|
          LayerNodeStyle.create(
            layer_id: @original_layer.id,
            source_id: node_id,
            options: { original_id: node_id },
            infowindow: {},
            tooltip: {}
          )
        end
      end

      after(:each) do
        @layer.destroy if @layer
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      end

      def verify_layer_node_styles(layer, styles_map)
        # Map original_source_id -> new_source_id
        layer.layer_node_styles.reload
        actual_styles_map = layer.layer_node_styles.map { |lns| [lns.options[:original_id], lns.source_id] }.to_h
        actual_styles_map.should eq styles_map
      end

      it 'when dragging an intermediate node' 


      describe 'when dragging a header node' do
        # The original layer is renamed to B (rename A2 -> B1, A1 -> B1) and the new layer is named A (copy A1 and A0)
        # The rename and the layer creation are independent requests, so we have to handle
        # both possible orders of requests gracefully.
        #   _______       _______   ______
        #  | A    |      | A    |  | B    |
        #  |      |      |      |  |      |
        #  | {A2} |  =>  |      |  | {B1} |
        #  | [A1] |      | [A1] |  | [A1] |
        #  | [A0] |      | [A0] |  |      |
        #  |______|      |______|  |______|
        it 'and the original layer has been previously renamed' 


        it 'and the original layer has not yet been renamed' 

      end
    end

    describe "API 1.0 map layers management" do
      before(:all) do
        Capybara.current_driver = :rack_test
        @user = create_user
      end

      before(:each) do
        bypass_named_maps
        delete_user_data @user
        host! "#{@user.username}.localhost.lan"
        @table = create_table(user_id: @user.id)
        @map = create_map(user_id: @user.id, table_id: @table.id)
        @table.reload
      end

      after(:all) do
        bypass_named_maps
        @user.destroy
      end

      let(:params) { { api_key: @user.api_key } }

      it "Create a new layer associated to a map" 


      it "Get layer information" 


      it "Get all map layers" 


      # see https://cartodb.atlassian.net/browse/CDB-3350
      it "Update a layer" 


      it "Update several layers at once" 


      it "Update a layer does not change table_name neither user_name" 


      # see https://cartodb.atlassian.net/browse/CDB-3350
      it "Update a layer > tiler error" 


      it "Drop a layer" 

    end

    describe "API 1.0 user layers management" do
      before(:all) do
        Capybara.current_driver = :rack_test
        @user = create_user
      end

      before(:each) do
        bypass_named_maps
        delete_user_data @user
        host! "#{@user.username}.localhost.lan"
        @table = create_table(user_id: @user.id)
      end

      after(:all) do
        bypass_named_maps
        @user.destroy
      end

      let(:params) { { api_key: @user.api_key } }

      it "Create a new layer associated to the current user" 


      # see https://cartodb.atlassian.net/browse/CDB-3350
      it "Update a layer" 


      it "Drop a layer" 

    end
  end

  before(:each) do
    bypass_named_maps
  end

  describe 'attribution changes' do
    include Rack::Test::Methods
    include Warden::Test::Helpers

    before(:all) do
      CartoDB::Visualization::Member.any_instance.stubs(:invalidate_cache).returns(nil)

      @headers = { 'CONTENT_TYPE' => 'application/json' }

      @user = FactoryGirl.create(:valid_user)
    end

    after(:each) do
      @user.destroy
    end

    it 'attribution changes in a visualization propagate to associated layers' 

  end

  describe 'index' do
    include Rack::Test::Methods
    include Warden::Test::Helpers
    include CacheHelper
    include_context 'visualization creation helpers'
    include_context 'users helper'

    it 'fetches layers from shared visualizations' 

  end

  describe '#show legacy tests' do
    before(:all) do
      @user = create_user

      host! "#{@user.username}.localhost.lan"
    end

    before(:each) do
      bypass_named_maps
      delete_user_data @user
      @table = create_table user_id: @user.id
    end

    after(:all) do
      bypass_named_maps
      @user.destroy
    end

    let(:params) { { api_key: @user.api_key } }

    it "Get all user layers" 


    it "Gets layers by map id" 

  end
end

