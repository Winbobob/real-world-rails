require_relative '../../spec_helper'

module Aws
  module Query
    describe EC2ParamBuilder do

      let(:shapes) { ApiHelper.sample_shapes }

      let(:rules) {
        ApiHelper.sample_api(shapes:shapes).
          operation(:example_operation).
          input
      }

      def query(params = {})
        param_list = ParamList.new
        EC2ParamBuilder.new(param_list).apply(rules, params)
        param_list.map { |param| [param.name, param.value ] }.sort
      end

      it 'can serialize structures' 


    end
  end
end

