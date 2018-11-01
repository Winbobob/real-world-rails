require 'spec_helper_min'
require 'carto/visualization_invalidation_service'
require 'factories/carto_visualizations'

describe Carto::VisualizationInvalidationService do
  include Carto::Factories::Visualizations

  before(:all) do
    @user = FactoryGirl.create(:carto_user)
  end

  after(:all) do
    @user.destroy
  end

  shared_examples_for 'cache invalidator' do
    it 'should invalidate all caches: redis/varnish vizjson and embed' 

  end

  describe 'on update' do
    before(:each) do
      @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
      @service = Carto::VisualizationInvalidationService.new(@visualization)
    end

    # NOTE: Not destroying the visualizations in an after hook to avoid it triggering the wrong expectations

    it_behaves_like 'cache invalidator'

    describe 'named map invalidation' do
      it 'should create/update named map' 


      it 'should not create/update named map for maps without layers' 


      it 'should not create/update named map for remote visualizations' 

    end

    describe 'affected visualizations invalidation' do
      before(:each) do
        @canonical_service = Carto::VisualizationInvalidationService.new(@table_visualization)
      end

      it 'should not invalidate cache of related maps by default' 


      describe 'should invalidate cache of related maps when description changes' do
        before(:each) do
          @service = @canonical_service
          @table_visualization.description = 'wadus'
          @table_visualization.save

          CartoDB::Visualization::RedisVizjsonCache.any_instance.expects(:invalidate).with(@table_visualization.id)
          CartoDB::Varnish.any_instance.expects(:purge).with(".*#{@table_visualization.id}:vizjson")
          EmbedRedisCache.any_instance.expects(:invalidate).with(@table_visualization.id)
        end

        # Should run all invalidations on the affected map, when invalidating the canonical visualization
        it_behaves_like 'cache invalidator'
      end
    end
  end

  describe 'on destruction' do
    before(:all) do
      @visualization = FactoryGirl.create(:carto_visualization, user: @user)
      @visualization.destroy
      @service = Carto::VisualizationInvalidationService.new(@visualization)
    end

    it_behaves_like 'cache invalidator'

    it 'should destroy named map' 

  end
end
