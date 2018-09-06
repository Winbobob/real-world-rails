require 'doublespeak_spec_helper'

module Shoulda::Matchers::Doublespeak
  describe StubImplementation do
    describe '#call' do
      it 'calls #record_call on the double' 


      context 'if no explicit implementation was set' do
        it 'returns nil' 

      end

      context 'if the implementation was set as a value' do
        it 'returns the set return value' 

      end

      context 'if the implementation was set as a block' do
        it 'calls the block with the MethodCall object the implementation was called with' 


        it 'returns the return value of the block' 

      end

      context 'if the implementation was set as both a value and a block' do
        it 'prefers the block over the value' 

      end
    end

    def build_double
      double('double', record_call: nil)
    end

    def build_call(options = {})
      defaults = { double: build_double }
      double('call', defaults.merge(options))
    end
  end
end

