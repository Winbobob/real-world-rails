require 'spec_helper_min'
require 'mock_redis'
require 'carto/api/vizjson3_presenter'
require 'carto/api/vizjson_presenter'

describe Carto::Api::VizJSON3Presenter do
  include Carto::Factories::Visualizations
  include_context 'visualization creation helpers'

  before(:all) do
    @user1 = FactoryGirl.create(:carto_user, private_tables_enabled: true)
  end

  after(:all) do
    @user1.destroy
  end

  let(:redis_mock) do
    MockRedis.new
  end

  shared_context 'full visualization' do
    before(:all) do
      bypass_named_maps
      @map, @table, @table_visualization, @visualization = create_full_visualization(Carto::User.find(@user1.id))
      @table.update_attribute(:privacy, Carto::UserTable::PRIVACY_PUBLIC)
    end

    after(:all) do
      destroy_full_visualization(@map, @table, @table_visualization, @visualization)
    end

    let(:viewer_user) { @visualization.user }
  end

  describe 'caching' do
    include_context 'full visualization'

    let(:fake_vizjson) { { fake: 'sure!', layers: [] } }

    it 'to_vizjson uses the redis vizjson cache' 


    it 'every call to_vizjson uses calculate_vizjson if no cache is provided' 


    it 'to_vizjson is not overriden by v2 caching or to_named_map_vizjson' 


    it 'to_vizjson does not override v2 caching or named map vizjson' 


    it 'to_named_map_vizjson uses the redis vizjson cache' 

  end

  describe '#to_vizjson (without caching)' do
    include_context 'full visualization'

    it 'returns map bounds' 


    it 'returns nil map bounds if map bounds are not set' 

  end

  describe '#to_named_map_vizjson' do
    include_context 'full visualization'

    it 'generates the vizjson of visualizations that have not named map as if they had' 


    it 'includes analyses information without including sources parameters' 


    it 'allows whitespace layer names' 


    it 'includes source at layers options' 


    it 'includes cartocss at layers options' 

  end

  describe 'analyses' do
    include_context 'full visualization'

    it 'sends `source` at layer options instead of sql if source is set for named maps' 

  end

  describe 'anonymous_vizjson' do
    include_context 'full visualization'

    it 'v3 should include sql_wrap' 

  end

  describe 'layers' do
    include_context 'full visualization'

    before(:all) do
      @data_layer = @map.data_layers.first
      @data_layer.options[:attribution] = 'CARTO attribution'
      @data_layer.save

      @torque_layer = FactoryGirl.create(:carto_layer, kind: 'torque', maps: [@map])
      @torque_layer.options[:table_name] = 'wadus'
      @torque_layer.save

      @visualization.reload
    end

    shared_examples 'common layer checks' do
      it 'should not include layergroup layers' 


      it 'should not include namedmap layers' 


      it 'should have exactly three layers: tiled, CartoDB and torque' 


      it 'should include attribution for all layers' 


      it 'should not include named map options in any layer' 


      it 'should not include interactivity in any layer' 


      it 'should not include infowindow nor tooltip in basemaps' 


      it 'should not include order in any layer' 


      it 'should include layer_name in options for data layers' 


      it 'should not include Odyssey options' 

    end

    describe 'in namedmap vizjson' do
      let(:vizjson) do
        Carto::Api::VizJSON3Presenter.new(@visualization, viewer_user)
                                     .send(:calculate_vizjson, forced_privacy_version: :force_named)
      end

      include_examples 'common layer checks'

      it 'should not include sql field in data layers' 


      it 'should include cartocss but not sql in torque layers' 

    end

    describe 'in anonymous vizjson' do
      let(:vizjson) do
        Carto::Api::VizJSON3Presenter.new(@visualization, viewer_user)
                                     .send(:calculate_vizjson, forced_privacy_version: :force_anonymous)
      end

      include_examples 'common layer checks'

      it 'should include sql and cartocss fields in data layers' 


      it 'should include sql and cartocss fields in torque layers' 

    end

    describe 'overlays' do
      include_context 'full visualization'

      def vizjson
        Carto::Api::VizJSON3Presenter.new(@visualization, viewer_user)
                                     .send(:calculate_vizjson, forced_privacy_version: :force_anonymous)
      end

      it 'enables map layer_selector option if there is a layer_selector overlay' 


      it 'removes layer selector overlay ' 

    end
  end
end

