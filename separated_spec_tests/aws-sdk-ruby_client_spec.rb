require_relative 'spec_helper'

module Aws
  module CloudWatchLogs
    describe Client do

      let(:client) { Client.new(stub_responses:true) }

      describe '#get_log_events' do

        it 'stops paginating when the next tokens are fixed' 

      end
    end
  end
end

