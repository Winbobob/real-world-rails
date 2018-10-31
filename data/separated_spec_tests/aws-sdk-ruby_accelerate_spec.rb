require_relative '../spec_helper'
require 'stringio'

module Aws
  module S3
    describe Client do

      let(:options) {{ stub_responses: true, region: 'us-east-1' }}

      let(:client) { Client.new(options) }

      let(:accelerated_client) { Client.new(options.merge(use_accelerate_endpoint: true)) }

      let(:accel_dualstack_client) {
        Client.new(
          options.merge(
            use_accelerate_endpoint: true, use_dualstack_endpoint: true
          )
        )
      }

      describe ':use_accelerate_endpoint' do

        it 'defaults to false' 


        it 'can be set in the constructor' 


        it 'can be set on the operation' 


        it 'can be disabled by the operation' 


        it 'does not apply to #create_bucket' 


        it 'does not apply to #list_buckets' 


        it 'does not apply to #delete_bucket' 


        it 'does not contain `expect` header in request' 

      end

      describe ':use_accelerate_endpoint with :use_dualstack_endpoint' do

        it 'properly uses the combined endpoint' 


        it 'does not apply to #create_bucket' 


        it 'does not apply to #list_buckets' 


        it 'does not apply to #delete_bucket' 


        it 'does not contain `expect` header in request' 

        
      end

    end
  end
end

