# encoding: utf-8
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../doubles/importer_stats'
require_relative '../doubles/loader'
require_relative '../doubles/log'
require_relative '../doubles/indexer'
require_relative '../factories/pg_connection'
require_relative '../doubles/downloader'
require_relative '../doubles/loader'
require_relative '../doubles/user'
require_relative '../doubles/input_file_size_limit'
require_relative '../doubles/table_row_count_limit'

require 'tempfile'

describe CartoDB::Importer2::Runner do
  before(:all) do
    @filepath = Tempfile.open('runner_spec')
    @filepath.write('...')
    @filepath.close
    @user = create_user
    @user.save
    @pg_options = @user.db_service.db_configuration_for

    @fake_log = CartoDB::Importer2::Doubles::Log.new(@user)
    @downloader = CartoDB::Importer2::Downloader.new(@user.id, @filepath.path)
    @fake_multiple_downloader_2 = CartoDB::Importer2::Doubles::MultipleDownloaderFake.instance(2)
  end

  before(:each) do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
  end

  after(:all) do
    @filepath.close!
    @user.destroy
  end

  describe '#initialize' do
    it 'requires postgres options and a downloader object' 

  end

  describe '#run' do
    it 'calls import for each file to process' 


    it 'logs the file path to be imported' 

  end

  describe '#tracker' do
    it 'returns the block passed at initialization' 

  end

  describe '#import' do
    it 'creates a sucessful result if all import steps completed' 


    it 'creates a failed result if an exception raised during import' 


    it 'checks the platform limits regarding file size' 

  end


  describe 'stats logger' do

    before(:each) do
      @importer_stats_spy = CartoDB::Doubles::Stats::Importer.instance
    end

    it 'logs total import time' 


    it 'does not fail if loader does not support logging' 


    it 'logs single resource import flow time' 


    it 'logs multiple subresource import times' 


    it 'logs multiple subresource import flow times' 

  end

  def spy_runner_importer_stats(runner, importer_stats_spy)
    runner.instance_eval {
      @importer_stats = importer_stats_spy
    }
  end

  def fake_loader_for(job, source_file)
    OpenStruct.new(
      job:                job,
      source_file:        source_file,
      source_files:       [source_file],
      valid_table_names:  []
    )
  end

  def fake_unpacker
    Class.new {
      def initialize
        @sourcefile = CartoDB::Importer2::SourceFile.new('/var/tmp/foo.txt')
      end
      def run(*args)
      end

      def source_files
        [@sourcefile]
      end

      def clean_up
      end
    }.new
  end

end

