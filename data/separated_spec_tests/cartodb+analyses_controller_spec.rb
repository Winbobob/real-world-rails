require 'spec_helper_min'
require 'support/helpers'
require 'factories/carto_visualizations'
require_dependency 'carto/uuidhelper'

describe Carto::Api::AnalysesController do
  include Carto::Factories::Visualizations
  include HelperMethods

  before(:all) do
    FactoryGirl.create(:carto_feature_flag, name: 'editor-3', restricted: false)
    @user = FactoryGirl.create(:carto_user, builder_enabled: true)
    @user2 = FactoryGirl.create(:carto_user, builder_enabled: true)
    @map, @table, @table_visualization, @visualization = create_full_visualization(@user)
    bypass_named_maps
    @analysis = FactoryGirl.create(:source_analysis, visualization_id: @visualization.id, user_id: @user.id)
  end

  after(:all) do
    Carto::FeatureFlag.destroy_all
    destroy_full_visualization(@map, @table, @table_visualization, @visualization)
    # This avoids connection leaking.
    ::User[@user.id].destroy
    ::User[@user2.id].destroy
    @analysis.destroy
  end

  def viz_analysis_url(user, visualization, analysis_id)
    analysis_url(
      user_domain: user.username,
      api_key: user.api_key,
      visualization_id: visualization.id,
      id: analysis_id)
  end

  def clean_analysis_definition(analysis_definition)
    # Remove options[:style_history] from all nested nodes for comparison
    definition_node = Carto::AnalysisNode.new(analysis_definition.deep_symbolize_keys)
    definition_node.descendants.each do |n|
      n.definition[:options].delete(:style_history) if n.definition[:options].present?
      n.definition.delete(:options) if n.definition[:options] == {}
    end

    definition_node.definition
  end

  describe '#show' do
    it 'returns 403 if user does not own the visualization' 


    def verify_analysis_response_body(response_body, analysis)
      response_body[:id].should eq analysis.id
      analysis_definition = response_body[:analysis_definition]
      clean_analysis_definition(analysis_definition).should eq clean_analysis_definition(analysis.analysis_definition)
      analysis_definition[:id].should eq analysis.natural_id
    end

    it 'returns existing analysis by uuid' 


    it 'returns 404 for nonexisting analysis' 


    it 'returns existing analysis by json first id' 


    it 'returns existing analysis by json first id with uuid ids' 

  end

  let(:natural_id) { 'a1' }

  let(:payload) { { analysis_definition: { id: natural_id } } }

  describe '#create' do
    def create_analysis_url(user, visualization)
      analyses_url(
        user_domain: user.username,
        api_key: user.api_key,
        visualization_id: visualization.id)
    end

    it 'creates new analysis' 


    it 'registers table dependencies when creating analysis' 


    it 'overrides old analysis in the same visualization if they have the same natural id' 


    it 'returns 422 if payload visualization or user id do not match with url' 


    it 'returns 422 if payload is not valid json' 


    it 'returns 422 if payload is empty json' 


    it 'returns 422 if analysis definition is not valid json' 


    it 'returns 422 if analysis_definition is empty json' 


    it 'returns 403 if user does not own the visualization' 

  end

  describe '#update' do
    let(:new_natural_id) { "#{natural_id}_2" }

    let(:new_key) { :whatever }

    let(:new_payload) do
      payload.delete(:id)
      payload.merge(whatever: 'really?')
      payload[:analysis_definition][:id] = new_natural_id
      payload[:analysis_definition][new_key] = 'really'
      payload
    end

    it 'updates existing analysis' 


    it 'registers table dependencies when updating existing analysis' 


    it 'returns 422 if payload visualization_id or id do not match' 


    it 'returns 403 if user does not own the visualization' 


    it 'returns 422 if payload is not valid json' 


    it 'returns 422 if payload is empty json' 


    it 'returns 422 if analysis definition is not valid json' 


    it 'returns 422 if analysis_definition is empty json' 

  end

  describe '#destroy' do
    it 'destroys existing analysis' 


    it 'registers table dependencies when destroying existing analysis' 


    it 'returns 403 if user does not own the visualization' 

  end

  describe '#LayerNodeStyle cache' do
    before(:all) do
      @styled_analysis = FactoryGirl.create(:analysis_point_in_polygon, visualization_id: @visualization.id, user_id: @user.id)
      @layer_id = @visualization.data_layers.first.id
    end

    before(:each) do
      @styled_analysis.analysis_node.descendants.map(&:id).each do |node_id|
        Carto::LayerNodeStyle.create(
          layer_id: @layer_id,
          source_id: node_id,
          options: {
            tile_style: 'wadus'
          },
          infowindow: {},
          tooltip: {}
        )
      end
    end

    after(:each) do
      Carto::LayerNodeStyle.where(layer_id: @layer_id).delete_all
    end

    it '#show returns tile styles' 


    it '#show returns tile styles for torque layers' 


    it '#update invalidates the affected node' 


    it '#update invalidates the affected node and its parent' 


    it '#update does not invalidate upon options change' 


    it '#update does not invalidate upon children node_id change' 

  end
end

