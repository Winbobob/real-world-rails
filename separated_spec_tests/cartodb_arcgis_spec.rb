# encoding: utf-8

require 'active_support/core_ext'

require_relative '../../lib/datasources'
require_relative '../doubles/user'

include CartoDB::Datasources

describe Url::ArcGIS do

  before(:all) do
    @url = 'http://myserver/arcgis/rest/services/MyFakeService/featurename'
    @invalid_url = 'http://myserver/mysite/rest/myfakefolder/MyFakeService/featurename'
    @user = CartoDB::Datasources::Doubles::User.new
  end

  before(:each) do
    Typhoeus::Expectation.clear
  end

  describe '#set_data_from' do
    it 'tests preparing the correct url from the one given from the UI' 

  end

  describe '#get_resource_metadata' do
    it 'tests error scenarios' 


    it 'tests metadata retrieval' 

  end

  describe '#get_resource' do
    it 'tests the get_ids_list() private method with error scenarios' 


    it 'tests the get_ids_list() private method' 


    it 'tests the get_ids_list() private method on out-of-order ids' 


    it 'tests the get_by_ids() private method with error scenarios' 


    it 'tests the get_by_ids() private method' 


    it 'tests retrieval of data' 

  end
end

