require_relative '../spec_helper'

module Aws
  module S3
    describe Bucket do
      describe '#url' do

        let(:options) {{
          region:'us-east-1',
          access_key_id:'akid',
          secret_access_key:'secret'
        }}

        let(:client) { Client.new(options) }

        it 'returns a HTTPS url for the bucket' 


        it 'uses the configured endpoint as the domain' 


        it 'uses path-style addressing when the bucket name is not dns-compatible' 


        it 'uses path-style addressing when the dns-compat bucket name contains dots' 


        it 'uses dns style with dotted bucket names and https (non-ssl)' 


        it 'observes configuration around path style' 


      end
    end
  end
end

