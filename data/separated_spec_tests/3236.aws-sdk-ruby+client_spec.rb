require_relative 'spec_helper'
require 'stringio'
require 'tempfile'

module Aws
  module S3
    describe Client do

      let(:client) { Client.new }

      before(:each) do
        Aws.config[:s3] = {
          region: 'us-east-1',
          credentials: Credentials.new('akid', 'secret'),
          retry_backoff: lambda {|*args| }
        }
      end

      after(:each) do
        Aws.config = {}
        S3::BUCKET_REGIONS.clear
      end

      it 'raises an appropriate error when credentials are missing' 


      describe 'request ids' do

        it 'populates request id and host id in the response context' 

        resp = s3.list_buckets
        expect(resp.context[:request_id]).to eq('BE9C18E622969B17')
        expect(resp.context[:s3_host_id]).to eq('H0vUEO2f4PyWtNjgcb3TSdyHaie8j4IgnuKIW2rw0nS41rawnLDzkf+PKXmmt/uEi4bzvNMr72o=')
        end

      end

      describe 'endpoints' do

        it 'preserves custom endpoints' 


        it 'resolves correctly for gov-cloud' 


      end

      describe 'http errors' do

        {
          304 => Errors::NotModified,
          400 => Errors::BadRequest,
          403 => Errors::Forbidden,
          404 => Errors::NotFound,
          412 => Errors::PreconditionFailed,
          500 => Errors::Http500Error,
        }.each_pair do |status_code, error_class|

          it "raises #{error_class} for HTTP #{status_code} responses" 


        end

      end

      describe 'unlinked tempfiles' do
        it 'can put an unlinked file descriptor' 

      end

      describe 'closed files' do

        it 'accepts closed File objects' 


        it 'accepts closed Tempfile objects' 


      end

      describe 'empty body error responses' do

        it 'creates an error class from empty body responses' 


      end

      describe 'signature version' do

        [
          "us-west-1",
          "us-west-2",
          "ap-northeast-1",
          "ap-southeast-1",
          "ap-southeast-2",
          "sa-east-1",
          "eu-west-1",
          "us-gov-west-1",
          "cn-north-1",
          "eu-central-1",
          "unknown-region",
        ].each do |region|

          it "defaults signature version 4 for #{region}" 


          it "forces v4 signing, even for PUT object in #{region}" 


          it "forces v4 signing when aws:kms used for server side encryption" 

        end

        it "uses signature version 4 when aws:kms used for sse" 


        it 'raises a runtime error on unsupported signature version' 


      end

      describe 'https required for sse cpk' do

        it 'raises a runtime error when attempting SSE CPK over HTTP' 


      end

      describe 'endpoints' do

        it 'resolves correctly for gov-cloud' 


      end

      describe 'invalid Expires header' do
        %w(get_object head_object).each do |method|

          it "correctly handled invalid Expires header for #{method}" 


          it 'accepts a stubbed Expires header as a Time value' 


          it 'accepts a stubbed Expires header as String value' 


        end
      end

      describe '#create_bucket' do

        it 'omits location constraint for the classic region' 


        it 'populates the bucket location constraint for non-classic regions' 


        it 'does not overide bucket location constraint params' 


      end

      describe '#delete_bucket' do

        it 'correctly unmarshals errors' 


      end

      describe '#get_bucket_location' do

        it 'can parse the location constraint XML' 


        it 'returns an empty string when no constraint is present' 


      end

      describe '#head_bucket' do

        it 'uses path style addressing for DNS incompatible bucket names' 


      end

      describe '#list_objects' do

        it 'raises an error of the bucket name contains a forward slash' 


        it 'request url encoded keys and decodes them by default' 


        it 'skips url decoding when the user specifies the encoding' 


      end

      describe '#list_object_versions' do

        it 'request url encoded keys and decodes them by default' 


      end

      describe '#list_multipart_uploads' do

        it 'request url encoded keys and decodes them by default' 


      end

      describe '#put_object_acl' do

        it 'builds the ACL xml from request params' 


      end

      describe '#put_object' do

        it 'populates the content-type header when given' 


      end

      describe '#put_object_acl' do

        it 'correct decodes url keys' 


      end

      describe 'truncated body checks' do

        it 'accepts responses where content-length equals bytes received' 


        it 'retries requests when fewer than content-length bytes are received' 


        it 'raises an error if fewer than content-length bytes are received' 


        it 'does not check content-length when header not present' 


      end

      describe '#wait_until' do

        it 'returns true when the :bucket_exists waiter receives a 301' 


      end

      {
        complete_multipart_upload: { upload_id: 'upload-id'},
        copy_object: { copy_source: 'bucket/key' },
        upload_part_copy: { upload_id: 'upload-id', copy_source: 'bucket/key', part_number: 1 },
      }.each do |operation_name, params|

        it "handles 200 http response errors from ##{operation_name}" 

      end

      context 'metadata stubbing' do
        it 'returns metadata from head operations' 

      end
    end
  end
end

