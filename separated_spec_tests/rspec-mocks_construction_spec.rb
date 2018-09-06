require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'Constructing a verifying double' do
      include_context 'with isolated configuration'

      class ClassThatDynamicallyDefinesMethods
        def self.define_attribute_methods!
          define_method(:some_method_defined_dynamically) { true }
        end
      end

      module CustomModule
      end

      describe 'instance doubles' do
        it 'cannot be constructed with a non-module object' 


        it 'can be constructed with a struct' 


        it 'allows named constants to be looked up and declared to verifying double callbacks' 


        it 'allows anonymous constants to be looked up and declared to verifying double callbacks' 


        it 'allows classes to be customised' 

      end

      describe 'class doubles' do
        it 'cannot be constructed with a non-module object' 


        it 'declares named modules to verifying double callbacks' 


        it 'declares anonymous modules to verifying double callbacks' 

      end

      describe 'object doubles' do
        it 'declares the class to verifying double callbacks' 

      end

      describe 'when verify_doubled_constant_names config option is set' do

        before do
          RSpec::Mocks.configuration.verify_doubled_constant_names = true
        end

        it 'prevents creation of instance doubles for unloaded constants' 


        it 'prevents creation of class doubles for unloaded constants' 

      end

      it 'can only be named with a string or a module' 

    end
  end
end

