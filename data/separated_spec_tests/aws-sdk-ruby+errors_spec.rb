require_relative '../spec_helper'

module Aws
  module Errors
    describe DynamicErrors do

      let(:mod) {
        mod = Module.new
        mod.send(:extend, DynamicErrors)
        mod
      }

      it 'dynamically creates error classes' 


      it 'removes non letters and numbers from the error code' 


      it 'removes http namespaces from the error code' 


      it 'ensures the error class name starts with a letter' 


      it 'ensures the error class constant is uppercased' 


      it 'removes characters that are not valid as constants' 


      it 'prevents #const_missing from re-setting the error constant' 


      it 'prevents #const_missing from re-setting the error constant' 


    end
  end
end

