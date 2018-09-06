require 'spec_helper'
require 'compiler'

module Libv8::Compiler
  describe GenericCompiler do
    subject { GenericCompiler.new 'c++' }

    describe '#name' do
      it 'returns just the base name of the command' 

    end

    describe '#to_s' do
      it 'should be the command used to call the compiler' 

    end

    describe '#version' do
      it 'returns the version of the compiler' 


      it 'returns nil when determining the version fails' 

    end

    describe '#target' do
      it 'returns the target of the compiler' 


      it 'returns nil when determining the target fails' 

    end

    describe '#compatible?' do
      it 'returns false' 

    end
  end
end

