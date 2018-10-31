require_relative 'spec_helper'

module Aws
  module IAM
    describe Resource do

      let(:client) { Client.new(stub_responses: true) }

      let(:iam) { Resource.new(client: client) }

      describe '#delete_account_alias' do

        it 'deletes the first account alias, iam only returns one' 


        it 'returns false when there is no account alias' 


      end
    end
  end
end

