require_relative 'spec_helper'

module Aws
  module SQS
    describe Client do

      let(:client) { Client.new }

      before(:each) do
        Aws.config[:sqs] = {
          region: 'us-east-1',
          credentials: Credentials.new('akid', 'secret'),
          retry_limit: 0
        }
      end

      after(:each) do
        Aws.config = {}
      end

      describe 'empty XML result element' do

        it 'returns a structure with all of the root members' 


      end

      describe '#stub_responses' do

        it 'supports stubbing flattened maps' 


      end
    end
  end
end

