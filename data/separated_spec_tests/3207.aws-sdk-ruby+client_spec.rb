require_relative './spec_helper'

module Aws
  module RDS
    describe Client do

      let(:client) {
        Client.new(
          region: 'us-west-2',
          credentials: Credentials.new('akid', 'secret'),
          stub_responses: true
        )
      }

      describe 'presign_url' do

        it 'manages :destination_region and :pre_signed_url' 


      end
    end
  end
end

