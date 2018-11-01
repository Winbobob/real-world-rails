require_relative 'spec_helper'

module Aws
  module Route53
    describe Client do

      let(:credentials) { Credentials.new('akid', 'secret') }

      let(:client) {
        Client.new(
          region: 'us-west-2',
          credentials: credentials,
          retry_limit: 0
        )
      }

      describe '#list_resource_record_sets' do

        it 'removes the prefix from the :hosted_zone_id' 


      end

      describe '#delete_hosted_zone' do

        it 'removes the prefix from the :id' 


      end

      describe '#change_resource_record_sets' do

        it 'removes prefixes from the nested targets' 


        it 'removes prefixes from the nested targets when params is typeof ChangeResourceRecordSetsRequest' 

      end

      describe '#get_traffic_policy' do
        it 'supports integer versions' 

      end
    end
  end
end

