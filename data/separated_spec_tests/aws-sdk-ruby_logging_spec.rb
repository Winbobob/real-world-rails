require_relative '../../../spec_helper'

module Seahorse
  module  Client
    module Plugins
      describe Logging do

        def setup_plugin(options = {})
          @config ||= Configuration.new
          Logging.new.add_options(@config)
          @config = @config.build!(options)
          @handlers ||= HandlerList.new
          Logging.new.add_handlers(@handlers, @config)
        end

        it 'adds default configuration options' 


        it 'adds a handler when a :logger is configured' 


        it 'skips the handler when :logger is not configured' 


        it 'adds the handler to the bottom of the stack' 


      end
    end
  end
end

