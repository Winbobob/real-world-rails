require_relative 'spec_helper'

module Aws
  module S3
    describe Presigner do

      before (:each) do
        Aws.config[:s3] = {
          region: 'us-east-1',
          credentials: Credentials.new(
            "AKIAIOSFODNN7EXAMPLE",
            "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"),
          retry_limit: 0
        }

        allow(Time).to receive(:now).and_return(now)
        allow(now).to receive(:utc).and_return(utc)
        allow(utc).to receive(:strftime).and_return(datetime)
      end

      after(:each) do
        Aws.config = {}
      end

      let(:client) { Aws::S3::Client.new }

      let(:now) { double('now') }
      let(:utc) { double('utc-time') }
      let(:datetime) { '20130524T000000Z' }


      describe '#initialize' do
        it 'accepts an injected S3 client' 


        it 'can be constructed without a client' 

      end

      describe "#presigned_url" do

        it 'raises an error if the key is blank' 


        it 'can presign #get_object to spec' 


        it 'raises when expires_in length is over 1 week' 


        it 'can generate http (non-secure) urls' 


        it 'uses the correct :endpoint scheme' 


      end
    end
  end
end

