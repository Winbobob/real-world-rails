require "spec_helper"

describe ContentServer do

  before(:all) do
    @old_val = Rails.configuration.asset_host
    Rails.configuration.asset_host = 'http://c1.org'
  end

  after(:all) do
    Rails.configuration.asset_host = @old_val
  end

  describe '.cache_path' do

    it 'should use CONTENT_SERVER_CONTENT_PATH by default' 


    it 'should allow a content host to be specified' 


  end

  describe '.cache_url_to_path' do

    it 'should split up the weird number we pass in' 


  end

  it 'should know a good default blank image ("/assets/blank.gif")' 


  describe '.uploaded_content_url' do

    it 'should return blank url if url is empty' 


    it 'should add the extension' 


    it 'should handle the url with #cache_url_to_path' 


    it 'should start with the content server' 


    it 'should include the CONTENT_SERVER_CONTENT_PATH' 


  end

  describe '.upload_content' do

    let(:ip) { '123.45.67.8' }

    before do
      allow(EOL::Server).to receive(:ip_address) { ip }
      allow(ContentServer).to receive(:call_file_upload_api_with_parameters)
    end

    it 'gets ip from EOL::Server' 


    # TODO - this spec sucks; it's brittle. That suggests refactoring is needed.
    it 'adds a port to ip' 


    # TODO - this spec sucks; it's brittle. That suggests refactoring is needed.
    it 'does NOT add a port to ip if one is there' 


    it 'encodes the path' 


    # TODO - Yeah, this also suggests refactoring needed. Config files, anyone?!  :|
    it 'calls a long crappy method with long crappy hard-coded args' 


  end

  describe '.upload_resource' do

    let(:xml) { '<xml><tags/></xml>' }
    let(:hash) { { "response" => { "status" => 'validated' } } }

    before do
      allow(ContentServer).to receive(:call_api_with_parameters) { xml }
      allow(Hash).to receive(:from_xml) { hash }
      allow(ResourceStatus).to receive(:validation_failed) { 'failed' }
      allow(ResourceStatus).to receive(:validated) { 'validated' }
      allow(EOL).to receive(:log)
    end

    it 'returns nil without file url' 


    it 'returns nil without resource id' 


    # TODO - this probably shouldn't be hard-coded this way.
    it 'calls the API with hard-coded params' 


    it 'finds and return a resource status based on response' 


    # NOTE that this does not test the params of the error log. I didn't care enough, would be ugly.
    it 'creates an error log if the status is not validated' 


    it 'returns the error if there was one in response' 


    context "response only has an error" do

      before do
        allow(Hash).to receive(:from_xml) { { "response" => { "error" => "bad" } } }
      end

      subject { ContentServer.upload_resource('hello', 'friend') }

      it 'returns validation_failed' 


      it 'logs an error' 


      # NOTE - I added this. It was returning nil before, and not using the error at all. Lame?
      it 'returns the error' 


    end

    it 'returns validation failure (with nil error) if response is empty' 


  end

  describe '.update_data_object_crop' do

    let(:env) { "whatever" }

    # TODO - BAD SMELLS ABOUND.
    before do
      allow(Rails).to receive(:env) { env }
      allow(env).to receive(:staging_dev?) { false }
      allow(env).to receive(:bocce_demo_dev?) { false }
      allow(ContentServer).to receive(:call_file_upload_api_with_parameters)
    end

    it 'returns nil if any arg is blank' 


    context 'reasonable args' do

      subject { ContentServer.update_data_object_crop(123654, 23, 45, 67) }

      it 'builds expected params' 


      it 'changes staging_dev to staging' 


      it 'changes bocce_demo_dev to bocce_demo' 


    end

  end

  describe ".upload_data_search_file" do

    before do
      allow(Rails.configuration).to receive(:local_services)
      allow(ContentServer).to receive(:call_file_upload_api_with_parameters)
    end

    it 'returns nil if args blank' 


    it 'returns the first arg if local_services enabled' 


    it 'calls upload api with hard-coded stuff' 


  end

end

