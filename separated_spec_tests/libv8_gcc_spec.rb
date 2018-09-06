require 'spec_helper'
require 'compiler'

module Libv8::Compiler
  describe GCC do
    subject { GCC.new 'c++' }

    describe '#name' do
      it 'returns GCC' 

    end

    describe '#version' do
      it 'returns the version of the compiler' 

    end

    describe '#compatible?' do
      context 'when GCC\'s version is >= 4.8' do
        it 'returns true' 

      end

      context 'when GCC\'s version is < 4.3' do
        it 'returns false' 

      end
    end
  end
end

