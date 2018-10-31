require 'spec_helper'

describe Array do
  with_minimum_ruby('2.3.0') do
    describe '#dig' do
      let(:array) { Hashie::Array.new([:a, :b, :c]) }

      it 'works with a string index' 


      it 'works with a numeric index' 


      context 'when array is empty' do
        let(:array) { Hashie::Array.new([]) }

        it 'works with a first numeric and next string index' 


        it 'throws an error with first string and next numeric index' 

      end
    end
  end
end

