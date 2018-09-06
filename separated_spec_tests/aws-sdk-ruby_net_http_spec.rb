require_relative '../../../spec_helper'

module Seahorse
  module Client
    module Plugins
      describe NetHttp do

        let(:config) do
          Configuration.new.tap do |config|
            NetHttp.new.add_options(config)
          end.build!
        end

        describe '#add_options' do

          it 'adds a :http_proxy option without default' 


          it 'adds a :http_open_timeout option with default' 


          it 'adds a :http_read_timeout option with default' 


          it 'adds a :http_idle_timeout option with default' 


          it 'adds a :http_continue_timeout option with default' 


          it 'adds a :http_wire_trace option with default' 


          it 'adds a :logger option without default' 


          it 'adds a :ssl_verify_peer option with default' 


          it 'defaults the :ssl_ca_bundle to nil' 


          it 'adds a :ssl_ca_directory option without default' 


        end

        describe '#add_handlers' do

          it 'sets the :send hander to a Client::NetHttp::Handler' 


        end
      end
    end
  end
end

