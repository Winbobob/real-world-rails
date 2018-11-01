require_relative '../../spec_helper'

module Aws
  module Plugins
    describe RetryErrors do

      RetryErrorsSvc = ApiHelper.sample_service

      let(:client) { RetryErrorsSvc::Client.new(stub_responses: true) }

      it 'defaults config.retry_limit to 3' 


      it 'defaults config.retry_max_delay to 0' 

      
      it 'defaults config.retry_base_delay to 0.3' 

      
      it 'defaults config.retry_jitter to :none' 


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


          it 'returns true for response status code 429' 


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


        it 'retries 3 times for a total of 4 attemps' 


        it 'backs off according to custom retry_backoff proc'  do
          config.retry_backoff = lambda { |c| Kernel.sleep([0.4, 0.2, 1.7][c.retries]) }
          expect(Kernel).to receive(:sleep).with(0.4).ordered
          expect(Kernel).to receive(:sleep).with(0.2).ordered
          expect(Kernel).to receive(:sleep).with(1.7).ordered
          resp.error = RetryErrorsSvc::Errors::RequestLimitExceeded.new(nil,nil)
          handle { |context| resp }
        end

        it 'backs off exponentially between each retry attempt' 


        it 'backs off exponentially between each retry attempt with custom :retry_base_delay' 


        it 'caps backoff delay to :retry_max_delay 'do
          config.retry_max_delay = 4.0
          config.retry_limit = 6
          expect(Kernel).to receive(:sleep).with(0.3).ordered
          expect(Kernel).to receive(:sleep).with(0.6).ordered
          expect(Kernel).to receive(:sleep).with(1.2).ordered
          expect(Kernel).to receive(:sleep).with(2.4).ordered
          expect(Kernel).to receive(:sleep).with(4.0).ordered
          expect(Kernel).to receive(:sleep).with(4.0).ordered
          resp.error = RetryErrorsSvc::Errors::RequestLimitExceeded.new(nil,nil)
          handle { |context| resp }
        end

        it 'randomises the backoff delay with :retry_jitter set to :full' 


        it 'randomises the backoff delay with :retry_jitter set to :equal'  do
          config.retry_jitter = :equal
          config.retry_max_delay = 2.0
          config.retry_limit = 4

          expect(Kernel).to receive(:rand).with(0..0.3/2).ordered.and_return(1)
          expect(Kernel).to receive(:sleep).with(1 + 0.3/2).ordered

          expect(Kernel).to receive(:rand).with(0..0.6/2).ordered.and_return(2)
          expect(Kernel).to receive(:sleep).with(2 + 0.6/2).ordered

          expect(Kernel).to receive(:rand).with(0..1.2/2).ordered.and_return(3)
          expect(Kernel).to receive(:sleep).with(3 + 1.2/2).ordered

          expect(Kernel).to receive(:rand).with(0..2.0/2).ordered.and_return(4)
          expect(Kernel).to receive(:sleep).with(4 + 2.0/2).ordered

          resp.error = RetryErrorsSvc::Errors::RequestLimitExceeded.new(nil,nil)
          handle { |context| resp }
        end

        it 'raises KeyError with invalid jitter function' 


        it 'adjusts delay with custom jitter'  do
          config.retry_jitter = lambda { |delay| delay * 2}

          expect(Kernel).to receive(:sleep).with(0.6).ordered
          expect(Kernel).to receive(:sleep).with(1.2).ordered
          expect(Kernel).to receive(:sleep).with(2.4).ordered

          resp.error = RetryErrorsSvc::Errors::RequestLimitExceeded.new(nil,nil)
          handle { |context| resp }
        end

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

