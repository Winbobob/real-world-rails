# encoding: utf-8

require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

# Unp includes reference to fgdb_splitter
require_relative '../../lib/importer/unp'

describe CartoDB::Importer2::FgdbSplitter do
  before do
    @multiple_layer_filepath  = path_to('filegeodatabase.gdb')
    @temporary_directory      = '/var/tmp'
    @ogr2ogr_config = {}
  end

  describe '#run' do
    it 'splits a multilayer FGDB into single-layer FGDB' 


  end

  describe '#layers_in' do
    it 'returns all layers name in the file' 

  end

  def path_to(filepath)
    File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/#{filepath}"))
  end
end

