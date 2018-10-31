require_relative 'spec_helper'

module Aws
  module CloudFront
    describe CookieSigner do

      let(:options) {
        {
          :key_pair_id => "CF_KEYPAIR_ID",
          :private_key_path =>"#{File.dirname(__FILE__)}/cf_private_key.pem"
        }
      }
      let(:signer) { Aws::CloudFront::CookieSigner.new(options) }
      let(:expires) { 1357034400 } # January 1, 2013 10:00 am UTC (Unix timestamp)

      describe '#signed_cookie' do
        it 'raises error if url is invaild' 

        it 'can generate signed urls with custom policy' 

        it 'can generate signed cookies with canned policy' 

      end
    end
  end
end

