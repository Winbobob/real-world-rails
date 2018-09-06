# encoding: utf-8

require_relative '../../../spec_helper'
require_dependency 'carto/uuidhelper'

include Carto::UUIDHelper

shared_context 'layer hierarchy' do
  before(:all) do
    @user1 = FactoryGirl.create(:valid_user, private_tables_enabled: true, private_maps_enabled: true)
    @user2 = FactoryGirl.create(:valid_user, private_tables_enabled: true)
    @map = FactoryGirl.create(:carto_map_with_layers, user_id: @user1.id)
    @layer = @map.layers.first
    @visualization = FactoryGirl.create(:carto_visualization, map: @map, privacy: Carto::Visualization::PRIVACY_PRIVATE, user_id: @user1.id)
  end

  before(:each) do
    @widget = FactoryGirl.create(:widget, layer: @layer)
  end

  after(:each) do
    Carto::Widget.destroy_all
  end

  after(:all) do
    @visualization.destroy if @visualization
  end

  def response_widget_should_match_widget(response_widget, widget)
    response_widget[:id].should == widget.id
    response_widget[:order].should == widget.order
    response_widget[:type].should == widget.type
    response_widget[:title].should == widget.title
    response_widget[:layer_id].should == widget.layer.id
    response_widget[:options].should == widget.options.symbolize_keys
    response_widget[:style].should == widget.style.symbolize_keys
    if widget.source_id.present?
      response_widget[:source][:id].should eq widget.source_id
    else
      response_widget[:source].should be_nil
    end
  end

  def response_widget_should_match_payload(response_widget, payload)
    response_widget[:layer_id].should == payload[:layer_id]
    response_widget[:type].should == payload[:type]
    response_widget[:title].should == payload[:title]
    response_widget[:options].should == payload[:options].symbolize_keys
    if payload[:style].present?
      response_widget[:style].should == payload[:style].symbolize_keys
    else
      response_widget[:style].blank?.should be_true
    end
    if payload[:source].present?
      response_widget[:source][:id].should == payload[:source][:id]
    else
      response_widget[:source].should be_nil
    end
    if payload[:order].present?
      response_widget[:order].should == payload[:order]
    else
      @visualization.reload
      response_widget[:order].should == @visualization.widgets.count - 1
    end
  end

  def widget_payload(
    layer_id: @layer.id,
    type: 'formula',
    title: 'the title',
    options: { 'a field' => 'first', 'another field' => 'second' },
    order: nil,
    source: { id: 'a0' },
    style: { 'widget_style': { 'fill': 'wadus' } })

    payload = {
      layer_id: layer_id,
      type: type,
      title: title,
      options: options,
      style: style
    }

    payload[:order] = order if order
    payload[:source] = source if source

    payload
  end
end

describe Carto::Api::WidgetsController do
  include_context 'layer hierarchy'

  let(:random_map_id) { UUIDTools::UUID.timestamp_create.to_s }
  let(:random_layer_id) { UUIDTools::UUID.timestamp_create.to_s }
  let(:random_widget_id) { UUIDTools::UUID.timestamp_create.to_s }

  describe '#show' do
    it 'returns 401 for non-authenticated requests' 


    it 'returns 404 for requests without matching map, layer or widget' 


    it 'returns the source widget content' 


    it 'returns options as json' 


    it 'returns 403 if visualization is private and current user is not the owner' 


    it 'returns 403 if visualization is public and current user is not the owner' 

  end

  describe '#create' do
    it 'creates a new widget' 


    it 'creates a new widget with order' 


    it 'creates a new widget without style' 


    it 'creates a new widget with source_id' 


    it 'returns 404 for unknown map id' 


    it 'returns 422 if layer id do not match' 


    it 'returns 422 if payload layer id do not match' 


    it 'returns 422 if layer id do not match map' 


    it 'returns 422 if missing source' 


    it 'returns 403 if visualization is private and current user is not the owner' 


    it 'assigns consecutive orders for widgets for the same visualization' 

  end

  describe '#update' do
    it 'returns 422 if layer id does not match in url and payload' 


    it 'ignores payload id' 


    it 'returns 200 and updates the model' 

  end

  describe '#update_many' do
    it 'updates many' 


    it 'fails with 404 if widget is not found' 


    it 'fails with 404 if widget does not belong to map' 


    it 'fails with 404 if not writable by user' 


    it 'fails if any of the widgets fails and doesn\'t update any' 


    def serialize_widget(w)
      payload = {
        id: w.id,
        layer_id: w.layer_id,
        type: w.type,
        title: w.title,
        options: w.options,
        style: w.style
      }
      payload[:order] = w.order if w.order
      payload[:source] = { id: w.source_id } if w.source_id

      payload
    end
  end

  describe '#delete' do
    it 'returns 200 and deletes the widget' 

  end
end

