require_relative '../../../spec_helper'
require 'rexml/document'

module Aws
  module Stubbing
    module Protocols
      describe Query do
        describe '#stub_data' do

          def normalize(xml)
            result = ''
            REXML::Document.new(xml).write(result, 2)
            result.strip
          end

          let(:api) { ApiHelper.sample_query::Client.api }

          let(:operation) { api.operation(:list_users) }

          it 'returns a stubbed http response' 


          it 'populates the body with the stub data' 


          it 'can stub errors' 


        end
      end
    end
  end
end

