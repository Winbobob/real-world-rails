require_relative '../spec_helper'

module Aws
  module S3
    describe Bucket do
      describe 'waiters' do

        let(:client) { S3::Client.new(stub_responses:true) }

        let(:bucket) { Bucket.new('bucket-name', client: client) }

        it 'yields the waiter to the given block' 


      end
    end
  end
end

