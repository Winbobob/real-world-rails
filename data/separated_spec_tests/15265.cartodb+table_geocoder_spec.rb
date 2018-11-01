# encoding: utf-8
require 'open3'
require_relative '../lib/table_geocoder'
require_relative 'factories/pg_connection'
require 'set'
require_relative '../../../spec/rspec_configuration'
require_relative '../../../spec/spec_helper'

describe CartoDB::TableGeocoder do
  let(:default_params) {{
    app_id: '',
    token: '',
    mailto: '',
    usage_metrics: mock('usage_metrics')
    }}
  before do
    conn          = CartoDB::Importer2::Factories::PGConnection.new
    @db           = conn.connection
    @pg_options   = conn.pg_options
    @table_name   = "ne_10m_populated_places_simple_#{rand.to_s[2..11]}"
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', 
                                          formatter: '{street}', remote_id: 'dummy_request_id')

    # Avoid issues on some machines if postgres system account can't read fixtures subfolder for the COPY
    filename = 'populated_places_short.csv'
    _stdout, stderr, _status = Open3.capture3("cp #{path_to(filename)} /tmp/#{filename}")
    raise if stderr != ''
    load_csv "/tmp/#{filename}"
  end

  after do
    @db.drop_table @table_name
  end

  describe '#run' do
    before do
      # TODO: Note the coupling of the geocoder object and the metrics
      success_rows = 10
      empty_rows = 3
      failed_rows = 4
      total = success_rows + empty_rows + failed_rows
      default_params[:usage_metrics].expects(:incr).with(:geocoder_here, :success_responses, success_rows)
      default_params[:usage_metrics].expects(:incr).with(:geocoder_here, :empty_responses, empty_rows)
      default_params[:usage_metrics].expects(:incr).with(:geocoder_here, :failed_responses, failed_rows)
      default_params[:usage_metrics].expects(:incr).with(:geocoder_here, :total_requests, total)

      @tg = CartoDB::TableGeocoder.new(default_params.merge(table_name: @table_name,
                                                            qualified_table_name: @table_name,
                                                            sequel_qualified_table_name: @table_name,
                                                            formatter:  "name, ', ', iso3",
                                                            connection: @db,
                                                            log: @log,
                                                            geocoding_model: @geocoding_model,
                                                            max_rows: 1000))
      geocoder = mock
      geocoder.stubs(:upload).returns(true)
      geocoder.stubs(:request_id).returns('dummy_request_id')
      geocoder.stubs(:run).returns(true)
      geocoder.stubs(:status).returns('foo')

      # TODO: Note the coupling of the geocoder object and the metrics
      geocoder.stubs(:successful_processed_rows).returns(success_rows)
      geocoder.stubs(:empty_processed_rows).returns(empty_rows)
      geocoder.stubs(:failed_processed_rows).returns(failed_rows)

      @tg.stubs(:geocoder).returns(geocoder)
      @tg.stubs(:cache_disabled?).returns(true)
      @tg.run
    end

    it "generates a csv file for uploading" 


    it "assigns a remote_id" 


    it "holds a db connection with the specified statement timeout" 

  end

  describe '#generate_csv' do
    before do
      @tg = CartoDB::TableGeocoder.new(default_params.merge(table_name: @table_name,
                                                            qualified_table_name: @table_name,
                                                            sequel_qualified_table_name: @table_name,
                                                            formatter:  "name, ', ', iso3",
                                                            connection: @db,
                                                            log: @log,
                                                            geocoding_model: @geocoding_model,
                                                            max_rows: 1000))
      @tg.send(:ensure_georef_status_colummn_valid)
    end

    it "generates a csv file with the correct format" 


    it "honors max_rows" 

  end

  describe '#download_results' do
    it 'gets the geocoder results' 

  end

  describe '#deflate_results' do
    it 'does not raise an error if no results file' 


    it 'extracts nokia result files' 

  end

  describe '#create_temp_table' do
    it 'raises error if no remote_id' 


    it 'creates a temporary table' 

  end

  describe '#import_results_to_temp_table' do
    before do
      @tg = CartoDB::TableGeocoder.new(table_name: 'a',
                                       connection: @db,
                                       log: @log,
                                       geocoding_model: @geocoding_model,
                                       remote_id: 'temp_table', schema: 'public', max_rows: 1000, usage_metrics: nil)
      @tg.send(:create_temp_table)
    end

    after do
      @tg.send(:drop_temp_table)
    end

    it 'loads the Nokia output format to an existing temp table' 

  end

  describe '#ensure_georef_status_colummn_valid' do
    before do
      table_name = 'wwwwww'
      @db.run("create table #{table_name} (id integer)")
      @tg = CartoDB::TableGeocoder.new(table_name: 'wwwwww',
                                       qualified_table_name: table_name,
                                       sequel_qualified_table_name: table_name,
                                       connection: @db,
                                       remote_id: 'wadus',
                                       max_rows: 1000,
                                       log: @log,
                                       geocoding_model: @geocoding_model,
                                       usage_metrics: nil)
    end

    after do
      @db.run("drop table wwwwww")
    end

    it 'adds a boolean cartodb_georef_status column' 


    it 'does nothing when the column already exists' 


    it 'casts cartodb_georef_status to boolean if needed' 

  end

  it "Geocodes a table using the batch geocoder API" 


  def path_to(filepath = '')
    File.expand_path(
      File.join(File.dirname(__FILE__), "../spec/fixtures/#{filepath}")
    )
  end

  def load_csv(path)
    @db.run("CREATE TABLE #{@table_name} (the_geom geometry, cartodb_id integer, name text, iso3 text)")
    @db.run("COPY #{@table_name.lit}(cartodb_id, name, iso3) FROM '#{path}' DELIMITER ',' CSV")
  end
end

