require_relative '../spec_helper'

module Aws
  module S3
    describe Client do

      let (:options) {{ stub_responses: true, region: 'us-west-2' }}

      let (:client) { Client.new(options) }

      let (:dualstack_client) { Client.new(options.merge(use_dualstack_endpoint: true)) }

      describe ':use_dualstack_endpoint' do

        it 'defaults to false' 


        it 'can be set in the constructor' 


        it 'can be set on the operation' 


        it 'can be disabled by the operation' 


        it 'works for global operations' 


        it 'works with HTTP endpoints' 


        it 'works with DNS incompatible buckets' 


        it 'works with DNS incompatible buckets in HTTP scheme' 


        it 'works with :force_path_style' 


        it 'uses the correct endpoint pattern for us-east-1' 


        it 'works for different dns suffixes' 

      end

    end
  end
end

