require 'rails_helper'

module Remote

  describe HttpClient do

    describe '.current' do

      context 'self.instance already exists' do
        it 'returns the instance' 

      end

      context 'self.instance does not already exist' do
        it 'calls new and returns the new instance' 


      end
    end

    describe 'base_url' do
      context 'base_url is specified in configure clause' do
        it 'uses the base url suppllied in the configure clause' 

      end

      context 'base_url _NOT_ specified in configure bloack' do
        it 'uses the base url from Settings' 

      end
    end

    describe '.get' do

      let(:api_url)  { 'my_api_url' }
      let(:api_key)  { 'my_key' }
      let(:path)     { 'my_path' }
      let(:query)    { { 'key' => 'value' } }
      let(:endpoint) { 'my_api_url/my_path?api_key=my_key&key=value' }

      before(:each) do
        HttpClient.configure do |client|
          client.base_url = api_url
          client.api_key = api_key
          client.logger = Rails.logger
          client.open_timeout = 2
          client.timeout = 4
        end
      end

      it 'calls execute on RestClient::Request' 

    end


  end
end

