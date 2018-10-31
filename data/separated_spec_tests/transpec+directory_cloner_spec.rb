# coding: utf-8

require 'spec_helper'
require 'transpec/directory_cloner'

module Transpec
  describe DirectoryCloner do
    include FileHelper
    include_context 'isolated environment'

    describe '#copy_recursively' do
      it 'copies files recursively' 


      it 'copies only directories, files and symlinks' 


      def permission(path)
        format('%o', File.lstat(path).mode)[-4..-1]
      end

      it 'preserves permission' 


      it 'returns the copied directory path' 


      context 'when failed copying any of the files' do
        it 'raises error with the problematic file path and the original backtrace' 

      end
    end
  end
end

