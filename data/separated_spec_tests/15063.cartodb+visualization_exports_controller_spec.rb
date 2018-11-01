# encoding: utf-8
require 'spec_helper_min'
require_dependency 'carto/uuidhelper'
require 'factories/carto_visualizations'
require 'support/helpers'
require 'helpers/metrics_helper'

describe Carto::Api::VisualizationExportsController, type: :controller do
  include Carto::UUIDHelper
  include Carto::Factories::Visualizations
  include HelperMethods
  include MetricsHelper

  def create_visualization_export_url(user = nil)
    visualization_exports_url(user_domain: user ? user.username : nil, api_key: user ? user.api_key : nil)
  end

  before(:each) do
    bypass_metrics
  end

  describe 'normal users' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user, private_maps_enabled: true)
      @user2 = FactoryGirl.create(:carto_user, private_maps_enabled: true)
    end

    after(:all) do
      # This avoids connection leaking.
      ::User[@user.id].destroy
      ::User[@user2.id].destroy
    end

    describe '#create' do

      before(:each) do
        bypass_named_maps
        @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
        carto_layer = @visualization.layers.find { |l| l.kind == 'carto' }
        carto_layer.options[:user_name] = @user.username
        carto_layer.save
      end

      after(:each) do
        destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      end

      it 'returns 404 for nonexisting visualizations' 


      it 'returns 403 for non accessible visualizations' 


      it 'returns 403 for non accessible visualizations (private and protected) for anonymous users' 


      it 'returns 422 if user_tables_ids param contains user table ids not related to the visualization' 


      it 'returns 422 if visualization type is `table`' 


      it 'enqueues a job and returns the id' 


      it 'enqueues a job and returns the id for anonymous, valid exports' 

    end

    describe '#show' do
      before(:all) do
        bypass_named_maps
        @visualization = FactoryGirl.create(:carto_visualization, user: @user)
        @export = FactoryGirl.create(:visualization_export, visualization: @visualization, user: @user)
        @anonymous_export = FactoryGirl.create(:visualization_export, visualization: @visualization, user: nil)
      end

      after(:all) do
        @export.destroy
        @visualization.destroy
      end

      def export_url(visualization_export_id, user = nil)
        visualization_export_url(
          user_domain: user ? user.username : nil,
          api_key: user ? user.api_key : nil,
          id: visualization_export_id
        )
      end

      it 'returns 404 for nonexisting exports' 


      it 'returns 403 for exports from other user' 


      it 'returns the visualization export' 


      it 'returns the visualization export for anonymous exports' 

    end

    describe '#download' do
      before(:all) do
        bypass_named_maps
        @visualization = FactoryGirl.create(:carto_visualization, user: @user)
        @export = FactoryGirl.create(:visualization_export, visualization: @visualization, user: @user)
        @anonymous_export = FactoryGirl.create(:visualization_export, visualization: @visualization, user: nil)
      end

      after(:all) do
        @export.destroy
        @visualization.destroy
      end

      def download_url(visualization_export_id, user = nil)
        visualization_export_download_url(
          user_domain: user ? user.username : nil,
          api_key: user ? user.api_key : nil,
          visualization_export_id: visualization_export_id
        )
      end

      it 'returns 404 for nonexisting exports' 


      it 'returns 403 for exports from other user' 


      it 'downloads the visualization export' 

    end
  end

  describe 'shared visualizations' do
    include_context 'visualization creation helpers'
    include_context 'organization with users helper'

    it 'allows exporting a private map shared with a user' 

  end
end

