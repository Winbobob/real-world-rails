# encoding: utf-8
require 'spec_helper'
require 'acceptance/webmock_shared'
require 'ostruct'

unless RUBY_PLATFORM =~ /java/
  require 'acceptance/em_http_request/em_http_request_spec_helper'

  describe "EM::HttpRequest" do
    include EMHttpRequestSpecHelper

    include_context "with WebMock", :no_status_message

    #functionality only supported for em-http-request 1.x
    if defined?(EventMachine::HttpConnection)
      context 'when a real request is made and redirects are followed', net_connect: true do
        before { WebMock.allow_net_connect! }

        # This url redirects to the https URL.
        let(:http_url) { "http://raw.github.com:80/gist/fb555cb593f3349d53af/6921dd638337d3f6a51b0e02e7f30e3c414f70d6/vcr_gist" }
        let(:https_url) { http_url.gsub('http', 'https').gsub('80', '443') }

        def make_request
          EM.run do
            request = EM::HttpRequest.new(http_url).get(redirects: 1)
            request.callback { EM.stop }
          end
        end

        it "invokes the globally_stub_request hook with both requests" 


        it 'invokes the after_request hook with both requests' 

      end

      describe "with middleware" do

        it "should work with request middleware" 


        let(:response_middleware) do
          Class.new do
            def response(resp)
              resp.response = 'bar'
            end
          end
        end

        it "should work with response middleware" 


        let(:webmock_server_url) { "http://#{WebMockServer.instance.host_with_port}/" }

        shared_examples_for "em-http-request middleware/after_request hook integration" do
          it 'yields the original raw body to the after_request hook even if a response middleware modifies the body' 

        end

        context 'making a real request', net_connect: true do
          before { WebMock.allow_net_connect! }
          include_examples "em-http-request middleware/after_request hook integration"
        end

        context 'when the request is stubbed' do
          before { stub_request(:get, webmock_server_url).to_return(body: 'hello world') }
          include_examples "em-http-request middleware/after_request hook integration"
        end
      end

      it 'should trigger error callbacks asynchronously' 


      # not pretty, but it works
      if defined?(EventMachine::Synchrony)
        describe "with synchrony" do
          let(:webmock_em_http) { File.expand_path(File.join(File.dirname(__FILE__), "../lib/webmock/http_lib_adapters/em_http_request/em_http_request_1_x.rb")) }

          before(:each) do
            # need to reload the webmock em-http adapter after we require synchrony
            WebMock::HttpLibAdapters::EmHttpRequestAdapter.disable!
            $".delete webmock_em_http
            $".delete File.expand_path(File.join(File.dirname(__FILE__), "../../../lib/webmock/http_lib_adapters/em_http_request_adapter.rb"))
            require 'em-synchrony'
            require 'em-synchrony/em-http'
            require File.expand_path(File.join(File.dirname(__FILE__), "../../../lib/webmock/http_lib_adapters/em_http_request_adapter.rb"))
          end

          it "should work" 


          after(:each) do
            EM.send(:remove_const, :Synchrony)
            EM.send(:remove_const, :HTTPMethods)
            WebMock::HttpLibAdapters::EmHttpRequestAdapter.disable!
            $".reject! {|path| path.include? "em-http-request"}
            $".delete webmock_em_http
            $".delete File.expand_path(File.join(File.dirname(__FILE__), "../../../lib/webmock/http_lib_adapters/em_http_request_adapter.rb"))
            require 'em-http-request'
            require File.expand_path(File.join(File.dirname(__FILE__), "../../../lib/webmock/http_lib_adapters/em_http_request_adapter.rb"))
          end
        end
      end
    end

    it "should work with streaming" 


    it "should work with responses that use chunked transfer encoding" 


    it "should work with optional query params" 


    it "should work with optional query params declared as string" 


    it "should work when the body is passed as a Hash" 


    if defined?(EventMachine::HttpConnection)
      it "should work when a file is passed as body" 

    end

    it "should work with UTF-8 strings" 


    it "should work with multiple requests to the same connection" 


    it "should work with multiple requests to the same connection when the first request times out" 


    describe "mocking EM::HttpClient API" do
      let(:uri) { "http://www.example.com/" }

      before do
        stub_request(:get, uri)
        WebMock::HttpLibAdapters::EmHttpRequestAdapter.enable!
      end

      def client(uri, options = {})
        client = nil
        EM.run do
          client = EventMachine::HttpRequest.new(uri).get(options)
          client.callback { EM.stop }
          client.errback { failed }
        end
        client
      end

      subject { client(uri) }

      it 'should support #uri' 


      it 'should support #last_effective_url' 


      context "with a query" do
        let(:uri) { "http://www.example.com/?a=1&b=2" }
        subject { client("http://www.example.com/?a=1", query: { 'b' => 2 }) }

        it "#request_signature doesn't mutate the original uri" 

      end

      describe 'get_response_cookie' do

        before(:each) do
          stub_request(:get, "http://example.org/").
          to_return(
            status: 200,
            body: "",
            headers: { 'Set-Cookie' => cookie_string }
          )
        end

        describe 'success' do

          context 'with only one cookie' do

            let(:cookie_name) { 'name_of_the_cookie' }
            let(:cookie_value) { 'value_of_the_cookie' }
            let(:cookie_string) { "#{cookie_name}=#{cookie_value}" }

            it 'successfully gets the cookie' 

          end

          context 'with several cookies' do

            let(:cookie_name) { 'name_of_the_cookie' }
            let(:cookie_value) { 'value_of_the_cookie' }
            let(:cookie_2_name) { 'name_of_the_2nd_cookie' }
            let(:cookie_2_value) { 'value_of_the_2nd_cookie' }
            let(:cookie_string) { %W(#{cookie_name}=#{cookie_value} #{cookie_2_name}=#{cookie_2_value}) }

            it 'successfully gets both cookies' 

          end
        end

        describe 'failure' do

          let(:cookie_string) { 'a=b' }

          it 'returns nil when no cookie is found' 

        end
      end
    end

  end
end

