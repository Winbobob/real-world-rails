require_relative '../../../spec_helper'
require 'json'

module Aws
  module Stubbing
    module Protocols
      describe Json do
        describe '#stub_data' do

          def normalize(json)
            JSON.pretty_generate(JSON.load(json), indent: '  ')
          end

          let(:api) { ApiHelper.sample_json::Client.api }

          let(:operation) { api.operation(:describe_table) }

          it 'returns a stubbed http response' 


          it 'populates the expected headers' 


          it 'populates the body with the stub data' 


        end
      end
    end
  end
end

