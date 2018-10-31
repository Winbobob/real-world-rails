require_relative '../../spec_helper'
require 'pp'

module Seahorse
  module Client
    describe Response do
      describe '#data' do

        it 'can be set' 


        it 'can be accessed via method_missing on the response' 


        it 'correctly answers respond_to?' 


      end

      describe '#context' do

        it 'defaults to a new context' 


        it 'can be set in the constructor' 


      end

      describe 'callbacks' do

        let(:http_resp) { Http::Response.new }

        let(:response) {
          Response.new(context: RequestContext.new(http_response: http_resp))
        }

        describe '#on' do

          it 'triggers the callback when status code matches' 


          it 'triggers the callback when status code included' 


          it 'does not trigger when when a response is not included' 


          it 'returns self' 


        end

      end
    end
  end
end

