require 'doublespeak_spec_helper'

module Shoulda::Matchers::Doublespeak
  describe DoubleCollection do
    describe '#register_stub' do
      it 'calls DoubleImplementationRegistry.find correctly' 


      it 'calls Double.new correctly' 


      context 'if a double has already been registered for the method' do
        it 'does not call Double.new again' 


        it 'returns the same Double' 

      end
    end

    describe '#register_proxy' do
      it 'calls DoubleImplementationRegistry.find correctly' 


      it 'calls Double.new correctly' 


      context 'if a double has already been registered for the method' do
        it 'does not call Double.new again' 


        it 'returns the same Double' 

      end
    end

    describe '#activate' do
      it 'replaces all registered methods with doubles' 

    end

    describe '#deactivate' do
      it 'restores the original methods that were doubled' 

    end

    describe '#calls_to' do
      it 'returns all calls to the given method' 


      it 'returns an empty array if the method has never been doubled' 

    end

    def create_class(methods = {})
      Class.new.tap do |klass|
        methods.each do |name, value|
          klass.__send__(:define_method, name) { |*args| value }
        end
      end
    end

    def build_world
      Shoulda::Matchers::Doublespeak::World.new
    end
  end
end

