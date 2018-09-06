require_relative '../spec_helper'

module Aws
  module S3
    describe Object do
      describe '#public_url' do

        let(:opts) {{
          region: 'us-east-1',
          access_key_id: 'akid',
          secret_access_key: 'secret'
        }}

        let(:s3) { S3::Resource.new(opts) }

        it 'generates a basic endpoint' 


        it 'uses the clients configured s3 endpoint' 


        it 'preserves the path portion of custom endpoints' 


        it 'allows the user to force path-style addressing' 


        it 'url-encodes the path portions of the object key, preserving /' 


        it 'url-encodes the bucket name' 


        it 'puts DNS-compatible bucket names in host' 


        it 'puts DNS-incompatible bucket names in the path' 


        it 'puts bucket with dotted names in the path' 


      end
    end
  end
end

