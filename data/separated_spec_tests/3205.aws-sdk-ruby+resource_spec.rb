require_relative 'spec_helper'

module Aws
  module EC2
    describe Resource do

      let(:client) { Client.new(stub_responses: true) }

      let(:ec2) { Resource.new(client: client) }

      describe '#create_tags' do

        it 'returns a batch of created tags, the product of ids and tags' 


      end
    end
  end
end

