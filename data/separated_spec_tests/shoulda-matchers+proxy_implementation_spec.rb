require 'doublespeak_spec_helper'

module Shoulda::Matchers::Doublespeak
  describe ProxyImplementation do
    describe '#returns' do
      it 'delegates to its stub_implementation' 

    end

    describe '#call' do
      it 'calls #call_original_method on the double' 


      it 'delegates to its stub_implementation' 


      it 'returns the return value of the original method' 

    end

    def build_stub_implementation
      double('stub_implementation', returns: nil, call: nil)
    end

    def build_double(methods = {})
      defaults = { call_original_method: nil }
      double('double', defaults.merge(methods))
    end

    def build_call(methods = {})
      defaults = { double: build_double, with_return_value: nil }
      double('call', defaults.merge(methods))
    end
  end
end

