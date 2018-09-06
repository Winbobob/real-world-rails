# encoding: utf-8
require_relative '../../../lib/importer/url_translator/osm2'

include CartoDB::Importer2

describe UrlTranslator::OSM2 do
  describe '#translate' do
    it 'returns a translated OSM2 url' 


    it 'returns a translated OSM2 url after Feb2014 url format changes' 



    it 'returns the url if already translated' 


    it 'returns the url if not supported' 

  end #translate

  describe '#bounding_box_for' do
    it 'returns a bouding box from a OSM2 url' 

  end #bounding_box_for

  describe '#supported?' do
    it 'returns true if URL is from OSM2' 

  end #supported?

  describe '#translated?' do
    it 'returns true if URL already translated' 

  end #translated?
end # UrlTranslator::OSM2


