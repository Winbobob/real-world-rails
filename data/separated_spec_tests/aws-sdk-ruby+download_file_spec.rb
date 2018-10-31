require_relative '../spec_helper'
require 'tempfile'

module Aws
  module S3
    describe Object do

      let(:client) { S3::Client.new(stub_responses: true) }
      let(:tmpdir) { Dir.tmpdir }

      describe '#download_file' do

        let(:path) { Tempfile.new('destination').path }

        let(:small_obj) {
          S3::Object.new(
            bucket_name: 'bucket',
            key: 'small',
            client: client
          )
        }
        let(:large_obj) {
          S3::Object.new(
            bucket_name: 'bucket',
            key: 'large',
            client: client
          )
        }
        let(:single_obj) {
          S3::Object.new(
            bucket_name: 'bucket',
            key: 'single',
            client: client
          )
        }

        let(:one_meg) { 1024 * 1024 }
        let(:small_file) { Tempfile.new('small-file') }
        let(:large_file) { Tempfile.new('large-file') }
        let(:single_part_file) { Tempfile.new('single-part-file') }
        let(:version_id) { 'a-fake-version-id' }

        before(:each) do
          allow(Dir).to receive(:tmpdir).and_return(tmpdir)
          allow(client).to receive(:head_object).with(
              bucket: 'bucket',
              key: 'small',
              part_number: 1
            ).and_return(
              client.stub_data(:head_object, content_length: one_meg, parts_count: nil)
            )
          allow(client).to receive(:head_object).with(
              bucket: 'bucket',
              key: 'small',
              part_number: 1,
              version_id: version_id
            ).and_return(
              client.stub_data(:head_object, content_length: one_meg, parts_count: nil)
            )
          allow(client).to receive(:head_object).with(
              bucket: 'bucket',
              key: 'large',
              part_number: 1
            ).and_return(
              client.stub_data(:head_object, content_length: 5 * one_meg, parts_count: 4)
            )
          allow(client).to receive(:head_object).with(
              bucket: 'bucket',
              key: 'large',
            ).and_return(
              client.stub_data(:head_object, content_length: 20 * one_meg)
            )
          allow(client).to receive(:head_object).with(
              bucket: 'bucket',
              key: 'single',
              part_number: 1
            ).and_return(
              client.stub_data(:head_object, content_length: 15 * one_meg, parts_count: nil)
            )
        end

        it  'downloads single part files in Client#get_object' do
          expect(client).to receive(:get_object).with(
            bucket: 'bucket',
            key: 'small',
            response_target: path
          ).exactly(1).times

          small_obj.put(body: small_file)
          small_obj.download_file(path)
        end

        it 'download larger files in parts' 


        it 'download larger files in ranges' 


        it 'supports download object with version_id' 


        it 'raises an error if an invaild mode is specified' 


        it 'raises an error if choose :get_range without :chunk_size' 


        it 'raises an error if :chunk_size is larger than file size' 


      end
    end
  end
end

