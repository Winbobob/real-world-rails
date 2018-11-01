require_relative 'spec_helper'
require 'zlib'

module Aws
  module DynamoDB
    describe Client do

      let(:opts) {{
        credentials: Credentials.new('akid', 'secret'),
        region: 'us-west-2',
      }}

      let(:ddb) { Client.new(opts) }

      describe ':simple_attributes' do

        it 'simple attributes mode is enabled by default' 


        it 'can be disabled' 


        it 'marshals given attribute values' 


        it 'unmarshals returned attribute values' 


        it 'avoids double-marshaling of structs' 

      end

      describe 'CRC32' do
        it 'rejects responses with an invalid crc32 header' 


        it 'accepts responses with a valid crc32 header' 


        it 'retries crc32 failures' 


      end

      describe '#stub_responses' do

        it 'accepts the simplified attribute format' 


      end

      describe '#enumerable responses' do

        it 'can round trip paging params that contain item attributes' 


      end

      describe '#stub_data' do

        it 'accepts and returns simple attributes' 


        it 'observes the :simple_attributes configuration option' 


        it 'can be called without data' 


        it 'parses errors from DynamoDB __type' 


      end
    end
  end
end

