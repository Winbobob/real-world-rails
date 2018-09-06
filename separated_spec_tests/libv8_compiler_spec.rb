require 'spec_helper'
require 'compiler'

module Libv8
  describe Compiler do
    describe '::type_of' do
      it 'recognises correctly GCC' 


      it 'recognises correctly Clang' 


      it 'recognises correctly Apple\'s LLVM' 

    end

    describe '::version_string_of' do
      context 'when calling the compiler command succedes' do
        it 'returns the version string of the compiler' 

      end

      context 'when calling the compiler command fails' do
        it 'raises an exception' 

      end
    end
  end
end

