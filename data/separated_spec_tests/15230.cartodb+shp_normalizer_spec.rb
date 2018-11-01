# encoding: utf-8

require 'fileutils'
require_relative '../../lib/importer/shp_normalizer'
require_relative '../doubles/job'
require_relative '../../../../spec/rspec_configuration.rb'

include CartoDB::Importer2::Doubles

describe CartoDB::Importer2::ShpNormalizer do

  describe '#shape_encoding' do
    before(:each) do
      CartoDB.stubs(:python_bin_path).returns(`which python`.strip)
    end

    it 'guesses UTF-8 encoding for USA counties common data unzipped with cpg file' 


    it 'guesses LATIN1 encoding for a "greek", unsupported encoding' 


  end

end

