require_relative '../spec_helper'
require 'tempfile'

module Aws
  module S3
    describe Object do

      RSpec::Matchers.define :file_part do |expected|
        match do |actual|
          actual.source == expected[:source] &&
          actual.first_byte == expected[:offset] &&
          actual.last_byte == expected[:offset] + expected[:size] &&
          actual.size == expected[:size]
        end
      end

      let(:client) { S3::Client.new(stub_responses: true) }

      describe '#upload_file' do

        let(:one_meg) { 1024 * 1024 }

        let(:object) {
          S3::Object.new(
            bucket_name: 'bucket',
            key: 'key',
            client: client
          )
        }

        let(:one_mb) { '.' * 1024 * 1024 }

        let(:one_meg_file) {
          Tempfile.new('one-meg-file').tap do |f|
            f.write(one_mb)
            f.rewind
          end
        }

        let(:ten_meg_file) {
          Tempfile.new('one-meg-file').tap do |f|
            10.times { f.write(one_mb) }
            f.rewind
          end
        }

        let(:seventeen_meg_file) {
          Tempfile.new('one-meg-file').tap do |f|
            17.times { f.write(one_mb) }
            f.rewind
          end
        }

        describe 'accepts options without mutating them' do

          it 'uploads objects with custom options' 


        end

        describe 'small objects' do

          it 'uploads small objects using Client#put_object' 


          it 'accepts an alterative multipart file threshold' 


          it 'accepts paths to files to upload' 


        end

        describe 'large objects' do

          it 'uses multipart APIs for objects >= 15MB' 


          it 'raises an error if the multipart threshold is too small' 


          it 'automatically deletes failed multipart upload on error' 


          it 'reports when it is unable to abort a failed multipart upload' 


        end
      end
    end
  end
end

