# encoding: utf-8

require_relative '../../../spec_helper_min'

describe Carto::Admin::MobileAppsController do
  include Warden::Test::Helpers

  TEST_UUID = '00000000-0000-0000-0000-000000000000'.freeze
  MOBILE_APP = {
    id:           TEST_UUID,
    name:         'app_name',
    description:  'Description of the app',
    icon_url:     'http://icon.png',
    platform:     'android',
    app_id:       'com.app.id',
    app_type:     'open'
  }.freeze

  before(:all) do
    @carto_user = FactoryGirl.create(:carto_user, mobile_max_open_users: 10000)
    @user = ::User[@carto_user.id]
  end

  after(:all) do
    @user.destroy
  end

  around(:each) do |example|
    Cartodb.with_config(cartodb_central_api: {}, &example)
  end

  describe '#index' do
    it 'loads apps from Central' 


    it 'requires login' 


    it 'returns 404 if Central disabled' 

  end

  describe '#show' do
    it 'loads app from Central' 


    it 'requires login' 


    it 'returns 404 if Central disabled' 

  end

  describe '#create' do
    let(:create_app) { MOBILE_APP.slice(:name, :description, :icon_url, :platform, :app_id, :app_type) }

    it 'creates app in Central' 


    it 'validates app before sending to Central' 


    it 'requires login' 


    it 'returns 404 if Central disabled' 

  end

  describe '#update' do
    let(:update_app) { MOBILE_APP.slice(:name, :description, :icon_url, :app_type) }

    it 'updates app in Central' 


    it 'validates app before sending to Central' 


    it 'requires login' 


    it 'returns 404 if Central disabled' 

  end

  describe '#destroy' do
    it 'deletes app in Central' 


    it 'requires login' 


    it 'returns 404 if Central disabled' 

  end
end

