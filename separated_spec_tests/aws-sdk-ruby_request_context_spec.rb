require_relative '../../spec_helper'

module Seahorse
  module Client
    describe RequestContext do

      describe '#operation_name' do

        it 'defaults to nil' 


        it 'can be set in the constructor' 


      end

      describe '#params' do

        it 'defaults to a empty hash' 


        it 'can be set in the constructor' 


      end

      describe '#config' do

        it 'defaults to nil' 


        it 'can be set in the constructor' 


      end

      describe '#authorizer' do

        it 'defaults to nil' 


        it 'can be set in the constructor' 


      end

      describe '#retries' do

        it 'defaults to 0' 


        it 'can be incremented' 


      end

      describe '#http_request' do

        it 'defaults to a Http::Request object' 


        it 'can be set in the constructor' 


      end

      describe '#http_response' do

        it 'defaults to a Http::Response object' 


        it 'can be set in the constructor' 


      end

      describe 'metadata' do

        it 'returns nil for non-set keys' 


        it 'can be set via #[]=' 


      end
    end
  end
end

