require_relative 'spec_helper'

module Aws
  module Glacier
    describe Client do

      let(:client) { Client.new(stub_responses: true) }

      it 'marshalls timestamps as iso8601 strings' 


      it 'handles seeked io objects in :upload_archive' 


      describe 'api verison' do

        it 'sends the API version as a header' 


      end

      describe 'errors' do

        it 'extracts the error code form the header' 


      end

      describe ':account_id' do

        it 'defaults to -' 


        it 'can be configured by default' 


        it 'can be specified per operation by default' 


      end
    end
  end
end

