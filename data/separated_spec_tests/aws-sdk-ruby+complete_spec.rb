require_relative '../spec_helper'

module Aws
  module S3
    describe MultipartUpload do
      describe '#complete' do

        let(:client) { S3::Client.new(stub_responses:true) }

        let(:upload) { MultipartUpload.new('bucket', 'key', 'id', client: client) }

        it 'calls complete with the given part list' 


        it 'computes the part list when instructed' 


      end
    end
  end
end

