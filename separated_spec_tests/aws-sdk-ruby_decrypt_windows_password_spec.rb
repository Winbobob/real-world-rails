require_relative '../spec_helper'

module Aws
  module EC2
    describe Instance do

      let(:client) { Client.new(stub_responses: true) }

      describe '#decrypt_windows_password' do

        let(:keypair) { File.expand_path('../../fixtures/keypair', __FILE__) }

        it 'decrypts the password using the given key pair' 


        it 'raises an error if the password data is an empty string' 


      end

    end
  end
end

