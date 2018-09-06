# encoding: utf-8
require 'fileutils'
require_relative '../../lib/importer/shp_helper'
require_relative '../../lib/importer/exceptions'
require_relative '../../../../spec/rspec_configuration.rb'

include CartoDB::Importer2

describe CartoDB::Importer2::ShpHelper do
  describe '#row_count' do
    it 'return total of rows correctly' 


    it 'verify correct shp file has prj, shx and dbf files in the same folder' 


    it 'verify return exception if shp file doesnt has shx or dbf file in the same folder' 


    it 'verify return exception if shp file doesnt has prj file in the same folder' 


  end

end

