require_relative '../spec_helper'
require 'tempfile'

module Aws
  module S3
    describe Object do
      let(:client) { S3::Client.new(stub_responses: true) }

      describe '#upload_stream' do

        let(:object) {
          S3::Object.new(
            bucket_name: 'bucket',
            key: 'key',
            client: client
          )
        }

        let(:zero_mb) { '' }

        let(:one_mb) { '.' * 1024 * 1024 }

        let(:ten_mb) {
          one_mb * 10
        }

        let(:seventeen_mb) {
          one_mb * 17
        }

        it 'can upload empty stream' 


        it 'uses multipart APIs' 


        it 'uploads the correct parts' 


        it 'uploads the correct parts when input is chunked' 


        it 'uploads the correct parts when input is chunked with custom part_size' 


        it 'passes stringios with correct contents to upload_part with custom part_size' 


        it 'passes stringios with correct contents to upload_part' 


        it 'automatically deletes failed multipart upload on error' 


        it 'reports when it is unable to abort a failed multipart upload' 


        context 'with tempfile option' do
          it 'uses multipart APIs' 


          it 'uploads the correct parts' 


          it 'uploads the correct parts when input is chunked' 


          it 'passes tempfiles with correct contents to upload_part' 


          it 'automatically deletes failed multipart upload on error' 


          it 'reports when it is unable to abort a failed multipart upload' 

        end
      end
    end
  end
end

