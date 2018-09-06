require_relative '../../spec_helper'

module Aws
  module Query
    describe ParamBuilder do

      let(:shapes) { ApiHelper.sample_shapes }

      let(:rules) {
        ApiHelper.sample_api(shapes: shapes).operation(:example_operation).input
      }

      def query(params = {})
        param_list = ParamList.new
        ParamBuilder.new(param_list).apply(rules, params)
        param_list.map { |param| [param.name, param.value ] }.sort
      end

      it 'returns an empty list when there are no params' 


      it 'can serialize structures' 


      it 'does not serialize nil values' 


      it 'supports locationName on structure members' 


      it 'supports locationName traits on list members' 


      it 'supports locationName traits on map keys and values' 


      it 'supports nested and complex structures' 


      it 'supports empty lists' 


      it 'supports flattened lists' 


      it 'supports flattened lists with locationName traits' 


      it 'supports flattened maps' 


      it 'supports flattened maps with locationName traits' 


    end
  end
end

