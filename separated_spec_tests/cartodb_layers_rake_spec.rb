require 'spec_helper_min'
require 'rake'
require 'factories/carto_visualizations'

describe 'layers.rake' do
  include Carto::Factories::Visualizations

  before(:all) do
    Rake.application.rake_require "tasks/layers"
    Rake::Task.define_task(:environment)
  end

  describe '#sync_basemaps_from_app_config' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user, private_maps_enabled: true)
    end

    before(:each) do
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
    end

    after(:each) do
      Rake::Task['carto:db:sync_basemaps_from_app_config'].reenable
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
    end

    after(:all) do
      ::User[@user.id].destroy
    end

    it 'updates single layers' 


    it 'updates sandwiched layers' 


    it 'updates mapcaps' 


    describe 'for viewer users' do
      before(:each) do
        @user.viewer = true
        @user.save
      end

      after(:each) do
        @user.viewer = false
        @user.save
      end

      it 'updates layers for viewer users' 

    end

    it 'doesn\'t touch unknown layers' 


    it 'doesn\'t touch non-tiled layers' 

  end
end

