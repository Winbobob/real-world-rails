require 'spec_helper'
require 'ostruct'
require 'stringio'
require 'uri'
require 'openssl'

module Seahorse
  module Client
    module NetHttp
      describe Handler do

        before(:each) { WebMock.disable_net_connect! }

        let(:config) { OpenStruct.new }

        let(:handler) { Handler.new }

        let(:make_request) { handler.call(context) }

        let(:context) do
          RequestContext.new.tap do |context|
            context.config = config
            context.http_request.endpoint = endpoint
          end
        end

        def endpoint
          @endpoint ||= 'http://test.endpoint.api'
        end

        describe '#session_for' do

          it 're-uses session for endpoints that share port, scheme and host' 


        end

        describe '#pool' do

          let(:handler_pool) { handler.pool_for(config) }

          it 'constructs a ConnectionPool' 


          it 'configures the pool#http_proxy' 


          it 'configures the pool#http_continue_timeout' 


          it 'configures the pool#http_open_timeout' 


          it 'configures the pool#http_read_timeout' 


          it 'configures the pool#http_idle_timeout' 


          it 'configures the pool#http_wire_trace' 


          it 'configures the pool#logger' 


          it 'configures the pool#ssl_verify_peer' 


          it 'configures the pool#ssl_ca_bundle' 


          it 'configures the pool#ssl_ca_directory' 


        end

        describe '#call' do

          let(:http_request) { context.http_request }

          it 'returns a Response object from #call' 


          it 'populates the #context of the returned response' 


          describe 'request endpoint' do

            it 'makes a request against the given endpoint' 


            it 'observes the Endpoint#port' 


            it 'observes the Endpoint#scheme' 


          end

          describe 'request http method' do

            it 'uses the http_request#http_method to make the request' 


            it 'raises a helpful error if the request method is invalid' 


          end

          describe 'request headers' do

            it 'passes along http_request#headers' 


            it 'populates a default content-type header' 


            it 'does not clobber a custom content-type' 


            it 'populates a default accept-encoding header' 


            it 'does not clobber a custom accept-encoding' 


          end

          describe 'request path' do

            it 'sends the request with the correct request uri' 


            it 'sends the request with the querystring' 


          end

          describe 'request body' do

            it 'sends the body' 


          end

          describe 'response' do

            it 'populates the status code' 


            it 'populates the headers' 


            it 'populates the response body' 


            it 'wraps errors with a NetworkingError' 


            if OpenSSL::SSL.const_defined?(:SSLErrorWaitReadable)
              it 'wraps OpenSSL::SSL::SSLErrorWaitReadable w/NetworkingError' 

            end

          end

          describe 'DNS errors' do

            it 'gives additional information about DNS errors' 


          end
        end
      end
    end
  end
end

