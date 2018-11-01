# encoding: utf-8
require 'open3'
require_relative '../../../lib/gme/table_geocoder'
require_relative '../../../../../lib/url_signer'
require_relative '../../../lib/gme/exceptions'
require_relative '../../factories/pg_connection'
require_relative '../../../../../spec/spec_helper.rb'
require_relative '../../../../../spec/rspec_configuration.rb'

describe Carto::Gme::TableGeocoder do
  before(:all) do
    connection_stub = mock
    connection_stub.stubs(:run)
    @usage_metrics_stub = stub
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', formatter: '{street}')

    @mandatory_args = {
      connection: connection_stub,
      original_formatter: '{mock}',
      client_id: 'my_client_id',
      private_key: 'my_private_key',
      usage_metrics: @usage_metrics_stub,
      log: @log,
      geocoding_model: @geocoding_model
    }
  end

  describe '#initialize' do
    it 'returns an object that responds to AbstractTableGeocoder interface' 


    it 'raises an exception if not fed with mandatory arguments' 


    it 'creates a client with the provided credentials' 

  end

  describe '#run' do
    before(:each) do
      Carto::UrlSigner.any_instance.stubs(:sign_url).returns('https://maps.googleapis.com/maps/api/geocode/json')
      @table_geocoder = Carto::Gme::TableGeocoder.new(@mandatory_args)
    end

    it "set's the state to 'processing' when it starts" 


    it "set's the state to 'completed' when it ends" 


    it "if there's an uncontrolled exception, sets the state to 'failed' and raises it" 


    it "processes 1 block at a time, keeping track of processed rows in each block" 


    it "processes empty response" 


    it "processes error rows response" 


    it "processes error with message response" 

  end

  describe '#data_input_blocks' do
    before do
      conn          = CartoDB::Importer2::Factories::PGConnection.new
      @db           = conn.connection
      @pg_options   = conn.pg_options
      @table_name   = "ne_10m_populated_places_simple_#{rand.to_s[2..11]}"

      # Avoid issues on some machines if postgres system account can't read fixtures subfolder for the COPY
      filename = 'populated_places_short.csv'
      _stdout, stderr, _status = Open3.capture3("cp #{path_to(filename)} /tmp/#{filename}")
      raise if stderr != ''
      load_csv "/tmp/#{filename}"

      params = {
        connection: @db,
        table_name: @table_name,
        qualified_table_name: @table_name,
        sequel_qualified_table_name: @table_name,
        original_formatter: "{name}, {iso3}",
        client_id: 'my_client_id',
        private_key: 'my_private_key',
        max_block_size: 4,
        usage_metrics: @usage_metrics_stub,
        log: @log,
        geocoding_model: @geocoding_model
      }

      @table_geocoder = Carto::Gme::TableGeocoder.new(params)
    end

    after do
      @db.drop_table @table_name
    end

    it 'performs (floor(rows / max_block_size) + 1) queries' 

  end

  def path_to(filepath = '')
    File.expand_path(
      File.join(File.dirname(__FILE__), "../../fixtures/#{filepath}")
    )
  end

  def read_fixture_file(filename)
    File.read(path_to(filename))
  end

  def load_csv(path)
    @db.run("CREATE TABLE #{@table_name} (the_geom geometry, cartodb_id integer, name text, iso3 text)")
    @db.run("COPY #{@table_name.lit}(cartodb_id, name, iso3) FROM '#{path}' DELIMITER ',' CSV")
  end
end

