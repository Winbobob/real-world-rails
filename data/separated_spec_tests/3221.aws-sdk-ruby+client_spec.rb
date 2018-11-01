require_relative 'spec_helper'

module Aws
  module MachineLearning
    describe Client do

      let(:client) { Client.new(stub_responses:true) }

      describe '#predict' do

        it 'uses the :predict_endpoint parameter as the http endpoint' 


      end
    end
  end
end

