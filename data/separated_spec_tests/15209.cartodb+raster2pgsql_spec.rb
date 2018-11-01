# encoding: utf-8
require 'pg'
require 'sequel'
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/raster2pgsql'
require_relative '../../../../spec/helpers/file_server_helper'

include CartoDB::Importer2

describe Raster2Pgsql do

  describe '#check for downsample' do
    it 'should return true for downsample because the band type is Int16' 

    it 'should return false for downsample because the band type is Byte' 

  end

  def path_to(filepath)
    File.expand_path(
      File.join(File.dirname(__FILE__), "../fixtures/#{filepath}")
    )
  end
end


