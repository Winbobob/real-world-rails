# encoding: utf-8
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

# Unp includes reference to kml_splitter
require_relative '../../lib/importer/unp'

describe CartoDB::Importer2::KmlSplitter do
  before do
    @one_layer_filepath       = path_to('one_layer.kml')
    @multiple_layer_filepath  = path_to('multiple_layer.kml')
    @temporary_directory      = '/var/tmp'
    @ogr2ogr_config = {}
  end

  describe '#run' do
    it 'splits a multilayer KML into single-layer KML' 

  end

  describe '#layers_in' do
    it 'returns all layers name in the file' 

  end

  def path_to(filepath)
    File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/#{filepath}"))
  end
end

