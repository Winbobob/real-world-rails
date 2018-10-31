require_relative '../../spec_helper'

module Aws
  module Xml
    describe Builder do

      let(:shapes) { ApiHelper.sample_shapes }

      let(:api) { ApiHelper.sample_api(shapes: shapes) }

      let(:operation) {
        operation = api.operation(:example_operation)
        operation.input.location_name = 'xml'
        operation
      }

      let(:rules) { operation.input }

      def xml(params)
        Builder.new(rules).to_xml(params)
      end

      it 'serializes empty values as empty elements' 


      it 'can serialize structures' 


      it 'orders xml elements by members order' 


      it 'supports locationName traits on structure members' 


      it 'supports locationName traits on list members' 


      it 'supports locationName traits on map keys and values' 


      it 'supports nested and complex structures' 


      it 'supports flat lists' 


      it 'supports flat list with locationName traits' 


      it 'does not serialize nil values' 


      it 'correctly serializes newlines' 



      it 'applies xml attribute members to the structure' 


      describe 'namespaces' do

        it 'applies xml namespace to the root node' 


        it 'applies xml namespaces to any shape' 

      end
    end
  end
end

