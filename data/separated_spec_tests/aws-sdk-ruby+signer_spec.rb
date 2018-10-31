require_relative 'spec_helper'

require 'tempfile'

module Aws
  module Sigv4
    describe Signer do

      let(:credentials) {{
        access_key_id: 'akid',
        secret_access_key: 'secret',
      }}

      let(:options) {{
        service: 'SERVICE',
        region: 'REGION',
        credentials_provider: StaticCredentialsProvider.new(credentials),
      }}

      context '#service' do

        it 'requires a service' 


        it 'accepts a string' 


      end

      context '#region' do

        it 'requires a region' 


        it 'accepts a string' 


      end

      describe '#credentials' do

        let(:options) {{ service: 'ec2', region: 'us-east-1' }}

        it 'requires credentials' 


        it 'accepts :access_key_id and :secret_access_key' 


        it 'accepts credentials with a session token' 


        it 'accepts :credentials' 


        it 'accepts :credentials_provider' 


      end

      context '#sign_request' do

        it 'populates the Host header' 


        it 'includes HTTP port in Host when not 80' 


        it 'includes HTTPS port in Host when not 443' 


        it 'sets the X-Amz-Date header' 


        it 'uses the X-Amz-Date header of the request if present' 


        it "populates the 'X-Amz-Security-Token' header with session token" 


        it "omits 'X-Amz-Security-Token' header when session token is nil" 


        it 'adds the X-Amz-Content-Sha256 header by default' 


        it 'can omit the X-Amz-Content-Sha256 header' 


        it 'computes the checksum of files without loading them into memory' 


        it 'reads non-file IO objects into  memory to compute checksusm' 


        it 'does not read the body if X-Amz-Content-Sha256 if already present' 


        it "populates the 'Authorization' header" 


        it 'signs the request' 


      end

      context ':canonical_request' do

        it 'lower-cases and sort all header keys except authorization' 


        it 'can ignore configured headers' 


        it 'lower-cases and sorts header by key except authorization' 


        it 'prunes expanded whitespace in header values' 


        it 'leaves whitespace in quoted values in-tact' 


        it 'normalizes valueless-querystring keys with a trailing =' 


        it 'sorts the query parameters' 


        it 'sorts by name, params with same name stay in the same order' 


        it 'uses the X-Amz-Content-Sha256 header when present' 


      end
    end
  end
end

