require_relative '../spec_helper'

module Aws
  describe 'Client' do
    describe 'response stubbing' do

      ResponseStubbingExample = ApiHelper.sample_service

      let(:options) {{
        stub_responses: true,
        region: 'us-east-1',
        access_key_id: 'akid',
        secret_access_key: 'secret',
      }}

      let(:client_class) { ResponseStubbingExample.const_get(:Client) }

      let(:client) { client_class.new(options) }

      it 'requires a region' 


      it 'raises a helpful error on possible incorrect regions' 



      it 'skips the credential provider chain' 


      it 'raises an error if stubbed_responses is not enabled' 


      it 'returns stubbed responses without making a request' 


      it 'accepts a list of stubs' 


      it 'returns the same stub multiple times' 


      it 'returns the last stub after mulitple times' 


      it 'can stub errors' 


      it 'can stub errors and data' 


      it 'accepts stubs given to the constructor' 


      context 'api requests' do 
        ApiRequestsStubbingExample = ApiHelper.sample_rest_xml
        let(:client_class) { ApiRequestsStubbingExample.const_get(:Client) }
        let(:client) { client_class.new(options) }

        it 'allows api requests to be logged when stubbed' do 
          expect(client.api_requests.empty?).to be(true)
          client.create_bucket(bucket:'aws-sdk')
          expect(client.api_requests.length).to eq(1)
          
          log_obj = client.api_requests[0]
          expect(log_obj[:operation_name]).to eq(:create_bucket)
          expect(log_obj[:params]).to eq({:bucket=>"aws-sdk"})
          expect(log_obj[:context].metadata).to eq({
                                                    :gem_name=>"aws-sdk-sampleapi2",
                                                    :gem_version=>"1.0.0",
                                                    :response_target=>nil, 
                                                    :original_params=>{:bucket=>"aws-sdk"},
                                                    :request_id=>"stubbed-request-id"
                                                  })
        end

        it 'raises an error when accessing api requests of a non stubbed client' do 
          client = client_class.new(options.merge(stub_responses: false))
          expect {
            client.api_requests
          }.to raise_error(NotImplementedError)
        end

      end

    end
  end
end

