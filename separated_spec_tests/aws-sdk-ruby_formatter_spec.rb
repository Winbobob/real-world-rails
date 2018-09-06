require_relative '../../../spec_helper'
require 'pathname'

module Seahorse
  module  Client
    module Logging
      describe Formatter do

        let(:response) { Response.new }

        def format(pattern, options = {})
          Logging::Formatter.new(pattern, options).format(response)
        end

        describe '#format' do

          it 'provides a :client_class replacement' 


          it 'provides a :operation replacement' 


          it 'provides a :request_params replacement' 


          it 'provides a :time replacement' 


          it 'provides a :retries replacement' 


          it 'provides a :http_request_endpoint replacement' 


          it 'provides a :http_request_scheme replacement' 


          it 'provides a :http_request_host replacement' 


          it 'provides a :http_request_port replacement' 


          it 'provides a :http_request_headers replacement' 


          it 'provides a :http_request_body replacement' 


          it 'provides a :http_response_status_code replacement' 


          it 'provides a :http_response_headers replacement' 


          it 'provides a :http_response_body replacement' 


          it 'provides a :error_class replacement' 


          it 'provides a :error_message replacement' 


          it 'leaves placeholders intact that are not defined' 


        end

        describe 'canned loggers' do

          before(:each) do
            now = Time.now
            response.context.client = String
            response.context.operation_name = 'operation_name'
            response.context.retries = 3
            response.context.params = { limit: 1 }
            response.error = RuntimeError.new('error-message')
            response.context.http_response.status_code = 200
            response.context[:logging_started_at] = now - 1.12345
            response.context[:logging_completed_at] = now
          end

          describe '.default' do

            it 'provides a basic logging format' 


          end

          describe '.short' do

            it 'provides a basic logging format' 


          end

          describe '.colored' do

            it 'provides a basic logging format' 


          end
        end
      end
    end
  end
end

