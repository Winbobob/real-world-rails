require_relative '../spec_helper'
require 'base64'
require 'openssl'

module Aws
  module S3
    module Encryption
      describe Client do

        let(:master_key) {
          Base64.decode64("kM5UVbhE/4rtMZJfsadYEdm2vaKFsmV2f5+URSeUCV4=")
        }

        let(:api_client) {
          S3::Client.new(
            access_key_id: 'akid',
            secret_access_key: 'secret',
            region: 'us-west-1',
            retry_backoff: lambda { |c| }, # disable failed request retries
          )
        }

        let(:options) {{ client: api_client, encryption_key: master_key }}

        let(:client) { Encryption::Client.new(options) }

        describe 'configuration' do

          it 'constructs a default s3 client when one is not given' 


          it 'accepts vanilla client options' 


          it 'requires an encryption key or provider' 


          it 'consturcts a key provider from a master key' 


          it 'defaults :envelope_location to :metadata' 


          it 'requires :envelope_location to be :metadata or :instruction_file' 


          it 'requires :materials_description to be a valid JSON document' 


          it 'defaults :instruction_file_suffix to ".instruction"' 


          it 'requires :instruction_file_suffix to be a string' 


        end

        describe 'encryption methods' do

          # this is the encrypted string "secret" using the fixed envelope
          # keys defined below in the before(:each) block
          let(:encrypted_body) { Base64.decode64("JIgXCTXpeQerPLiU6dVL4Q==") }

          before(:each) do
            key = Base64.decode64("uSwsRlIMhY1klVYrgqceqjmQMmARcNl7rEKWW+7HVvA=")
            iv = Base64.decode64("TO5mQgtOzWkTfoX4RE5tsA==")
            allow_any_instance_of(OpenSSL::Cipher).to receive(:random_key).and_return(key)
            allow_any_instance_of(OpenSSL::Cipher).to receive(:random_iv).and_return(iv)
          end

          describe '#put_object' do

            it 'encrypts the data client-side' 


            it 'encrypts an empty or missing body' 


            it 'can store the encryption envelope in a separate object' 


            it 'accpets a custom instruction file suffix' 


            it 'moves the un-encrypted md5 to a new header' 


            it 'supports encryption with an asymmetric key pair' 


            it 'raises an error on an invalid encryption key' 


          end

          describe '#get_object' do

            def stub_encrypted_get(matdesc = '{}')
              stub_request(:get, "https://bucket.s3.us-west-1.amazonaws.com/key").
                to_return(
                  body: encrypted_body,
                  headers: {
                    'X-Amz-Meta-X-Amz-Key'=>'gX+a4JQYj7FP0y5TAAvxTz4e2l0DvOItbXByml/NPtKQcUlsoGHoYR/T0TuYHcNj',
                    'X-Amz-Meta-X-Amz-Iv' => 'TO5mQgtOzWkTfoX4RE5tsA==',
                    'X-Amz-Meta-X-Amz-Matdesc' => matdesc,
                  }
                )
            end

            def stub_encrypted_get_chunked
              cipher = OpenSSL::Cipher::AES256.new(:CBC)
              cipher.encrypt
              cipher.key = Base64.decode64("uSwsRlIMhY1klVYrgqceqjmQMmARcNl7rEKWW+7HVvA=")
              cipher.iv = Base64.decode64("TO5mQgtOzWkTfoX4RE5tsA==")
              encrypted_body = cipher.update('0' * 50) + cipher.final
              stub_request(:get, "https://bucket.s3.us-west-1.amazonaws.com/key").to_return(
                body: encrypted_body,
                headers: {
                  'X-Amz-Meta-X-Amz-Key'=>'gX+a4JQYj7FP0y5TAAvxTz4e2l0DvOItbXByml/NPtKQcUlsoGHoYR/T0TuYHcNj',
                  'X-Amz-Meta-X-Amz-Iv' => 'TO5mQgtOzWkTfoX4RE5tsA==',
                  'X-Amz-Meta-X-Amz-Matdesc' => '{}',
                }
              )
            end

            def stub_encrypted_get_with_instruction_file(suffix = '.instruction')
              stub_request(:get, "https://bucket.s3.us-west-1.amazonaws.com/key").
                to_return(body: encrypted_body)
              stub_request(:get, "https://bucket.s3.us-west-1.amazonaws.com/key#{suffix}").
                to_return(
                  :body => Json.dump(
                    'x-amz-key'=>'gX+a4JQYj7FP0y5TAAvxTz4e2l0DvOItbXByml/NPtKQcUlsoGHoYR/T0TuYHcNj',
                    'x-amz-iv' => 'TO5mQgtOzWkTfoX4RE5tsA==',
                    'x-amz-matdesc' => '{}',
                  )
                )
            end

            it 'decrypts the object' 


            it 'decrypts the object with response target under retry' 


            it 'supports #get_object with a block' 


            it 'does not attempt to decrypt failed responses' 


            it 'loads envelope from instruction file when not found in metadata' 


            it 'users the configured instruction file suffix' 


            it 'gets the instruction file first with loc :instruction_file' 


            it 'accepts :envelope_location, overriding the default location' 


            it 'accepts :instruction_file_suffix, overriding the default location' 


            it 'supports multiple master keys with a key provider' 


            it 'raises an error when materials can not be found' 


            it 'resets the cipher during decryption on error' 


            it 'raises an error when it is unable to decrypt the envelope' 


            it  'validates the key length' do
              stub_encrypted_get
              options[:encryption_key] = '.' * 31
              msg = 'invalid key, symmetric key required to be 16, 24, or 32 bytes in length, saw length 31'
              expect {
                client.get_object(bucket:'bucket', key:'key')
              }.to raise_error(ArgumentError, msg)
            end

            it 'supports asymmetric keys' 


            it 'does not support get with range' 


          end
        end

        describe 'kms_CBC' do

          let(:kms_client) { KMS::Client.new(stub_responses:true) }

          let(:client) do
            Encryption::Client.new({
              kms_key_id: 'kms-key-id',
              kms_client: kms_client,
              stub_responses: true,
            })
          end

          let(:envelope) {{
            "x-amz-wrap-alg" => "kms",
            "x-amz-cek-alg" => "AES/CBC/PKCS5Padding",
            "x-amz-iv" => "rVucSqIJvenVa7HliO+oIw==",
            "x-amz-key-v2" => Base64.strict_encode64("encrypted-object-key"),
            "x-amz-matdesc" => "{\"kms_cmk_id\":\"kms-key-id\"}",
          }}

          let(:plaintext_object_key) {
            "\xE4^\xE3\xE0v@\x8Aq\xAF\xE7y\x10\x18\xD4X\xC2\xDC&\xF6\xDB\xCCM\x03\xAF3DD\xFF\xDA\x0Flj"
          }

          let(:encrypted_object_key) { 'encrypted-object-key' }

          let(:random_iv) { Base64.decode64("rVucSqIJvenVa7HliO+oIw==") }

          before(:each) do
            allow_any_instance_of(OpenSSL::Cipher).to(
              receive(:random_iv).
              and_return(random_iv)
            )
          end

          it 'supports encryption via KMS' 


          it 'supports decryption via KMS w/ CBC' 


        end

        describe 'kms_GCM' do

          let(:kms_client) { KMS::Client.new(stub_responses:true) }

          let(:client) do
            Encryption::Client.new({
                                       kms_key_id: 'kms-key-id',
                                       kms_client: kms_client,
                                       stub_responses: true,
                                   })
          end

          let(:headers) {{
              "x-amz-meta-x-amz-wrap-alg" => "kms",
              "x-amz-meta-x-amz-cek-alg" => "AES/GCM/NoPadding",
              "x-amz-meta-x-amz-iv" => "XujE1oWCO83rw1PU",
              "x-amz-meta-x-amz-key-v2" => Base64.strict_encode64("encrypted-object-key"),
              "x-amz-meta-x-amz-matdesc" => "{\"kms_cmk_id\":\"kms-key-id\"}",
              "x-amz-meta-x-amz-tag-len" => "128",
              "content-length" => body.bytesize,
          }}

          let(:body) { Base64.decode64("ZpPUtKX0PPupGaE0o7FbJw2Ov53MXfqenLA=") }

          let(:plaintext_object_key) {
            "\xACb.\xEB\x16\x19(\x9AJ\xE0uCA\x034z\xF6&\x7F\x8E\x0E\xC0\xD5\x1A\x88\xAF2\xB1\xEEg#\x15"
          }

          if !ENV['TRAVIS'] && RUBY_VERSION > '1.9.3'
            it 'supports decryption via KMS w/ GCM' 

          end

        end
      end
    end
  end
end

