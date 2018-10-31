require 'doublespeak_spec_helper'

module Shoulda::Matchers::Doublespeak
  describe Double do
    describe 'initializer' do
      context 'if doubles are currently activated on the world level' do
        it 'immediately activates the new Double' 

      end
    end

    describe '#to_return' do
      it 'tells its implementation to call the given block' 


      it 'tells its implementation to return the given value' 


      it 'prefers a block over a non-block' 

    end

    describe '#activate' do
      it 'replaces the method with an implementation' 

    end

    describe '#deactivate' do
      it 'restores the original method after being doubled' 


      it 'still restores the original method if #activate was called twice' 


      it 'does nothing if the method has not been doubled' 

    end

    describe '#record_call' do
      it 'adds the given call to the list of calls' 

    end

    describe '#call_original_method' do
      it 'binds the stored method object to the given object and calls it with the given args and block' 


      it 'does nothing if no method has been stored' 


      it 'does not store the original method multiple times when a method is doubled multiple times' 

    end

    def create_class(methods = {})
      Class.new.tap do |klass|
        methods.each do |name, value|
          klass.__send__(:define_method, name) { |*args| value }
        end
      end
    end

    def build_implementation
      double('implementation', returns: nil, call: nil)
    end

    def build_world(methods = {})
      defaults = {
        original_method_for: nil,
        store_original_method_for: nil,
        doubles_activated?: nil
      }
      double('world', defaults.merge(methods))
    end
  end
end

