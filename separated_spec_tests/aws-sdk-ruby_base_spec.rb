require_relative '../../spec_helper'
require 'ostruct'

module Seahorse
  module Client
    describe Base do

      let(:api) { Seahorse::Model::Api.new }

      let(:client_class) { Base.define(api:api) }

      let(:client) { client_class.new(endpoint:'http://example.com') }

      let(:plugin_a) { Class.new }

      let(:plugin_b) { Class.new }

      it 'is a HandlerBuilder' 


      describe '#config' do

        it 'returns a Configuration struct' 


        it 'contains the client api' 


        it 'passes constructor args to the config' 


      end

      describe '#handlers' do

        it 'returns a HandlerList' 


        it 'builds a handler list from client plugins' 


        it 'defaults the send handler to a NetHttp::Handler' 


      end

      describe '#build_request' do

        let(:request) { client.build_request('operation_name') }

        before(:each) do
          api.add_operation(:operation_name, Model::Operation.new)
        end

        it 'returns a Request' 


        it 'populates the request handlers' 


        it 'includes operation specific handlers in the handler list' 


        it 'populates the request context operation name' 


        it 'stringifies the operation name' 


        it 'populates the request context params' 


        it 'defaults params to an empty hash' 


        it 'populates the request context configuration' 


        it 'raises an error for unknown operations' 


      end

      describe 'api operations' do

        let(:request) { double('request') }

        before(:each) do
          api.add_operation(:operation_name, Model::Operation.new)
          allow(client).to receive(:build_request).and_return(request)
          allow(request).to receive(:send_request)
        end

        it 'can return a list of valid operation names' 


        it 'responds to each operation name' 


        it 'builds and sends a request when it receives a request method' 


        it 'passes block arguments to the request method' 


      end

      describe '.api' do

        it 'can be set' 


      end

      describe '.define' do

        it 'creates a new client class' 


        it 'sets the api on the client class' 


        it 'extends from subclasses of client' 


        it 'applies plugins passed in via :plugins' 


      end

      describe '.add_plugin' do

        it 'adds plugins to the client' 


        it 'does not add plugins to the client parent class' 


      end

      describe '.remove_plugin' do

        it 'removes a plugin from the client' 


        it 'does not remove plugins from the client parent class' 


      end

      describe '.set_plugins' do

        it 'replaces existing plugins' 


      end

      describe '.clear_plugins' do

        it 'removes all plugins' 


      end

      describe '.plugins' do

        it 'returns a list of plugins applied to the client' 


        it 'returns a frozen list of plugins' 


        it 'has a defualt list of plugins' 


      end

      describe '.new' do

        let(:plugin) {
          p = double('plugin')
          allow(p).to receive(:is_a?).with(kind_of(Class)).and_return(false)
          p
        }

        it 'instructs plugins to #before_initialize' 


        it 'instructs plugins to #add_options' 


        it 'instructs plugins to #add_handlers' 


        it 'instructs plugins to #after_initialize' 


        it 'does not call methods that plugin does not respond to' 


      end
    end
  end
end

