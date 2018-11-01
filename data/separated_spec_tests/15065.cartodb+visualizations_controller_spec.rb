# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../factories/users_helper'
require_relative '../../../../app/controllers/carto/api/visualizations_controller'

# TODO: Remove once Carto::Visualization is complete enough
require_relative '../../../../app/models/visualization/member'
require_relative './vizjson_shared_examples'
require 'helpers/unique_names_helper'
require_dependency 'carto/uuidhelper'
require 'factories/carto_visualizations'
require 'helpers/visualization_destruction_helper'
require 'helpers/feature_flag_helper'

include Carto::UUIDHelper

describe Carto::Api::VisualizationsController do
  include UniqueNamesHelper
  include Carto::Factories::Visualizations
  include VisualizationDestructionHelper
  include FeatureFlagHelper

  describe 'vizjson2 generator' do
    it_behaves_like 'vizjson generator' do
      def api_vx_visualizations_vizjson_url(options)
        api_v2_visualizations_vizjson_url(options)
      end

      def vizjson_vx_version
        '0.1.0'
      end

      def attributions_from_vizjson(visualization)
        visualization['layers'][1]['options']['attribution'].split(',').map(&:strip)
      end

      before(:each) do
        bypass_named_maps
      end

      it 'marks visualizations as using vizjson2' 


      it 'marks visualizations as using vizjson2 with invalid referer' 


      it 'marks visualizations as using vizjson2 without referer' 


      it 'does not mark visualizations as using vizjson2 with carto referer' 

    end
  end

  describe 'vizjson3 generator' do
    it_behaves_like 'vizjson generator' do
      def api_vx_visualizations_vizjson_url(options)
        api_v3_visualizations_vizjson_url(options)
      end

      def vizjson_vx_version
        '3.0.0'
      end

      def attributions_from_vizjson(visualization)
        visualization['layers'].select { |l| l['type'] == 'CartoDB' }
                               .map { |l| l['options']['attribution'] }
                               .select(&:present?)
      end
    end
  end

  TEST_UUID = '00000000-0000-0000-0000-000000000000'.freeze

  DATE_ATTRIBUTES = %w{ created_at updated_at }.freeze
  NORMALIZED_ASSOCIATION_ATTRIBUTES = {
    attributes: DATE_ATTRIBUTES,
    associations: {
      'permission' => {
        attributes: DATE_ATTRIBUTES,
        associations: {}
      },
      'table' => {
        attributes: DATE_ATTRIBUTES,
        associations: {}
      }
    }
  }.freeze

  NEW_ATTRIBUTES = {
    attributes: [],
    associations: {
      'table' => {
        attributes: [],
        associations: {
          'permission' => {
            attributes: [],
            associations: {
              'owner' => {
                attributes: ['email', 'quota_in_bytes', 'db_size_in_bytes', 'public_visualization_count',
                             'all_visualization_count', 'table_count'],
                associations: {}
              }
            }
          }
        }
      },
      'permission' => {
        attributes: [],
        associations: {
          'owner' => {
            attributes: ['email', 'quota_in_bytes', 'db_size_in_bytes', 'public_visualization_count',
                         'all_visualization_count', 'table_count'],
            associations: {}
          }
        }
      }
    }
  }.freeze

  BBOX_GEOM = '{"type":"MultiPolygon","coordinates":[[[[-75.234375,54.57206166],[4.921875,54.36775852],[7.03125,-0.35156029],[-71.71875,1.75753681],[-75.234375,54.57206166]]]]}'.freeze
  OUTSIDE_BBOX_GEOM = '{"type":"MultiPolygon","coordinates":[[[[-149.4140625,79.74993208],[-139.921875,79.74993208],[-136.0546875,78.13449318],[-148.7109375,78.06198919],[-149.4140625,79.74993208]]]]}'.freeze

  describe 'static_map' do
    include_context 'visualization creation helpers'
    include_context 'users helper'

    before(:all) do
      Carto::NamedMaps::Api.any_instance.stubs(get: nil, create: true, update: true)

      @user_1 = FactoryGirl.create(:valid_user, private_tables_enabled: false)
      @table1 = create_random_table(@user_1)

      @headers = { 'CONTENT_TYPE' => 'application/json' }
      host! "#{@user_1.subdomain}.localhost.lan"
    end

    after(:all) do
      @user_1.destroy
    end

    it 'tests with non-existing cdn config, which uses maps_api_template url' 


    it 'tests with existing cdn config' 


    it 'tests privacy of static_maps calls' 


    it 'tests varnish keys' 


  end

  describe 'index' do
    include_context 'visualization creation helpers'
    include_context 'users helper'

    before(:all) do
      Carto::NamedMaps::Api.any_instance.stubs(get: nil, create: true, update: true)

      @user_1 = FactoryGirl.create(:valid_user)
    end

    before(:each) do
      login(@user_1)
      @headers = { 'CONTENT_TYPE' => 'application/json' }
      host! "#{@user_1.subdomain}.localhost.lan"
    end

    after(:each) do
      delete_user_data @user_1
    end

    after(:all) do
      @user_1.destroy
    end

    def compare_with_dates(a, b)
      # Compares two hashes, ignoring differences in timezones
      a.keys.sort.should eq b.keys.sort
      a.each do |k, v|
        v2 = b[k]
        if k.ends_with?('_at')
          # DateTime.parse(v).should eq DateTime.parse(v2) unless v.blank? && v2.blank?
        elsif v.is_a?(Hash)
          compare_with_dates(v, v2)
        else
          v.should eq v2
        end
      end
    end

    it 'returns success, empty response for empty user' 


    it 'returns valid information for a user with one table' 


    it 'returns liked count' 


    it 'does a partial match search' 


    describe 'performance with many tables' do
      # The bigger the number the better the improvement, but test gets too slow
      VIZS_N = 20

      before(:all) do
        @visualizations = (1..VIZS_N).map { FactoryGirl.create(:carto_user_table_with_canonical, user_id: @user_1.id) }
      end

      LIST_NAMES_PARAMS = {
        type: CartoDB::Visualization::Member::TYPE_CANONICAL,
        order: :updated_at,
        page: 1,
        per_page: 3000,
        exclude_shared: false,
        exclude_raster: true
      }.freeze

      NO_FETCHING_PARAMS = {
        show_likes: false,
        show_liked: false,
        show_stats: false,
        show_table: false,
        show_permission: false,
        show_synchronization: false,
        show_uses_builder_features: false,
        show_auth_tokens: false,
        load_totals: false
      }.freeze

      it 'should improve with reduced fetching (see #12058)' 

    end

  end

  describe 'main behaviour' do
    before(:all) do
      CartoDB::Varnish.any_instance.stubs(:send_command).returns(true)

      Carto::NamedMaps::Api.any_instance.stubs(get: nil, create: true, update: true)

      @user_1 = FactoryGirl.create(:valid_user)
      @carto_user1 = Carto::User.find(@user_1.id)
      @user_2 = FactoryGirl.create(:valid_user, private_maps_enabled: true)
      @carto_user2 = Carto::User.find(@user_2.id)
      @api_key = @user_1.api_key
    end

    before(:each) do
      begin
        delete_user_data @user_1
      rescue => exception
        # Silence named maps problems only here upon data cleaning, not in specs
        raise unless exception.class.to_s == 'CartoDB::NamedMapsWrapper::HTTPResponseError'
      end

      @headers = {
        'CONTENT_TYPE' => 'application/json'
      }
      host! "#{@user_1.username}.localhost.lan"
    end

    after(:all) do
      @user_1.destroy
      @user_2.destroy
      @feature_flag.destroy
    end

    it 'tests exclude_shared and only_shared filters' 


    context 'visualization likes endpoints' do
      before(:each) do
        @map, @table, @table_visualization, @map_visualization = create_full_visualization(@carto_user1, visualization_attributes: { version: nil, privacy: Carto::Visualization::PRIVACY_PUBLIC })
        @vis = FactoryGirl.create(:carto_visualization, user: @carto_user1)
        @user_domain = @carto_user1.username
        @user_domain2 = @carto_user2.username
      end

      after(:each) do
        destroy_full_visualization(@map, @table, @table_visualization, @map_visualization)
      end

      describe 'GET likes_count' do
        it 'returns the number of likes for a given visualization' 

      end

      describe 'GET likes_list' do
        it 'returns the likes for a given visualization' 

      end

      describe 'GET is_liked' do
        it 'return true when a given user liked a visualization, false otherwise' 

      end

      describe 'POST add_like' do
        it 'triggers error 403 if not authenticated' 


        it 'add likes to a given visualization' 


        it 'returns an error if you try to like twice a visualization' 


        it 'sends an email to the owner when a map is liked' 


        it 'does not send an email when a map is liked by the owner' 


        it 'sends an email to the owner when a dataset is liked' 


        it 'does not send an email when when a dataset is liked by the owner' 

      end

      describe 'POST remove_like' do
        it 'triggers error 403 if not authenticated' 


        it 'removes a like from a given visualization and returns the number of likes' 


        it 'does not returns error if you try to remove a non-existent like' 

      end
    end


    describe 'tests visualization likes endpoints in organizations' do
      include_context 'organization with users helper'

      describe 'PUT notify_watching' do
        it 'adds the user to the watching list' 


        it 'returns 403 if user does not have read permissions on the visualization' 

      end

      describe 'GET list_watching' do
        it 'returns the users currently on the watching list' 


        it 'returns 403 if user does not have read permissions on the visualization' 

      end

      it 'tests totals calculations' 


    end

    describe 'index endpoint' do

      it 'tests normal users authenticated and unauthenticated calls' 


      it 'tests organization users authenticated and unauthenticated calls' 

    end

    describe 'GET /api/v1/viz' do
      before(:each) do
        bypass_named_maps
        delete_user_data(@user_1)
      end

      it 'retrieves a collection of visualizations' 


      it 'is updated after creating a visualization' 


      it 'is updated after deleting a visualization' 


      it 'paginates results' 


      it 'returns filtered results' 


      it 'creates a visualization from a list of tables' 


    end

    describe 'GET /api/v1/viz/:id' do
      before(:each) do
        @carto_user1.private_maps_enabled = true
        @carto_user1.save

        bypass_named_maps
        delete_user_data(@user_1)
        @map, @table, @table_visualization, @visualization = create_full_builder_vis(@carto_user1,
                                                                                     visualization_attributes:
                                                                                       {
                                                                                         tags: ['foo'],
                                                                                         description: 'dull desc'
                                                                                       })
      end

      after(:each) do
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      end

      it 'returns a visualization' 


      it 'returns a specific error for password-protected visualizations and required, public information' 


      it 'doesn\'t return a specific error for private visualizations' 


      it 'returns a visualization with optional information if requested' 


      it 'returns related_canonical_visualizations if requested' 


      it 'returns private related_canonical_visualizations for users that can see it' 


      it 'returns private information about the user if requested' 


      # This is a contrast to the anonymous use case. A public endpoint shouldn't hit the user DB to avoid
      # workers locks if user DB is under heavy load. Nevertheless, the private one can (and needs).
      describe 'user db connectivity issues' do
        before(:each) do
          @actual_database_name = @visualization.user.database_name
          @visualization.user.update_attribute(:database_name, 'wadus')
        end

        after(:each) do
          @visualization.user.update_attribute(:database_name, @actual_database_name)
        end

        it 'needs connection to the user db if the viewer is the owner' 

      end

      describe 'to anonymous users' do
        it 'returns a 403 on private visualizations' 


        describe 'publically accessible visualizations' do
          before(:each) do
            @visualization.privacy = Carto::Visualization::PRIVACY_LINK
            @visualization.save!
          end

          it 'returns 403 for unpublished visualizations' 


          it 'returns 403 for unpublished and password protected visualizations' 


          describe 'published visualizations' do
            before(:each) do
              @visualization.create_mapcap!
              @visualization.published?.should eq true
            end

            it 'only returns public information' 


            it 'only returns public information, including optional if requested' 


            it 'not only returns public information for authenticated requests' 


            it 'returns auth_tokens for password protected visualizations if correct password is provided' 


            it 'returns auth_tokens for password protected visualizations if requested by the owner' 


            it 'returns public information about the user if requested' 


            it 'returns related_canonical_visualizations if requested' 


            it 'doesn\'t return private related_canonical_visualizations' 


            describe 'user db connectivity issues' do
              before(:each) do
                @actual_database_name = @visualization.user.database_name
                @visualization.user.update_attribute(:database_name, 'wadus')
              end

              after(:each) do
                @visualization.user.update_attribute(:database_name, @actual_database_name)
              end

              it 'does not need connection to the user db if viewer is anonymous' 

            end
          end
        end
      end
    end

    # Specific tests for vizjson 3. Common are at `vizjson_shared_examples`
    describe '#vizjson3' do
      include Fixtures::Layers::Infowindows
      include Fixtures::Layers::Tooltips
      include Carto::Factories::Visualizations

      include_context 'visualization creation helpers'

      def get_vizjson3_url(user, visualization)
        args = { user_domain: user.username, id: visualization.id, api_key: user.api_key }
        api_v3_visualizations_vizjson_url(args)
      end

      def first_layer_definition_from_response(response)
        index = response.body[:layers].index { |l| l[:options] && l[:options][:layer_definition] }
        response.body[:layers][index][:options][:layer_definition]
      end

      def first_layer_named_map_from_response(response)
        index = response.body[:layers].index { |l| l[:options] && l[:options][:named_map] }
        response.body[:layers][index][:options][:named_map]
      end

      def first_data_layer_from_response(response)
        index = response.body[:layers].index { |l| l[:type] == 'CartoDB' }
        response.body[:layers][index]
      end

      let(:infowindow) do
        FactoryGirl.build_stubbed(:carto_layer_with_infowindow).infowindow
      end

      let(:tooltip) do
        FactoryGirl.build_stubbed(:carto_layer_with_tooltip).tooltip
      end

      before(:each) do
        @map, @table, @table_visualization, @visualization = create_full_visualization(Carto::User.find(@user_1.id))

        @table.privacy = UserTable::PRIVACY_PUBLIC
        @table.save
        layer = @visualization.data_layers.first
        layer.infowindow = infowindow
        layer.tooltip = tooltip
        layer.options[:table_name] = @table.name
        layer.options[:query] = "select * from #{@table.name}"
        layer.save
      end

      after(:each) do
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      end

      describe 'layer templates' do
        describe 'anonymous maps' do
          before(:each) do
            @table.privacy = UserTable::PRIVACY_PUBLIC
            @table.save
          end

          it 'uses v3 infowindows and tooltips templates removing "table/views/" from template_name' 

        end

        describe 'named maps' do
          before(:each) do
            @user_1.private_tables_enabled = true
            @user_1.save
            @table.user.reload
            @table.privacy = UserTable::PRIVACY_PRIVATE
            @table.save!
          end

          it 'uses v3 infowindows templates at named maps removing "table/views/" from template_name' 

        end
      end

      describe 'layer custom infowindows and tooltips' do
        before(:each) do
          layer = @visualization.data_layers.first
          layer.infowindow = custom_infowindow
          layer.tooltip = custom_tooltip
          layer.save
        end

        describe 'anonymous maps' do
          before(:each) do
            @table.privacy = UserTable::PRIVACY_PUBLIC
            @table.save
          end

          it 'uses v3 infowindows and tooltips templates' 

        end

        describe 'named maps' do
          before(:each) do
            @user_1.private_tables_enabled = true
            @user_1.save
            @table.user.reload
            @table.privacy = UserTable::PRIVACY_PRIVATE
            @table.save
          end

          it 'uses v3 infowindows templates at named maps' 

        end
      end

      it 'returns a vizjson with empty widgets array for visualizations without widgets' 


      it 'returns visualization widgets' 


      it 'returns datasource' 


      it 'returns datasource.template_name for visualizations with retrieve_named_map? true' 


      it 'returns nil datasource.template_name for visualizations with retrieve_named_map? false' 

    end

    describe 'tests visualization listing filters' do
      before(:each) do
        bypass_named_maps
        delete_user_data(@user_1)
      end

      it 'uses locked filter' 


      it 'searches by tag' 


    end

    describe 'non existent visualization' do
      it 'returns 404' 

    end

    describe '/api/v1/viz/:id/watching' do
      before(:all) do
        @user_1_1 = create_test_user
        @user_1_2 = create_test_user

        organization = test_organization.save

        user_org = CartoDB::UserOrganization.new(organization.id, @user_1_1.id)
        user_org.promote_user_to_admin
        @user_1_1.reload

        @user_1_2.organization_id = organization.id
        @user_1_2.save.reload
      end

      it 'returns an empty array if no other user is watching' 

    end

    describe 'legacy controller migration' do
      before(:all) do
        @user = create_user
      end

      after(:all) do
        bypass_named_maps
        @user.destroy
      end

      before(:each) do
        bypass_named_maps
        # bypass_metrics

        host! "#{@user.username}.localhost.lan"
      end

      after(:each) do
        bypass_named_maps
        delete_user_data @user
      end

      describe '#create' do
        describe '#duplicate map' do
          before(:all) do
            @other_user = create_user
          end

          before(:each) do
            bypass_named_maps

            @map = Map.create(user_id: @user.id)
            @visualization = FactoryGirl.create(:derived_visualization,
                                                map_id: @map.id,
                                                user_id: @user.id,
                                                privacy: Visualization::Member::PRIVACY_PRIVATE)
          end

          after(:each) do
            @map.destroy
          end

          after(:all) do
            @other_user.destroy
          end

          it 'duplicates a map' 


          it 'registers table dependencies for duplicated maps' 


          it "duplicates someone else's map if has at least read permission to it" 


          it "doesn't duplicate someone else's map without permission" 

        end

        describe 'map creation from datasets' do
          include_context 'organization with users helper'
          include TableSharing

          it 'creates a visualization from a dataset given the viz id' 


          it 'does not create visualizations if user is viewer' 


          it 'creates a visualization from a dataset given the table id' 


          it 'correctly creates a visualization from two dataset of different users' 


          describe 'builder and editor behaviour' do
            before(:all) do
              @old_builder_enabled = @org_user_1.builder_enabled
            end

            after(:all) do
              @org_user_1.builder_enabled = @old_builder_enabled
              @org_user_1.save
            end

            describe 'for editor users' do
              before(:all) do
                @org_user_1.builder_enabled = false
                @org_user_1.save
              end

              it 'copies the styles' 


              it 'doesn\'t add style properties' 

            end

            describe 'for builder users' do
              before(:all) do
                @org_user_1.builder_enabled = true
                @org_user_1.save
              end

              it 'resets the styles' 


              it 'adds style properties' 

            end
          end

          it 'rewrites queries for other user datasets' 


          it 'does not rewrite queries for same user datasets' 


          it 'sets table privacy if the user has private_maps' 


          it 'sets PUBLIC privacy if the user doesn\'t have private_maps' 


          it 'enables scrollwheel zoom by default' 

        end
      end

      describe "#update" do
        before(:each) do
          login(@user)
        end

        it "Does not update visualizations if user is viewer" 


        it "Updates changes even if named maps communication fails" 


        it 'filters attributes' 


        it "renames datasets" 


        it 'sets password protection' 


        it 'migrates visualizations to v3' 

      end
    end

    describe '#destroy' do
      include_context 'organization with users helper'
      include TableSharing

      def destroy_url(user, vis_id)
        api_v1_visualizations_destroy_url(id: vis_id, user_domain: user.username, api_key: user.api_key)
      end

      it 'returns 404 for nonexisting visualizations' 


      it 'returns 404 for not-accesible visualizations' 


      it 'returns 403 for not-owned visualizations' 


      it 'returns 403 for viewer users' 


      it 'destroys a visualization by id' 


      it 'destroys a visualization by name' 


      it 'destroys a visualization and all of its dependencies (fully dependent)' 


      it 'destroys a visualization and affected layers (partially dependent)' 

    end
  end

  describe 'index' do
    include_context 'visualization creation helpers'

    before(:all) do
      @headers = {'CONTENT_TYPE'  => 'application/json'}
    end

    before(:each) do
      @user = FactoryGirl.create(:valid_user)
      login(@user)
    end

    after(:each) do
      @user.destroy
    end

    it 'orders remotes by size with external sources size' 


    it 'mixed types search should filter only remote without display name' 


    it 'validates order param' 

  end

  describe 'index' do
    include_context 'organization with users helper'
    include_context 'visualization creation helpers'

    describe 'shared_only' do
      it 'should not display nor count the shared visualizations you own' 

    end

    it 'returns auth tokens for password protected viz for the owner but not for users that have them shared' 

  end

  describe 'visualization url generation' do
    include_context 'visualization creation helpers'
    include_context 'organization with users helper'

    before(:all) do
      @user = FactoryGirl.create(:valid_user)
    end

    after(:all) do
      @user.destroy
    end

    it 'generates a user table visualization url' 


    it 'generates a user map url' 


    it 'generates a org user table visualization url' 


    it 'generates a organization user map url' 

  end

  describe 'filter canonical viz by bounding box' do
    include_context 'visualization creation helpers'

    before(:all) do
      bypass_named_maps
      @user = FactoryGirl.create(:valid_user)

      @table_inside_bbox = create_geometry_table(@user, BBOX_GEOM)
      @table_outside_bbox = create_geometry_table(@user, OUTSIDE_BBOX_GEOM)
    end

    after(:all) do
      @user.destroy
    end

    it 'should show return only visualizations that intersect with the bbox' 


    it 'should return 400 when try to filter by bbox and not canonical visualizations' 


    it 'should return 400 when try to filter by bbox and with more than only canonical visualizations' 


    it 'should return 400 when try to filter by bbox with less than 4 coordinates' 


    it 'should return 400 when try to filter by bbox with wrong typed coordinates' 


  end

  # See #5591
  describe 'error with wrong visualization url' do
    def url(user_domain, visualization_id, api_key, host = @host)
      api_v1_visualizations_show_url(user_domain: user_domain, id: visualization_id, api_key: api_key).
        gsub('www.example.com', host)
    end

    describe 'normal user urls' do
      before(:all) do
        bypass_named_maps
        @vis_owner = FactoryGirl.create(:valid_user, private_tables_enabled: true)
        @other_user = FactoryGirl.create(:valid_user, private_tables_enabled: true)

        @table = create_random_table(@vis_owner, unique_name('viz'), UserTable::PRIVACY_PRIVATE)
        @vis = @table.table_visualization
        @vis.private?.should == true

        @host = "#{@vis_owner.username}.localhost.lan"

        @headers = http_json_headers
      end

      after(:all) do
        @table.destroy
      end

      it 'returns 200 with owner user_domain' 


      it 'returns 404 if visualization does not exist' 


      it 'returns 403 under other user domain if visualization is private' 


      it 'returns 403 if visualization is private' 


      it 'returns 200 if user at url is empty' 


      it 'returns 404 if user at url does not match visualization owner' 


      it 'returns 404 if user subdomain does not match visualization owner' 

    end

    describe 'organization urls' do
      include_context 'organization with users helper'

      before(:each) do
        bypass_named_maps

        @vis_owner = @org_user_1
        @shared_vis = FactoryGirl.build(:derived_visualization,
                                        user_id: @vis_owner.id,
                                        name: unique_name('viz'),
                                        description: 'wadus desc',
                                        privacy: CartoDB::Visualization::Member::PRIVACY_PRIVATE).store
        @shared_user = @org_user_2
        @not_shared_user = @org_user_owner
        share_visualization(@shared_vis, @shared_user)

        @host = "#{@vis_owner.organization.name}.localhost.lan"

        @headers = http_json_headers
      end

      after(:each) do
        @shared_vis.delete
      end

      it 'returns 200 with owner user_domain' 


      it 'returns 200 with valid (shared user) user_domain' 


      it 'returns 200 with valid shared user (current_user) user_domain, with current_viewer being the owner' 


      it 'returns 200 and private info with valid shared user user_domain' 


      it 'returns 404 if visualization does not exist' 


      it 'returns 403 if visualization is not shared with the domain user' 


      it 'returns 403 if visualization is not shared with the apikey user' 


      it 'returns 404 if user at url is empty' 


      it 'returns 404 if user at url is empty, current_user is the owner and current_viewer has permission' 


      it 'returns 404 if user at url does not match visualization owner' 


      it 'returns 404 if user at url does not match visualization owner with current_user being the owner and current_viewer the shared to' 

    end
  end

  describe '#google_maps_static_image' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
      base_layer = @visualization.base_layers.first
      base_layer.options[:baseType] = 'roadmap'
      base_layer.options[:style] = '[]'
      base_layer.save
    end

    before(:each) do
      host! "#{@user.username}.localhost.lan"
      login_as(@user, scope: @user.username)
    end

    after(:all) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      @user.destroy
    end

    let(:params) do
      {
        size: '300x200',
        zoom: 14,
        center: '0.12,-7.56'
      }
    end

    it 'returns error if user does not have Google configured' 


    it 'returns signed google maps URL (key)' 


    it 'returns signed google maps URL (client + signature)' 

  end

  include Rack::Test::Methods
  include Warden::Test::Helpers
  include CacheHelper

  private

  # Custom hash comparison, since in the ActiveModel-based controllers
  # we allow some differences:
  # - x to many associations can return [] instead of nil
  def normalize_hash(h, normalized_attributes = NORMALIZED_ASSOCIATION_ATTRIBUTES)
    h.each { |k, v|
      h[k] = nil if v == []
      h[k] = '' if normalized_attributes[:attributes].include?(k)
      if normalized_attributes[:associations].keys.include?(k)
        normalize_hash(v, normalized_attributes[:associations][k])
      end
    }
  end

  # INFO: this test uses comparison against old data structures to check validity.
  # You can use this method to remove that new data so next comparisons will work.
  def remove_data_only_in_new_controllers(visualization_hash, new_attributes = NEW_ATTRIBUTES)
    visualization_hash.each { |k, v|
      if new_attributes[:attributes].include?(k)
        removed = visualization_hash.delete(k)
      elsif new_attributes[:associations].include?(k)
        remove_data_only_in_new_controllers(v, new_attributes[:associations][k])
      end
    }
  end

  def login(user)
    login_as(user, {scope: user.username })
    host! "#{user.username}.localhost.lan"
  end

  def base_url
    '/api/v1/viz'
  end

  def response_body(params = nil)
    get base_url, params.nil? ? nil : params.dup, @headers
    last_response.status.should == 200
    body = JSON.parse(last_response.body)
    body['visualizations'] = body['visualizations'].map { |v| normalize_hash(v) }.map { |v| remove_data_only_in_new_controllers(v) }
    body
  end

  def factory(user, attributes={})
    visualization_template(user, attributes)
  end

  def table_factory(options={})
    create_table_with_options(@user_1, @headers, options)
  end

  def api_visualization_creation(user, headers, additional_fields = {})
    post api_v1_visualizations_create_url(user_domain: user.username, api_key: user.api_key), factory(user).merge(additional_fields).to_json, headers
    id = JSON.parse(last_response.body).fetch('id')
    id.should_not be_nil
    CartoDB::Visualization::Member.new(id: id).fetch
  end

  def test_organization
    organization = Organization.new
    organization.name = unique_name('org')
    organization.quota_in_bytes = 1234567890
    organization.seats = 5
    organization.builder_enabled = false
    organization
  end

  def create_geometry_table(user, the_geom)
    table = new_table(privacy: UserTable::PRIVACY_PUBLIC, user_id: user.id)
    table.force_schema = "the_geom geometry"
    table.the_geom_type = "point"
    table.save.reload
    table.insert_row!(the_geom: the_geom)
    table.update_bounding_box
    table
  end

end

