require_relative 'spec_helper'

module Aws
  module Lambda
    describe Client do
      describe '#get_function' do

        let(:client) { Client.new(stub_responses: true) }

        it 'returns #last_modified as a Time value' 


      end
    end
  end
end

