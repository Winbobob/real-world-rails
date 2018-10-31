# encoding: utf-8
require 'ostruct'
require_relative '../../../../spec/spec_helper_min'
require_relative '../../lib/importer/loader'
require_relative '../../lib/importer/source_file'
require_relative '../../lib/importer/exceptions'
require_relative '../doubles/job'
require_relative '../doubles/ogr2ogr'
require_relative '../doubles/georeferencer'
require_relative '../../spec/doubles/importer_stats'

describe CartoDB::Importer2::Loader do
  before do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
    resultset = OpenStruct.new(:first => {:num_rows => 10})
    db = Object.new
    db.stubs(:fetch).returns(resultset)
    @job            = CartoDB::Importer2::Doubles::Job.new(db)
    @source_file    = CartoDB::Importer2::SourceFile.new('/var/tmp/foo')
    @ogr2ogr        = CartoDB::Importer2::Doubles::Ogr2ogr.new
    @georeferencer  = CartoDB::Importer2::Doubles::Georeferencer.new
    @loader         = CartoDB::Importer2::Loader.new(@job, @source_file, layer=nil, @ogr2ogr, @georeferencer)
  end

  before(:each) do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
  end

  describe '#run' do

    it 'logs the database connection options used' 


    it 'runs the ogr2ogr command to load the file' 


    it 'logs the exit code from ogr2ogr' 


    it 'logs any output from ogr2ogr' 


    it 'encoding problem importing but return 0, should try fallback and then raise an error' 

  end

  describe '#ogr2ogr' do

    it 'returns the passed ogr2ogr instance' 


    it 'initializes an ogr2ogr command wrapper if none passed' 


    it 'processes ogr2ogr generic errors' 

  end

  describe 'stats logger' do
    before do
      resultset = OpenStruct.new(:first => {:num_rows => 10})
      db = Object.new
      db.stubs(:fetch).returns(resultset)
      @job            = CartoDB::Importer2::Doubles::Job.new(db)
      @source_file    = CartoDB::Importer2::SourceFile.new('/var/tmp/foo')
      @ogr2ogr        = CartoDB::Importer2::Doubles::Ogr2ogr.new
      @georeferencer  = CartoDB::Importer2::Doubles::Georeferencer.new
      @loader         = CartoDB::Importer2::Loader.new(@job, @source_file, layer=nil, @ogr2ogr, @georeferencer)
      @importer_stats_spy = CartoDB::Doubles::Stats::Importer.instance
    end

    it 'logs stats' 


  end

end


