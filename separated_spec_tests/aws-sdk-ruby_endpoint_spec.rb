require_relative '../../../spec_helper'

module Seahorse
  module Client
    module Plugins
      describe Endpoint do

        let(:client_class) do
          api = Model::Api.new
          api.add_operation(:operation_name, Model::Operation.new)
          client_class = Class.new(Client::Base)
          client_class.set_api(api)
          client_class.clear_plugins
          client_class.add_plugin(Endpoint)
          client_class.add_plugin(DummySendPlugin)
          client_class
        end

        it 'adds an #endpoint option to config' 


        it 'populates the http request endpoint' 


      end
    end
  end
end

