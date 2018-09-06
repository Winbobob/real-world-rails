# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../lib/importer/raster2pgsql'
require_relative '../../lib/importer/downloader'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../../../spec/spec_helper'
require_relative '../doubles/log'
require_relative 'cdb_importer_context'
require_relative 'acceptance_helpers'
require_relative 'no_stats_context'
require 'active_support'

include CartoDB::Importer2

describe 'raster2pgsql acceptance tests' do
  include AcceptanceHelpers
  include_context "cdb_importer schema"
  include_context "no stats"

  before(:all) do
    @table_name = 'raster_test'
    @filepath = File.expand_path(File.join(File.dirname(__FILE__), "../fixtures/raster_simple.tif"))
    @user = create_user
    @user.save
  end

  after(:all) do
    @user.destroy
  end

  # TODO: TempFile for other tests who operate with the file


  it 'tests extracting size from a tif' 


  it 'tests calculating overviews' 


  it 'tests calculating raster scale' 


  it 'if there are some problem while importing should clean the temporary tables' 


  it 'keeps the original table unaltered regardless of overviews' 

end

