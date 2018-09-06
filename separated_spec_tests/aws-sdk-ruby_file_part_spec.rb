require_relative 'spec_helper'
require 'tempfile'

module Aws
  module S3
    describe FilePart do

      let(:data) { 'The quick brown fox jumped over the lazy dog.' }

      let(:tempfile) {
        file = Tempfile.new('file-part-test')
        file.write(data)
        file.seek(0)
        file
      }

      let(:path) { tempfile.path }

      describe '#size' do

        it 'returns the :size given the constructor, not the full file size' 


        it 'does not attempt to validate the :size against the file' 


      end

      describe '#read' do

        it 'returns the full part when #read is called without args' 


        it 'returns full part when #read called with num bytes exceede size' 


        it 'returns remaining part when #read called with num bytes past end' 


        it 'returns nil when #read is called with bytes from part end' 


        it 'returns "" when #read is called without bytes from part end' 


      end

      describe '#rewind' do

        it 'allows the file part to be re-read' 


      end

      describe '#close' do

        it 'closes the opened file handle' 


      end
    end
  end
end

