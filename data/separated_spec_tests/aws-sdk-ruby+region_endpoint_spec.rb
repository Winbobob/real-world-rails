require_relative '../../spec_helper'

module Aws
  module Plugins
    describe RegionalEndpoint do

      RegionalEndpointClient = ApiHelper.sample_service.const_get(:Client)

      let(:env) {{}}

      let(:client_class) { RegionalEndpointClient }

      before do
        stub_const("ENV", env)
      end

      describe 'region option' do

        it 'adds a :region configuration option' 


        it 'defaults to ENV["AWS_DEFAULT_REGION"]' 


        it 'defaults to ENV["AWS_REGION"]' 


        it 'falls back to ENV["AMAZON_REGION"]' 


        it 'prefers AWS_REGION to AMAZON_REGION or AWS_DEFAULT_REGION' 


        it 'prefers AWS_REGION to AMAZON_REGION' 


        it 'can be set directly, overriding the ENV["AWS_REGION"]' 


        it 'raises an argument error when not set' 


        it 'raises an argument error when set to nil' 


      end

      describe 'endpoint option' do

        it 'defaults the endpoint to PREFIX.REGION.amazonaws.com' 


      end
    end
  end
end

