require_relative '../../../spec_helper'
require_relative '../../../factories/users_helper'

describe Carto::Builder::VisualizationsController do
  include Warden::Test::Helpers

  include_context 'users helper'

  before(:all) do
    @user1.builder_enabled = true
    @user1.save
  end

  describe '#show' do
    before(:each) do
      map = FactoryGirl.create(:map, user_id: @user1.id)
      @visualization = FactoryGirl.create(:carto_visualization, user_id: @user1.id, map_id: map.id)
      login(@user1)
    end

    it 'redirects to embed for non-editor users requests' 


    it 'redirects to editor for vizjson2 visualizations' 


    describe 'v2 -> v3 migration' do
      before(:each) do
        @visualization.version = 2
        @visualization.save
      end

      it 'automatically migrates visualizations' 


      it 'correctly copies queries to analysis nodes' 


      it 'does not automatically migrates visualization with custom overlays' 


      describe 'overlays' do
        it 'enables map layer_selector option if there is a layer_selector overlay' 


        it 'removes layer selector overlays' 

      end
    end

    it 'returns 404 for non-existent visualizations' 


    it 'returns 404 for non-derived visualizations' 


    it 'redirects to embed for visualizations not writable by user' 


    describe 'viewer users' do
      after(:each) do
        if @user1.viewer
          @user1.viewer = false
          @user1.save
        end
      end

      it 'redirected to embed for their visualizations at the builder' 

    end

    it 'returns visualization' 


    it 'does not show raster kind visualizations' 


    it 'does not show slide type visualizations' 


    it 'does not generate vizjson with vector=true with flag (Builder should always be raster right now)' 


    it 'displays analysesData' 


    it 'does not include google maps if not configured' 


    it 'includes the google maps client id if configured' 

  end
end

