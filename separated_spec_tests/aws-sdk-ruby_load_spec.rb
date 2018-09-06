require_relative '../spec_helper'

module Aws
  module S3
    describe Bucket do
      describe '#load' do

        let(:client) { Client.new(stub_responses:true) }

        let(:bucket) { Bucket.new('aws-sdk', client: client) }

        it 'attempts to load the bucket via #list_buckets' 


        it 'returns self' 


        it 'raises an error if a bucket is not found' 


      end
    end
  end
end

