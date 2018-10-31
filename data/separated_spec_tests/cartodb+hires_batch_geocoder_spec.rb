# encoding: utf-8
require 'tmpdir'
require 'fileutils'
require_relative '../../../spec/rspec_configuration.rb'
require_relative '../../../spec/spec_helper.rb'
require_relative '../lib/hires_batch_geocoder'


describe CartoDB::HiresBatchGeocoder do

  RSpec.configure do |config|
    config.before :each do
      Typhoeus::Expectation.clear
    end
  end

  before(:each) do
    @log = mock
    @log.stubs(:append)
    @log.stubs(:append_and_store)
    @working_dir = Dir.mktmpdir
    @input_csv_file = path_to '../../table-geocoder/spec/fixtures/nokia_input.csv'
    CartoDB::HiresBatchGeocoder.any_instance.stubs(:config).returns({
        'base_url' => 'batch.example.com',
        'app_id' => '',
        'token' => '',
        'mailto' => ''
      })
    @geocoding_model = FactoryGirl.create(:geocoding, kind: 'high-resolution', formatter: '{street}' )
    @batch_geocoder = CartoDB::HiresBatchGeocoder.new(@input_csv_file, @working_dir, @log, @geocoding_model)
  end

  after(:each) do
    FileUtils.rm_f @working_dir
  end

  describe '#run' do
    it 'uploads a file to the batch server' 


    it 'times out if not finished before the DEFAULT_TIMEOUT' 

  end

  describe '#upload' do
    it 'uploads a file to the batch service' 


    it 'raises an exception if the api returns != 200' 


    it 'raises an exception if the api does not return a RequestId' 


  end

  describe '#cancel' do
    it 'sends a cancel put request and gets the status, processed and total rows' 

  end

  describe '#update' do
    it 'gets the status, processed and total rows by sending a get request' 

  end

  describe '#result' do
    it "raises an exception if there's no request_id from a previous upload" 


    it 'downloads the result file from the remote server' 


    it 'raises an exception if cannot get a result file' 

  end


  def path_to(filepath = '')
    File.expand_path(
      File.join(File.dirname(__FILE__), "../fixtures/#{filepath}")
      )
  end

  def mock_complete_response(state='completed')
    @geocoding_model.remote_id = 'dummy_id'
    @geocoding_model.save.reload
    url = @batch_geocoder.send(:api_url, {action: 'status'})
    xml_response_body = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
                          <ns2:SearchBatch xmlns:ns2="http://www.navteq.com/lbsp/Search-Batch/1">
                            <Response>
                              <MetaInfo>
                                <RequestId>dummy_id</RequestId>
                              </MetaInfo>
                              <Status>'+state+'</Status>
                              <JobStarted>2016-04-08T08:24:05.000Z</JobStarted>
                              <JobFinished>2016-04-08T08:24:39.000Z</JobFinished>
                              <TotalCount>1</TotalCount>
                              <ValidCount>1</ValidCount>
                              <InvalidCount>0</InvalidCount>
                              <ProcessedCount>1</ProcessedCount>
                              <PendingCount>0</PendingCount>
                              <SuccessCount>1</SuccessCount>
                              <ErrorCount>0</ErrorCount>
                            </Response>
                          </ns2:SearchBatch>'
    response = Typhoeus::Response.new(code: 200, body: xml_response_body)
    Typhoeus.stub(url, method: :get).and_return(response)
  end

end

