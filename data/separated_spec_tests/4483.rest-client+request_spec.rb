require_relative './_lib'

describe RestClient::Request, :include_helpers do
  before do
    @request = RestClient::Request.new(:method => :put, :url => 'http://some/resource', :payload => 'payload')

    @uri = double("uri")
    allow(@uri).to receive(:request_uri).and_return('/resource')
    allow(@uri).to receive(:hostname).and_return('some')
    allow(@uri).to receive(:port).and_return(80)

    @net = double("net::http base")
    @http = double("net::http connection")

    allow(Net::HTTP).to receive(:new).and_return(@net)

    allow(@net).to receive(:start).and_yield(@http)
    allow(@net).to receive(:use_ssl=)
    allow(@net).to receive(:verify_mode=)
    allow(@net).to receive(:verify_callback=)
    allow(@net).to receive(:ciphers=)
    allow(@net).to receive(:cert_store=)
    RestClient.log = nil
  end

  it "accept */* mimetype" 


  it "processes a successful result" 


  it "doesn't classify successful requests as failed" 


  describe '.normalize_url' do
    it "adds http:// to the front of resources specified in the syntax example.com/resource" 


    it 'adds http:// to resources containing a colon' 


    it 'does not add http:// to the front of https resources' 


    it 'does not add http:// to the front of capital HTTP resources' 


    it 'does not add http:// to the front of capital HTTPS resources' 


    it 'raises with invalid URI' 

  end

  describe "user - password" do
    it "extracts the username and password when parsing http://user:password@example.com/" 


    it "extracts with escaping the username and password when parsing http://user:password@example.com/" 


    it "doesn't overwrite user and password (which may have already been set by the Resource constructor) if there is no user/password in the url" 


    it 'uses the username and password from the URL' 


    it 'overrides URL user/pass with explicit options' 

  end

  it "correctly formats cookies provided to the constructor" 


  it 'strips out cookies set for a different domain name' 


  it 'assumes default domain and path for cookies set by hash' 


  it 'rejects or warns with contradictory cookie options' 


  it "does not escape or unescape cookies" 


  it "rejects cookie names containing invalid characters" 


  it "rejects cookie values containing invalid characters" 


  it 'warns when overriding existing headers via payload' 


  it "does not warn when overriding user header with header derived from payload if those header values were identical" 


  it 'does not warn for a normal looking payload' 


  it "uses netrc credentials" 


  it "uses credentials in the url in preference to netrc" 


  it "determines the Net::HTTP class to instantiate by the method name" 


  describe "user headers" do
    it "merges user headers with the default headers" 


    it "prefers the user header when the same header exists in the defaults" 


    it "converts user headers to string before calling CGI::unescape which fails on non string values" 

  end

  describe "header symbols" do

    it "converts header symbols from :content_type to 'Content-Type'" 


    it "converts content-type from extension to real content-type" 


    it "converts accept from extension(s) to real content-type(s)" 


    it "only convert symbols in header" 


    it "converts header values to strings" 

  end

  it "executes by constructing the Net::HTTP object, headers, and payload and calling transmit" 


  it "IPv6: executes by constructing the Net::HTTP object, headers, and payload and calling transmit" 


  # TODO: almost none of these tests should actually call transmit, which is
  # part of the private API

  it "transmits the request with Net::HTTP" 


  # TODO: most of these payload tests are historical relics that actually
  # belong in payload_spec.rb. Or we need new tests that actually cover the way
  # that Request#initialize or Request#execute uses the payload.
  describe "payload" do
    it "sends nil payloads" 


    it "passes non-hash payloads straight through" 


    it "converts a hash payload to urlencoded data" 


    it "accepts nested hashes in payload" 

  end

  it "set urlencoded content_type header on hash payloads" 


  describe "credentials" do
    it "sets up the credentials prior to the request" 


    it "does not attempt to send any credentials if user is nil" 


    it "setup credentials when there's a user" 


    it "does not attempt to send credentials if Authorization header is set" 

  end

  it "catches EOFError and shows the more informative ServerBrokeConnection" 


  it "catches OpenSSL::SSL::SSLError and raise it back without more informative message" 


  it "catches Timeout::Error and raise the more informative ReadTimeout" 


  it "catches Errno::ETIMEDOUT and raise the more informative ReadTimeout" 


  it "catches Net::ReadTimeout and raises RestClient's ReadTimeout",
     :if => defined?(Net::ReadTimeout) do
    allow(@http).to receive(:request).and_raise(Net::ReadTimeout)
    expect { @request.send(:transmit, @uri, 'req', nil) }.to raise_error(RestClient::Exceptions::ReadTimeout)
  end

  it "catches Net::OpenTimeout and raises RestClient's OpenTimeout",
     :if => defined?(Net::OpenTimeout) do
    allow(@http).to receive(:request).and_raise(Net::OpenTimeout)
    expect { @request.send(:transmit, @uri, 'req', nil) }.to raise_error(RestClient::Exceptions::OpenTimeout)
  end

  it "uses correct error message for ReadTimeout",
     :if => defined?(Net::ReadTimeout) do
    allow(@http).to receive(:request).and_raise(Net::ReadTimeout)
    expect { @request.send(:transmit, @uri, 'req', nil) }.to raise_error(RestClient::Exceptions::ReadTimeout, 'Timed out reading data from server')
  end

  it "uses correct error message for OpenTimeout",
     :if => defined?(Net::OpenTimeout) do
    allow(@http).to receive(:request).and_raise(Net::OpenTimeout)
    expect { @request.send(:transmit, @uri, 'req', nil) }.to raise_error(RestClient::Exceptions::OpenTimeout, 'Timed out connecting to server')
  end


  it "class method execute wraps constructor" 


  describe "exception" do
    it "raises Unauthorized when the response is 401" 


    it "raises ResourceNotFound when the response is 404" 


    it "raises RequestFailed otherwise" 

  end

  describe "block usage" do
    it "returns what asked to" 

  end

  describe "proxy" do
    before do
      # unstub Net::HTTP creation since we need to test it
      allow(Net::HTTP).to receive(:new).and_call_original

      @proxy_req = RestClient::Request.new(:method => :put, :url => 'http://some/resource', :payload => 'payload')
    end

    it "creates a proxy class if a proxy url is given" 


    it "creates a proxy class with the correct address if a IPv6 proxy url is given" 


    it "creates a non-proxy class if a proxy url is not given" 


    it "disables proxy on a per-request basis" 


    it "sets proxy on a per-request basis" 


    it "overrides proxy from environment", if: RUBY_VERSION >= '2.0' 


    it "overrides global proxy with per-request proxy" 

  end


  describe "logging" do
    it "logs a get request" 


    it "logs a post request with a small payload" 


    it "logs a post request with a large payload" 


    it "logs input headers as a hash" 


    it "logs a response including the status code, content type, and result body size in bytes" 


    it "logs a response with a nil Content-type" 


    it "logs a response with a nil body" 


    it 'does not log request password' 


    it 'logs to a passed logger, if provided' 

  end

  it "strips the charset from the response content type" 


  describe "timeout" do
    it "does not set timeouts if not specified" 


    it 'sets read_timeout' 


    it "sets open_timeout" 


    it 'sets both timeouts with :timeout' 


    it 'supersedes :timeout with open/read_timeout' 



    it "disable timeout by setting it to nil" 


    it 'deprecated: warns when disabling timeout by setting it to -1' 


    it "deprecated: disable timeout by setting it to -1" 

  end

  describe "ssl" do
    it "uses SSL when the URI refers to a https address" 


    it "should default to verifying ssl certificates" 


    it "should have expected values for VERIFY_PEER and VERIFY_NONE" 


    it "should set net.verify_mode to OpenSSL::SSL::VERIFY_NONE if verify_ssl is false" 


    it "should not set net.verify_mode to OpenSSL::SSL::VERIFY_NONE if verify_ssl is true" 


    it "should set net.verify_mode to OpenSSL::SSL::VERIFY_PEER if verify_ssl is true" 


    it "should set net.verify_mode to OpenSSL::SSL::VERIFY_PEER if verify_ssl is not given" 


    it "should set net.verify_mode to the passed value if verify_ssl is an OpenSSL constant" 


    it "should default to not having an ssl_client_cert" 


    it "should set the ssl_version if provided" 


    it "should not set the ssl_version if not provided" 


    it "should set the ssl_ciphers if provided" 


    it "should not set the ssl_ciphers if set to nil" 


    it "should set the ssl_client_cert if provided" 


    it "should not set the ssl_client_cert if it is not provided" 


    it "should default to not having an ssl_client_key" 


    it "should set the ssl_client_key if provided" 


    it "should not set the ssl_client_key if it is not provided" 


    it "should default to not having an ssl_ca_file" 


    it "should set the ssl_ca_file if provided" 


    it "should not set the ssl_ca_file if it is not provided" 


    it "should default to not having an ssl_ca_path" 


    it "should set the ssl_ca_path if provided" 


    it "should not set the ssl_ca_path if it is not provided" 


    it "should set the ssl_cert_store if provided" 


    it "should by default set the ssl_cert_store if no CA info is provided" 


    it "should not set the ssl_cert_store if it is set falsy" 


    it "should not set the ssl_verify_callback by default" 


    it "should set the ssl_verify_callback if passed" 


    # </ssl>
  end

  it "should still return a response object for 204 No Content responses" 


  describe "raw response" do
    it "should read the response into a binary-mode tempfile" 

  end

  describe 'payloads' do
    it 'should accept string payloads' 


    it 'should accept streaming IO payloads' 

  end

  describe 'constructor' do
    it 'should reject valid URIs with no hostname' 


    it 'should reject invalid URIs' 

  end

  describe 'process_url_params' do
    it 'should handle basic URL params' 


    it 'should combine with & when URL params already exist' 


    it 'should handle complex nested URL params per Rack / Rails conventions' 


    it 'should handle ParamsArray objects' 

  end
end

