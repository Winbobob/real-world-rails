# encoding: utf-8
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

# Unp includes reference to gpx_splitter
require_relative '../../lib/importer/unp'

describe CartoDB::Importer2::GpxSplitter do
  before do
    @one_layer_filepath       = path_to('one_layer.gpx')
    @multiple_layer_filepath  = path_to('multiple_layer.gpx')
    @temporary_directory      = '/var/tmp'
    @ogr2ogr_config = {}
  end

  describe '#run' do
    it 'splits a multilayer GPX into single-layer GPX' 


    it 'splits a single-layer GPX into multiple-layer GPX' 

  end

  describe '#layers_in' do
    it 'returns all layers name in the file' 

  end

  def path_to(filepath)
    File.expand_path(
      File.join(File.dirname(__FILE__), "../fixtures/#{filepath}")
    )
  end
end

