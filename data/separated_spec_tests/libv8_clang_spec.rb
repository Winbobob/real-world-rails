require 'spec_helper'
require 'compiler'

module Libv8::Compiler
  describe Clang do
    subject { Clang.new 'c++' }

    describe '#name' do
      it 'returns clang' 

    end

    describe '#version' do
      it 'returns the version of the compiler' 

    end

    describe '#compatible?' do
      context 'when clang\'s version is >= 3.1' do
        it 'returns true' 

      end

      context 'when clang\'s version is < 3.1' do
        it 'returns false' 

      end
    end
  end
end

