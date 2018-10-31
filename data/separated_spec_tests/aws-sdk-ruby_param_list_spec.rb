require_relative '../../spec_helper'

module Aws
  module Query
    describe ParamList do

      let(:list) { ParamList.new }

      describe '#set' do

        it 'returns a param' 


        it 'sets a param with name and value' 


        it 'can set a param without a value' 


      end

      describe '#delete' do

        it 'removes a returns a param' 


        it 'returns nil if the param was not seted' 


      end

      describe '#to_a' do

        it 'returns an array of sorted Param objects' 


      end

      describe '#to_s' do

        it 'returns the params as a string' 


        it 'joins multiple params with an ampersand' 


        it 'sorts params' 


        it 'escapes names and values' 


      end

    end
  end
end

