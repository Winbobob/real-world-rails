require 'rails_helper'

RSpec.describe RailsHost do
  describe '.env' do
    subject { described_class.env }

    around do |example|
      with_env('staging') { example.run }
    end

    it 'returns value of environment variable ENV' 

  end

  context 'api_sandbox' do
    around do |example|
      with_env('api-sandbox') { example.run }
    end

    it 'should return the rails host envirobment name' 


    it 'should return true for api_sandbox?' 


    it 'should return false for demo' 


    it 'should raise method missing if invalid method name' 

  end

  context 'staging' do
    around do |example|
      with_env('staging') { example.run }
    end

    it 'should return the rails environement host name' 


    it 'should return true for staging?' 


    it 'should return false for demo' 

  end
end

