# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/overlays_controller'
require_relative '../../../../spec/requests/api/json/overlays_controller_shared_examples'

describe Carto::Api::OverlaysController do

  it_behaves_like 'overlays controllers' do
  end

  before(:all) do
    @user = create_user
    @api_key = @user.api_key

    @user2 = create_user

    host! "#{@user.username}.localhost.lan"
  end

  before(:each) do
    bypass_named_maps
    delete_user_data @user
    @table = create_table user_id: @user.id
  end

  after(:all) do
    bypass_named_maps
    @user.destroy
  end

  let(:params) { { api_key: @user.api_key, visualization_id: @table.table_visualization.id } }

  FAKE_UUID = UUIDTools::UUID.random_create

  describe '#index' do
    it 'lists all overlays' 


    it 'returns 401 when accessing other users overlays' 


    it 'returns 404 when accessing non-existing visualization' 

  end

  describe '#show' do
    it 'gets the details of an overlay' 


    it 'returns 401 when accessing other users overlays' 


    it 'returns 404 when accessing non-existing overlay' 

  end

  describe '#create' do
    it 'creates an overlay' 


    it 'fails to create two overlays of the same unique type' 


    it 'returns 401 when creating overlays in other users viz' 


    it 'returns 404 when creating overlays in non-existent viz' 

  end

  describe '#update' do
    it 'updates an overlay' 


    it 'fails to update two overlays of the same unique type' 


    it 'returns 401 when updating overlays from another user' 


    it 'returns 404 when updating non-existing overlay' 

  end

  describe '#delete' do
    it 'deletes an overlay' 


    it 'returns 401 when deleting overlays from another user' 


    it 'returns 404 when deleting non-existent overlays' 

  end
end

