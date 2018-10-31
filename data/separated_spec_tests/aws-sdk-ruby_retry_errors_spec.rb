require_relative '../../spec_helper'

module Aws
  module Plugins
    describe RetryErrors do

      RetryErrorsSvc = ApiHelper.sample_service

      let(:client) { RetryErrorsSvc::Client.new(stub_responses: true) }

      it 'defaults config.retry_limit to 3' 


      describe 'ErrorInspector' do

        def inspector(error, http_status_code = 404)
          RetryErrors::ErrorInspector.new(error, http_status_code)
        end

        describe '#expired_credentials?' do

          it 'returns true if the error code is InvalidClientTokenId' 


          it 'returns true if the error code is UnrecognizedClientException' 


          it 'returns true if the error code is InvalidAccessKeyId' 


          it 'returns true if the error code is AuthFailure' 


          it 'returns true if the error code matches /expired/' 


          it 'returns false for other errors' 


        end

        describe '#throttling_error?' do

          it 'returns true for Throttling' 


          it 'returns true for ThrottlingException' 


          it 'returns true for RequestThrottled' 


          it 'returns true for ProvisionedThroughputExceededException' 


          it 'returns true for RequestLimitExceeded' 


          it 'returns true for BandwidthLimitExceeded' 


          it 'returns true for LimitExceededException' 


          it 'returns true for error codes that match /throttl/' 


          it 'returns false for other errors' 


        end

        describe '#checksum?' do

          it 'returns true if the error extends Errors::ChecksumError' 


          it 'returns true if the error is a crc32 error' 


          it 'returns false if the error does not exend ChecksumError' 


        end

        describe '#server?' do

          it 'returns true if the error is a 500 level error' 


          it 'returns false if the error is not a 500 level error' 


        end

        describe '#networking?' do

          it 'returns true if the error code is RequestTimeout' 


          it 'does not assume a networking error for 0 status code' 


          it 'returns false if the http status code is not 0' 


          it 'returns true if the error is wrapped in a NetworkingError' 


        end
      end

      describe 'Handler' do

        let(:credentials) { Credentials.new('akid', 'secret') }

        let(:config) {
          cfg = Seahorse::Client::Configuration.new
          cfg.add_option(:credentials, credentials)
          RetryErrors.new.add_options(cfg)
          cfg.build!
        }

        let(:resp) { Seahorse::Client::Response.new }

        let(:handler) { RetryErrors::Handler.new }

        before(:each) do
          resp.context.config = config
          resp.context.http_response.status_code = 400
        end

        def handle(send_handler = nil, &block)
          allow(Kernel).to receive(:sleep)
          handler.handler = send_handler || block
          handler.call(resp.context)
        end

        it 'does not retry responses that have no error' 


        it 'reties 3 times for a total of 4 attemps' 


        it 'backs off exponentially between each retry attempt' 


        it 'increments the retry count on the context' 


        it 'rewinds the request body before each retry attempt' 


        it 'truncates the response body before each retry attempt' 


        it 'skips retry if un-truncatable response body has received data' 


        it 'retries if creds expire and are refreshable' 


        it 'skips retry if creds expire and are not refreshable' 


        it 'retries 500 level errors' 


        it 'retries Seahorse::Client::NetworkingErrors' 


      end
    end
  end
end

