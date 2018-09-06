require_relative '../spec_helper'
require 'thread'

module Aws
  module S3
    describe Object do
      let(:object) { S3::Object.new('bucket', 'unescaped/key path', stub_responses: true) }
      let(:client) { object.client }

      describe '#copy_to' do
        it 'accepts a string source' 


        it 'accepts a hash source' 


        it 'accepts a hash source' 


        it 'accept a hash with options merged' 


        it 'accepts an S3::Object source' 


        it 'accepts additional options' 


        it 'raises an error on an invalid targets' 

      end

      describe '#copy_from' do
        context 'with multipart_copy: false' do
          it 'supports the deprecated form' 


          it 'accepts a string source' 


          it 'accepts a hash source' 


          it 'accepts a hash source with version id' 


          it 'accept a hash with options merged' 


          it 'accepts an S3::Object source' 


          it 'accepts an S3::ObjectSummary source' 


          it 'accepts an S3::ObjectVersion source' 


          it 'accepts additional options' 


          it 'raises an error on an invalid source' 

        end

        context 'with version_id and multipart_copy: true' do
          before(:each) do
            size = 300 * 1024 * 1024 # 300MB
            allow(client).to receive(:head_object).with(
              bucket: 'source-bucket',
              key: 'source key',
              version_id: 'source-version-id'
            ).and_return(client.stub_data(:head_object, content_length: size))
          end

          it 'performs multipart uploads for a versioned object' 

        end

        context 'with multipart_copy: true' do
          before(:each) do
            size = 300 * 1024 * 1024 # 300MB
            allow(client).to receive(:head_object).with(
              bucket: 'source-bucket',
              key: 'source key'
            ).and_return(client.stub_data(:head_object, content_length: size))
          end

          it 'performs multipart uploads when :multipart_copy is true' 


          it 'supports alternative part sizes' 


          it 'aborts the upload on errors' 


          it 'rejects files smaller than 5MB' 


          it 'accepts file size option to avoid HEAD request' 


          context 'when the target and source objects are in different regions' do
            let(:content_length) { 10 * 1024 * 1024 }

            let(:source_region) { 'ap-southeast-1' }

            let(:source_bucket) { 'source-bucket' }
            let(:target_bucket) { 'target-bucket' }

            let(:key) { 'my/source-key' }

            let(:source_client) { S3::Client.new(stub_responses: true) }
            let(:target_client) { S3::Client.new(stub_responses: true) }

            let(:source_object) { S3::Object.new(bucket_name: source_bucket, key: key, client: source_client) }
            let(:target_object) { S3::Object.new(bucket_name: target_bucket, key: key, client: target_client) }

            let(:head_response) { double Types::HeadObjectOutput, content_length: content_length }

            before do
              allow(source_client).to receive(:head_object).and_return(head_response)
            end

            context 'and the source is an S3::Object' do
              it 'queries the content length of the source object from the source region' 

            end

            context 'and the source is a Hash' do
              let(:source_hash) { { bucket: source_bucket, key: key } }

              it 'the :copy_source_client option value is used to query content_length' 


              it 'the :copy_source_region option value is used to construct a client used to query content_length' 

            end

            context 'and the source is a String' do
              let(:source_string) { "#{source_bucket}/#{key}" }

              it 'the :copy_source_client option value is used to query content_length' 


              it 'the :copy_source_region option value is used to construct a client used to query content_length' 

            end
          end

          it 'does not modify given options' 


        end
      end
    end
  end
end

