require 'spec_helper'
require 'compiler'

module Libv8::Compiler
  describe AppleLLVM do
    subject { AppleLLVM.new 'c++' }

    describe '#name' do
      it 'returns Apple LLVM' 

    end

    describe '#version' do
      it 'returns the version of the compiler' 

    end

    describe '#compatible?' do
      context 'when Apple LLVM\'s version is >= 4.3' do
        it 'returns true' 

      end

      context 'when Apple LLVM\'s version is < 4.3' do
        it 'returns false' 

      end
    end
  end
end

