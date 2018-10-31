require_relative '../../../spec_helper'

describe Carto::Builder::DatasetsController do
  include Warden::Test::Helpers

  describe '#show' do
    before(:all) do
      CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
      bypass_named_maps
      @user = FactoryGirl.build(:valid_user, builder_enabled: true).save
      @table = FactoryGirl.create(:carto_user_table, :full, user_id: @user.id, map: @map)
      @map = @table.map
      @visualization = @table.table_visualization
    end

    before(:each) do
      login(@user)
    end

    after(:all) do
      @visualization.destroy
      @table.destroy
      @map.destroy
      CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
      @user.destroy
      @feature_flag.destroy
    end

    it 'redirects to public view non-builder users requests' 


    it 'returns 404 for non-existent visualizations' 


    it 'redirects to public view for visualizations not writable by user' 


    it 'returns visualization' 


    it 'does not show derived visualizations' 


    it 'does not show raster visualizations' 


    it 'does not include google maps if not configured' 


    it 'includes the google maps client id if configured' 


    it 'does not include google maps if the map does not need it' 

  end
end

