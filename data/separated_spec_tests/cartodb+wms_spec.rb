# encoding: utf-8
require_relative '../../proxy'

include CartoDB::WMS

describe Proxy do
  before do
    @endpoint     = 'http://basemap.nationalmap.gov' +
                    '/arcgis/services/USGSImageryTopo/MapServer/WMSServer'
    @query_params = '?service=WMS&request=GetCapabilities'
    @url          = @endpoint + @query_params
    @fixture_xml  = File.expand_path('../../fixtures/wms.xml', __FILE__)
    @xml          = File.read(@fixture_xml)
  end

  describe '#initialize' do
    it 'takes a URL for the service capabilities' 


    it 'accepts an optional preloaded response' 

  end

  describe '#serialize' do
    it 'returns a hash representation of the WMS capabilities' 

  end

  describe '#run' do
    it 'will not touch the preloaded response if passed at initialization' 

  end

  describe '#server' do
    it 'returns the HTTP/HTTPS entry point for the services' 

  end

  describe '#layers' do
    it 'returns available layers' 

  end

  describe '#formats' do
    it 'returns the supported formats' 

  end
end # Proxy


