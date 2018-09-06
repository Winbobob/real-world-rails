require 'spec_helper_min'
require 'carto/mapcapped_visualization_updater'

module Carto
  describe MapcappedVisualizationUpdater do
    include Factories::Visualizations
    include MapcappedVisualizationUpdater

    before(:all) do
      @user = FactoryGirl.create(:carto_user)
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
    end

    after(:all) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
      @user.destroy
    end

    it 'updates a non-mapcapped visualization' 


    it 'updates a mapcapped visualization' 

  end
end

