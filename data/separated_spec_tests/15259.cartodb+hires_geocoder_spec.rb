# encoding: utf-8
require 'tmpdir'
require 'fileutils'
require 'csv'
require_relative '../../../spec/rspec_configuration'
require_relative '../../../spec/spec_helper'
require_relative '../lib/hires_geocoder'


describe CartoDB::HiresGeocoder do

  MOCK_COORDINATES = [38.89037, -77.03196]

  RSpec.configure do |config|
    config.before :each do
      Typhoeus::Expectation.clear
    end
  end

  before(:each) do
    @working_dir = Dir.mktmpdir
    @input_csv_file = path_to '../../table-geocoder/spec/fixtures/nokia_input.csv'
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    CartoDB::HiresGeocoder.any_instance.stubs(:config).returns({
        'non_batch_base_url' => 'batch.example.com',
        'app_id' => '',
        'token' => '',
        'mailto' => ''
      })
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', formatter: '{street}')
    @geocoder = CartoDB::HiresGeocoder.new(@input_csv_file, @working_dir, @log, @geocoding_model)
  end

  after(:each) do
    FileUtils.rm_f @working_dir
  end

  describe '#run' do
    it 'takes every row from input and calls geocode_text on them' 

  end

  describe '#process_row' do
    it 'increments the number of processed rows by one when called' 


    it 'adds a row with the expected format when success' 


    it 'does not add any row when it when geolocation fails' 


  end

  describe '#geocode_text' do
    it 'sends a request to the non-batched geocoder service and gets a couple of coordinates' 


    it "returns nil coordinates if the http request doesn't succeed" 


    it 'returns nil coordinates and log a trace if it is not able to parse the response' 


    it 'returns nil coordinates and stops there if the response does not contain any location' 

  end

  def path_to(filepath = '')
    File.expand_path(
      File.join(File.dirname(__FILE__), "../fixtures/#{filepath}")
      )
  end

end

