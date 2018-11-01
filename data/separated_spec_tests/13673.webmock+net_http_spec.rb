require 'spec_helper'
require 'ostruct'
require 'acceptance/webmock_shared'
require 'acceptance/net_http/net_http_spec_helper'
require 'acceptance/net_http/net_http_shared'

include NetHTTPSpecHelper

describe "Net:HTTP" do
  include_examples "with WebMock", :no_url_auth

  let(:port) { WebMockServer.instance.port }

  describe "marshalling" do
    class TestMarshalingInWebMockNetHTTP
      attr_accessor :r
    end
    before(:each) do
      @b = TestMarshalingInWebMockNetHTTP.new
    end
    after(:each) do
      WebMock.enable!
    end
    it "should be possible to load object marshalled when webmock was disabled" 


    it "should be possible to load object marshalled when webmock was enabled"  do
      WebMock.enable!
      new_constants = [
        Net::HTTP::Get,
        Net::HTTP::Post,
        Net::HTTP::Put,
        Net::HTTP::Delete,
        Net::HTTP::Head,
        Net::HTTP::Options
      ]
      @b.r = new_constants
      new_serialized = Marshal.dump(@b)
      Marshal.load(new_serialized)
      WebMock.disable!
      Marshal.load(new_serialized)
    end
  end

  describe "constants" do
    it "should still have const Get defined on replaced Net::HTTP" 


    it "should still have const Get within constants on replaced Net::HTTP" 


    it "should still have const Get within constants on replaced Net::HTTP" 


    if Module.method(:const_defined?).arity != 1
      it "should still have const Get defined (and not inherited) on replaced Net::HTTP" 

    end

    if Module.method(:const_get).arity != 1
      it "should still be able to get non inherited constant Get on replaced Net::HTTP" 

    end

    if Module.method(:constants).arity != 0
      it "should still Get within non inherited constants on replaced Net::HTTP" 

    end

    describe "after WebMock is disabled" do
      after(:each) do
        WebMock.enable!
      end
      it "Net::HTTP should have the same constants" 

    end
  end

  it "should work with block provided" 


  it "should handle requests with raw binary data" 


  it "raises an ArgumentError if passed headers as symbols if RUBY_VERSION < 2.3.0" 


  it "should handle multiple values for the same response header" 


  it "should yield block on response" 


  it "should handle Net::HTTP::Post#body" 


  it "should handle Net::HTTP::Post#body_stream" 


  it "should behave like Net::HTTP and raise error if both request body and body argument are set" 


  it "should return a Net::ReadAdapter from response.body when a stubbed request is made with a block and #read_body" 


  it "should have request 1 time executed in registry after 1 real request", net_connect: true do
    WebMock.allow_net_connect!
    http = Net::HTTP.new('localhost', port)
    http.get('/') {}
    expect(WebMock::RequestRegistry.instance.requested_signatures.hash.size).to eq(1)
    expect(WebMock::RequestRegistry.instance.requested_signatures.hash.values.first).to eq(1)
  end

  it "should work with Addressable::URI passed to Net::HTTP.get_response" 


  describe "connecting on Net::HTTP.start" do
    before(:each) do
      @http = Net::HTTP.new('www.google.com', 443)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    describe "when net http is allowed" do
      it "should not connect to the server until the request", net_connect: true do
        WebMock.allow_net_connect!
        @http.start {|conn|
          expect(conn.peer_cert).to be_nil
        }
      end

      it "should connect to the server on start", net_connect: true do
        WebMock.allow_net_connect!(net_http_connect_on_start: true)
        @http.start {|conn|
          cert = OpenSSL::X509::Certificate.new conn.peer_cert
          expect(cert).to be_a(OpenSSL::X509::Certificate)
        }
      end

    end

    describe "when net http is disabled and allowed only for some hosts" do
      it "should not connect to the server until the request", net_connect: true do
        WebMock.disable_net_connect!(allow: "www.google.com")
        @http.start {|conn|
          expect(conn.peer_cert).to be_nil
        }
      end

      it "should connect to the server on start", net_connect: true do
        WebMock.disable_net_connect!(allow: "www.google.com", net_http_connect_on_start: true)
        @http.start {|conn|
          cert = OpenSSL::X509::Certificate.new conn.peer_cert
          expect(cert).to be_a(OpenSSL::X509::Certificate)
        }
      end

      it "should connect to the server if the URI matches an regex", net_connect: true do
        WebMock.disable_net_connect!(allow: /google.com/)
        Net::HTTP.get('www.google.com','/')
      end

      it "should connect to the server if the URI matches any regex the array", net_connect: true do
        WebMock.disable_net_connect!(allow: [/google.com/, /yahoo.com/])
        Net::HTTP.get('www.google.com','/')
      end

    end

  end

  describe "when net_http_connect_on_start is true" do
    before(:each) do
      WebMock.allow_net_connect!(net_http_connect_on_start: true)
    end
    it_should_behave_like "Net::HTTP"
  end

  describe "when net_http_connect_on_start is false" do
    before(:each) do
      WebMock.allow_net_connect!(net_http_connect_on_start: false)
    end
    it_should_behave_like "Net::HTTP"
  end

  describe 'after_request callback support', net_connect: true do
    let(:expected_body_regex) { /hello world/ }

    before(:each) do
      WebMock.allow_net_connect!
      @callback_invocation_count = 0
      WebMock.after_request do |_, response|
        @callback_invocation_count += 1
        @callback_response = response
      end
    end

    after(:each) do
      WebMock.reset_callbacks
    end

    def perform_get_with_returning_block
      http_request(:get, "http://localhost:#{port}/") do |response|
        return response.body
      end
    end

    it "should support the after_request callback on an request with block and read_body" 


    it "should support the after_request callback on a request with a returning block" 


    it "should only invoke the after_request callback once, even for a recursive post request" 

  end

  it "should match http headers, even if their values have been set in a request as numbers" 

end

