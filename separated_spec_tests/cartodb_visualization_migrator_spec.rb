require 'spec_helper_min'
require 'carto/visualization_migrator'

describe Carto::VisualizationMigrator do
  include Carto::Factories::Visualizations
  include_context 'visualization creation helpers'

  class VizMigrator
    include Carto::VisualizationMigrator
  end

  let(:migrator) { VizMigrator.new }

  shared_context 'full visualization' do
    before(:all) do
      @user_1 = FactoryGirl.create(:carto_user, private_tables_enabled: false)
    end

    before(:each) do
      @map, @table, @table_visualization, @visualization = create_full_visualization(Carto::User.find(@user_1.id), visualization_attributes: { version: 3 })
    end

    after(:each) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
    end

    after(:all) do
      @user_1.destroy
    end
  end

  describe '#migrate_visualization_to_v3' do
    include_context 'full visualization'

    it 'migrates layer selector for ActiveRecord model' 


    it 'fixes GMaps options' 


    it 'adds analyses' 

  end
end

