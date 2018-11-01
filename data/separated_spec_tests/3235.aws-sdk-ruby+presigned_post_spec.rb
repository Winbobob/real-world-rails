require_relative 'spec_helper'
require 'base64'

module Aws
  module S3
    describe PresignedPost do

      let(:creds) { Credentials.new('akid', 'secret') }

      let(:region) { 'us-east-1' }

      let(:bucket) { 'bucket-name' }

      let(:options) {{}}

      let(:post) { PresignedPost.new(creds, region, bucket, options) }

      def decode(policy)
        Json.load(Base64.decode64(policy))
      end

      def policy(post)
        decode(post.fields['policy'])['conditions']
      end

      describe '#initialize' do

        it 'rejects unknown options' 


      end

      describe '#url' do

        it 'puts dns compatible bucket names in the host' 


        it 'puts dns compatible bucket name that contain dots in the path' 


        it 'puts non-dns compatible bucket name in the path' 


        it 'creates regionalized urls for other regions' 


      end

      describe 'key' do

        it 'is required' 


        it 'can be set via :key' 


        it 'can be set via :key_starts_with' 


        it 'can be set via #key' 


        it 'can be set via #key_starts_with' 


        it 'can be set via :allow_any' 


        it 'can be set via #allow_any' 


      end

      describe ':signature_expiration' do

        it 'defaults to one hour from now' 


        it 'can be set in the constructor' 


      end

      describe 'fields' do

        before(:each) do
          post.key('key')
        end

        it 'provides methods for setting fields or fields starts with' 


        it 'formats the Expires time value as httpdate' 


        it 'allows prefixed Expires' 


        it 'accepts a range for content_length_range' 


        it 'respects non-inclusive ranges' 


        it 'accepts a hash to :metadata' 


        it 'accepts a hash to :metadata_starts_with' 


        it 'computes a MD5 of the customer provided encryption key' 


        it 'does not computes MD5 for starts with' 


        it 'accepts ${filename} to eq' 


        it 'accepts ${filename} and removes it from the condition for starts with' 


        it 'requires ${filename} to be at the end of the value' 


        it 'accepts a list of fields to white-list' 


      end

      describe '#fields' do

        it 'returns a hash with a policy document and signature' 


        it 'generates a valid signature' 


        it 'adds x-amz-security-token as appropriate' 

        
        it 'sets the storage class if requested' 

      end
    end
  end
end

