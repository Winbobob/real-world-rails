# encoding: utf-8
require_relative '../../../spec/spec_helper'
require_relative '../../../spec/rspec_configuration.rb'
require_relative '../lib/hires_batch_geocoder'

# TODO rename to hires_batch_geocoder_spec.rb or split into batch/non-batch

describe CartoDB::HiresBatchGeocoder do

  before(:each) do
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    CartoDB::HiresBatchGeocoder.any_instance.stubs(:config).returns({
        'base_url' => 'http://wadus.nokia.com',
        'app_id' => '',
        'token' => '',
        'mailto' => ''
      })
    @working_dir = Dir.mktmpdir
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', formatter: '{street}',
                                          remote_id: 'wadus')
  end

  after(:each) do
    FileUtils.remove_entry_secure @working_dir
  end

  describe '#upload' do
    it 'returns rec_id on success' 


    it 'raises error on failure' 

  end

  describe '#update_status' do
    before {
      stub_api_request(200, 'response_status.xml')
      CartoDB::HiresBatchGeocoder.any_instance.stubs(:request_id).returns('wadus')
    }
    let(:geocoder) { CartoDB::HiresBatchGeocoder.new('/tmp/dummy_input_file.csv', @working_dir, @log, @geocoding_model) }

    it "updates status" 

    it "updates processed rows" 

    it "updates total rows" 

  end

  describe '#result' do
    it "saves result file on working directory" 

  end

  describe '#cancel' do
    before {
      stub_api_request(200, 'response_cancel.xml')
      @geocoding_model.remote_id = 'wadus'
      @geocoding_model.save
      CartoDB::HiresBatchGeocoder.any_instance.stubs(:request_id).returns('wadus')
    }
    let(:geocoder) { CartoDB::HiresBatchGeocoder.new('dummy_input_file.csv', @working_dir, @log, @geocoding_model) }

    it "updates the status" 

  end

  describe '#extract_response_field' do
    let(:geocoder) { CartoDB::HiresBatchGeocoder.new('dummy_input.csv', @working_dir, @log, @geocoding_model) }
    let(:response) { File.open(path_to('response_example.xml')).read }

    it 'returns specified element value' 


    it 'returns nil for missing elements' 

  end

  describe '#api_url' do
    # TODO move to common place for both geocoders
    before(:each) {
      CartoDB::HiresBatchGeocoder.any_instance.stubs(:config).returns({
        'base_url' => '',
        'app_id' => 'a',
        'token' => 'b',
        'mailto' => 'c'
        })
      @geocoder =  CartoDB::HiresBatchGeocoder.new('dummy_input.csv', @working_dir, @log, @geocoding_model)
    }

    it 'returns base url by default' 


    it 'allows for api method specification' 


    it 'allows for api attributes specification' 

  end

  describe '#geocode_text' do
    it 'returns lat/lon on success' 

  end

  describe '#used_batch_request?' do
    it 'returns true if sent a request to hi-res batch api' 


    it 'returns false if sent the request was non-batched' 

  end

  def path_to(filepath)
    File.expand_path(
      File.join(File.dirname(__FILE__), "../spec/fixtures/#{filepath}")
    )
  end #path_to

  def stub_api_request(code, response_file)
    response = File.open(path_to(response_file)).read
    Typhoeus.stub(/.*nokia.com/).and_return(
      Typhoeus::Response.new(code: code, body: response)
    )
  end
end # CartoDB::Geocoder

