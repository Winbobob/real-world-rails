require_relative 'spec_helper'

module Aws
  module CloudFront
    describe UrlSigner do

      let(:options) {
        {
          :key_pair_id => "CF_KEYPAIR_ID",
          :private_key_path =>"#{File.dirname(__FILE__)}/cf_private_key.pem"
        }
      }
      let(:signer) { Aws::CloudFront::UrlSigner.new(options) }
      let(:expires) { 1357034400 } # January 1, 2013 10:00 am UTC (Unix timestamp)

      describe '#initialize' do
        it 'requires key pair id' 

        it 'requires either private key or its path' 

      end

      describe '#signed_url' do
        it 'raises error if url is invaild' 

        it 'can generate signed urls with custom policy' 

        it 'can generate signed urls with canned policy' 

        it 'can generate signed rtmp urls' 

      end
    end
  end
end

