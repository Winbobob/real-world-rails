require 'rspec/support/recursive_const_methods'

module RSpec
  module Support
    describe RecursiveConstMethods do
      include described_class

      module Foo
        class Parent
          UNDETECTED = 'Not seen when looking up constants in Bar'
        end

        class Bar < Parent
          VAL = 10
        end
      end

      describe '#recursive_const_defined?' do
        it 'finds constants' 


        it 'returns the fully qualified name of the constant' 


        it 'does not find constants in ancestors' 


        it 'does not blow up on buggy classes that raise weird errors on `to_str`' 

      end

      describe '#recursive_const_get' do
        it 'gets constants' 


        it 'does not get constants in ancestors' 

      end
    end
  end
end

