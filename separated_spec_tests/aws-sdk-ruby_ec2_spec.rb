require_relative '../../../spec_helper'
require 'rexml/document'

module Aws
  module Stubbing
    module Protocols
      describe EC2 do
        describe '#stub_data' do

          def normalize(xml)
            result = ''
            REXML::Document.new(xml).write(result, 2)
            result.strip
          end

          let(:api) { ApiHelper.sample_ec2::Client.api }

          let(:operation) { api.operation(:describe_instances) }

          it 'returns a stubbed http response' 


          it 'populates the content-type header' 


          it 'populates the body with the stub data' 


        end
      end
    end
  end
end

