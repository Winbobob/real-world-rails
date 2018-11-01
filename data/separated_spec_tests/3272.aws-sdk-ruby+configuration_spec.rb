require_relative '../../spec_helper'

module Seahorse
  module Client
    describe Configuration do

      let(:config) { Configuration.new }

      describe '#add_option' do

        it 'defines a getter' 


        it 'defaults the value to nil' 


        it 'accepts a default value' 


        it 'accepts blocks' 


        it 'accepts blocks with an arity of 1, yielding self' 


        it 'blocks can rely on other blocks' 


        it 'blocks work with supplied values' 


        it 'replaces previous default values when called twice' 


        it 'returns self so it can be chained' 


      end

      describe '#build!' do

        it 'returns a Struct' 


        it 'accepts a hash of options' 


        it 'raises an argument error for uknown options' 


        it 'resolves nested dependent options' 


        it 'does not resolve procs passed as args' 


        it 'resolves defaults in LIFO order until a non-nil value is found' 


      end
    end
  end
end

