require_relative '../../../spec_helper'
require 'json'

module Aws
  module Stubbing
    module Protocols
      describe RestJson do
        describe '#stub_data' do

          def normalize(json)
            JSON.pretty_generate(JSON.load(json), indent: '  ')
          end

          let(:api) { ApiHelper.sample_rest_json::Client.api }

          let(:operation) { api.operation(:list_vaults) }

          it 'returns a stubbed http response' 


          it 'populates the expected headers' 


          it 'populates the body with the stub data' 


          it 'supports stubbing streaming response bodies' 


          it 'does not stub status code when not present' 


          it 'supports structure payloads' 


        end
      end
    end
  end
end

