# encoding: utf-8

require_relative '../../../spec_helper_min'
require 'support/helpers'
require_relative '../../../../app/controllers/carto/api/maps_controller'

describe Carto::Api::MapsController do
  include Carto::Factories::Visualizations, HelperMethods

  def create_show_map_url(user: @user, map: @map)
    map_url(user_domain: user.subdomain, api_key: user.api_key, id: map.id)
  end

  describe '#update' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @user2 = FactoryGirl.create(:carto_user)
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
    end

    after(:all) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      # This avoids connection leaking.
      ::User[@user.id].destroy
      ::User[@user2.id].destroy
    end

    let(:payload) do
      {
        bounding_box_ne: "[85.0511, 179]",
        bounding_box_sw: "[-85.0511, -179]",
        center: "[28.483177058570757, -82.825927734375]",
        provider: "leaflet",
        view_bounds_ne: "[32.30570601389429, -76.32202148437499]",
        view_bounds_sw: "[24.51713945052515, -89.329833984375]",
        zoom: 7,
        options: {
          dashboard_menu: false,
          legends: true,
          scrollwheel: true,
          layer_selector: true
        }
      }
    end

    it 'updates an existing map' 


    it 'validates on update' 


    it 'invalidates VizJSON upon update' 


    it 'returns 401 for unauthorized user' 


    it 'returns 404 for maps not owned by the user' 


    it 'returns 404 for inexistent map' 


    def create_update_map_url(user, map_id)
      map_url(user_domain: user.username, api_key: user.api_key, id: map_id)
    end

    it 'updates existing map by id' 


    it 'only updates passed parameters' 


    it 'does not update map_id nor user_id' 


    it 'returns 401 for unathorized user' 


    it 'returns 404 for maps not owned by the user' 


    it 'returns 404 for unexisting map' 

  end

  describe '#show' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @user2 = FactoryGirl.create(:carto_user)
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
    end

    after(:all) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      # This avoids connection leaking.
      ::User[@user.id].destroy
      ::User[@user2.id].destroy
    end

    it 'does not invalidate VizJSON upon show' 


    it 'returns an existing map' 


    it 'returns 401 for unauthorized user' 


    it 'returns 404 for maps not owned by the user' 


    it 'returns 404 for inexistent map' 

  end
end

