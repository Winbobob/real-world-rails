require_relative '../../../spec_helper'
require 'logger'

module Seahorse
  module  Client
    module Logging
      describe Handler do

        class LogNullDevice
          attr_reader :messages
          def write(msg)
            @messages ||= ''
            @messages << msg
          end
          def close; end
        end

        class TestFormatter
          def format(response)
            'test-formatter-log-msg'
          end
        end

        def handle!
          @log_dev ||= LogNullDevice.new
          @logger ||= Logger.new(@log_dev)
          @log_level ||= :info
          @formatter ||= TestFormatter.new
          @config ||= double('config',
            logger: @logger,
            log_level: @log_level,
            log_formatter: @formatter)
          @handler ||= Handler.new(lambda { |context|
            context.http_response.signal_done(
              status_code: 200,
              headers: {},
              body: ''
            )
            Response.new(context: context)
          })
          @handler.call(RequestContext.new(config: @config))
        end

        it 'populates the request context with timing information' 


        it 'sends the formatted message to the logger' 


        it 'sends the message at the right log level' 


      end
    end
  end
end

