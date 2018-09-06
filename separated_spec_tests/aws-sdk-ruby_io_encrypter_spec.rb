require_relative '../spec_helper'
require 'openssl'

module Aws
  module S3
    module Encryption
      describe IOEncrypter do

        let(:key) { Base64.decode64("kM5UVbhE/4rtMZJfsadYEdm2vaKFsmV2f5+URSeUCV4=") }

        let(:iv) { Base64.decode64("k8n8oF8ZNPRKAYY0RFqN2Q==") }

        let(:plain_text) { 'The quick brown fox jumps over the lazy dog.' }

        let(:cipher_text ) { Base64.decode64("MUeGuvB6IcjFo5VBWET659nWwx3+YH21HyVhF2Jf8bQ++2wvmtpXaGMJC2fae4j/") }

        let(:cipher) {
          cipher = OpenSSL::Cipher.new('AES-256-CBC')
          cipher.encrypt
          cipher.key = key
          cipher.iv = iv
          cipher
        }

        it 'encrypts an IO object' 


        it 'supports partial reads' 


        it 'caches the cipher-text of large objects to disk' 


        it 'supports re-reading from the cache file to enable retries' 


      end
    end
  end
end

