require_relative '../../spec_helper'
require 'base64'
require 'time'

module Aws
  module Json
    describe Parser do

      let(:shapes) { ApiHelper.sample_shapes }

      def parse(json)
        api = ApiHelper.sample_api(shapes: shapes)
        rules = api.operation(:example_operation).output
        Parser.new(rules).parse(json).to_hash
      end

      it 'returns an empty hash when the JSON is {}' 


      it 'parses complex and nested documents' 


      it 'observes structure member locationNames' 


      it 'ignores unknown json object keys' 


      it 'supports unix timestamps' 


      it 'supports iso8601 strings' 


      it 'supports rfc822 strings' 


      it 'supports quoted and unquoted booleans' 


      it 'does not trap json parsing errors' 


    end
  end
end

