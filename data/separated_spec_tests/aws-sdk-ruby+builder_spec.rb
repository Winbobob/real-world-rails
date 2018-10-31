require_relative '../../spec_helper'

module Aws
  module Json
    describe Builder do

      let(:shapes) { ApiHelper.sample_shapes }

      let(:rules) {
        ApiHelper.sample_api(shapes:shapes).
          operation(:example_operation).
          input
      }

      def json(params)
        Builder.new(rules).to_json(params)
      end

      it 'builds an empty JOSN document when there are no params' 


      it 'can serialize structures' 


      it 'supports locationName traits on structure members' 


      it 'supports nested and complex structures' 


      it 'does not serialize nil values' 


    end
  end
end

