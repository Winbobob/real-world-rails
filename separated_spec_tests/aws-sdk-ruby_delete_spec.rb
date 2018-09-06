require_relative '../spec_helper'

module Aws
  module S3
    describe Bucket do
      describe '#delete!' do
        let(:client) { S3::Client.new(stub_responses:true) }

        let(:bucket) { Bucket.new('bucket-name', client: client) }

        let(:list_object_versions_request) do
          {
            versions: [
              { key:'key', version_id:'vid-1'},
              { key:'key', version_id:'vid-3'},
              { key:'key', version_id:'vid-5'},
            ],
            delete_markers: [
              { key:'key', version_id:'vid-2'},
              { key:'key', version_id:'vid-4'},
            ]
          }
        end

        let(:delete_bucket_request) do
          {
            bucket: 'bucket-name',
            delete: {
              objects: match_array([
                { key: 'key', version_id: 'vid-1' },
                { key: 'key', version_id: 'vid-2' },
                { key: 'key', version_id: 'vid-3' },
                { key: 'key', version_id: 'vid-4' },
                { key: 'key', version_id: 'vid-5' },
              ])
            }
          }
        end

        context 'the bucket deletes without failure' do
          it 'deletes object versions from the bucket and then deletes the bucket' 

        end

        context 'the bucket raises a Errors::BucketNotEmpty exception' do
          let(:default_initial_wait) { 1.3 }
          let(:second_attempt_wait)  { default_initial_wait ** 2 }

          let(:bucket_not_empty_exception) do
            Errors::BucketNotEmpty.new nil, ''
          end

          it 'retries' 


          context 'the :initial_wait option is set' do
            let(:initial_wait) { 3 }

            it 'respects it' 

          end

          context 'the :max_attempts option is set' do
            let(:max_attempts) { 1 }

            it 'respects it' 

          end
        end
      end
    end
  end
end

