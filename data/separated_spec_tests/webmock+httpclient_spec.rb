require 'spec_helper'
require 'acceptance/webmock_shared'
require 'ostruct'

require 'acceptance/httpclient/httpclient_spec_helper'

describe "HTTPClient" do
  include HTTPClientSpecHelper

  before(:each) do
    WebMock.reset_callbacks
    HTTPClientSpecHelper.async_mode = false
  end

  include_examples "with WebMock"

  it "should raise a clearly readable error if request with multipart body is sent" 


  it "should yield block on response if block provided" 


  it "should not yield block on empty response if block provided" 


  it "should match requests if headers are the same  but in different order" 


  describe "when using async requests" do
    before(:each) do
      HTTPClientSpecHelper.async_mode = true
    end

    include_examples "with WebMock"
  end

  it "should work with get_content" 


  it "should work via JSONClient subclass" 


  context "multipart bodies" do
    let(:header) {{
        'Accept' => 'application/json',
        'Content-Type' => 'multipart/form-data'
    }}

   let(:body) {[
      {
        'Content-Type' => 'application/json',
        'Content-Disposition' => 'form-data',
        :content => '{"foo": "bar", "baz": 2}'
      }
    ]}

    let(:make_request) {HTTPClient.new.post("http://www.example.com", body: body, header: header)}

    before do
      stub_request(:post, "www.example.com")
    end

    it "should work with multipart bodies" 

  end


  context "Filters" do
    class Filter
      def filter_request(request)
        request.header["Authorization"] = "Bearer 0123456789"
      end

      def filter_response(request, response)
        response.header.set('X-Powered-By', 'webmock')
      end
    end

    before do
      @client = HTTPClient.new
      @client.request_filter << Filter.new
      stub_request(:get, 'www.example.com').with(headers: {'Authorization' => 'Bearer 0123456789'})
    end

    it "supports request filters" 


    it "supports response filters" 

  end

  context 'when a client instance is re-used for another identical request' do
    let(:client) { HTTPClient.new }
    let(:webmock_server_url) {"http://#{WebMockServer.instance.host_with_port}/"}

    before { WebMock.allow_net_connect! }

    it 'invokes the global_stub_request hook for each request' 

  end

  context 'session headers' do
    it "client sends a User-Agent header when given an agent_name explicitly to the client" 


    it "client sends the Accept, User-Agent, and Date by default" 


    it "explicitly defined headers take precedence over session defaults" 

  end

  context 'httpclient response header' do
    it 'receives request_method, request_uri, and request_query from the request header' 

  end

  context 'httpclient streams response', net_connect: true do
    before do
      WebMock.allow_net_connect!
      WebMock.after_request(except: [:other_lib])  do |_, response|
        @response = response
      end
    end

    it 'sets the full body on the webmock response' 

  end

  context 'credentials' do
    it 'are detected when manually specifying Authorization header' 

  end
end

