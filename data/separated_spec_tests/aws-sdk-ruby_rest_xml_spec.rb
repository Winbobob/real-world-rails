require_relative '../../../spec_helper'
require 'json'

module Aws
  module Stubbing
    module Protocols
      describe RestXml do
        describe '#stub_data' do

          def normalize(xml)
            result = ''
            REXML::Document.new(xml).write(result, 2)
            result.strip
          end

          let(:api) { ApiHelper.sample_rest_xml::Client.api }

          let(:operation) { api.operation(:list_buckets) }

          before(:each) do
            api.metadata['xmlNamespace'] = 'http://xmlns'
          end

          it 'returns a stubbed http response' 


          it 'populates the expected headers' 


          it 'populates the body with the stub data' 


          it 'supports stubbing streaming response bodies' 


          it 'supports structure payloads' 


          it 'can stub errors' 


        end
      end
    end
  end
end

