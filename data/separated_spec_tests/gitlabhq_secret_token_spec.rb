require 'spec_helper'
require_relative '../../config/initializers/secret_token'

describe 'create_tokens' do
  include StubENV

  let(:secrets) { ActiveSupport::OrderedOptions.new }

  HEX_KEY = /\h{128}/
  RSA_KEY = /\A-----BEGIN RSA PRIVATE KEY-----\n.+\n-----END RSA PRIVATE KEY-----\n\Z/m

  before do
    allow(File).to receive(:write)
    allow(File).to receive(:delete)
    allow(Rails).to receive_message_chain(:application, :secrets).and_return(secrets)
    allow(Rails).to receive_message_chain(:root, :join) { |string| string }
    allow(self).to receive(:warn)
    allow(self).to receive(:exit)
  end

  context 'setting secret keys' do
    context 'when none of the secrets exist' do
      before do
        stub_env('SECRET_KEY_BASE', nil)
        allow(File).to receive(:exist?).with('.secret').and_return(false)
        allow(File).to receive(:exist?).with('config/secrets.yml').and_return(false)
        allow(self).to receive(:warn_missing_secret)
      end

      it 'generates different hashes for secret_key_base, otp_key_base, and db_key_base' 


      it 'generates an RSA key for openid_connect_signing_key' 


      it 'warns about the secrets to add to secrets.yml' 


      it 'writes the secrets to secrets.yml' 


      it 'does not write a .secret file' 

    end

    context 'when the other secrets all exist' do
      before do
        secrets.db_key_base = 'db_key_base'
        secrets.openid_connect_signing_key = 'openid_connect_signing_key'

        allow(File).to receive(:exist?).with('.secret').and_return(true)
        allow(File).to receive(:read).with('.secret').and_return('file_key')
      end

      context 'when secret_key_base exists in the environment and secrets.yml' do
        before do
          stub_env('SECRET_KEY_BASE', 'env_key')
          secrets.secret_key_base = 'secret_key_base'
          secrets.otp_key_base = 'otp_key_base'
          secrets.openid_connect_signing_key = 'openid_connect_signing_key'
        end

        it 'does not issue a warning' 


        it 'uses the environment variable' 


        it 'does not update secrets.yml' 

      end

      context 'when secret_key_base and otp_key_base exist' do
        before do
          secrets.secret_key_base = 'secret_key_base'
          secrets.otp_key_base = 'otp_key_base'
          secrets.openid_connect_signing_key = 'openid_connect_signing_key'
        end

        it 'does not write any files' 


        it 'sets the the keys to the values from the environment and secrets.yml' 


        it 'deletes the .secret file' 

      end

      context 'when secret_key_base and otp_key_base do not exist' do
        before do
          allow(File).to receive(:exist?).with('config/secrets.yml').and_return(true)
          allow(YAML).to receive(:load_file).with('config/secrets.yml').and_return('test' => secrets.to_h.stringify_keys)
          allow(self).to receive(:warn_missing_secret)
        end

        it 'uses the file secret' 


        it 'keeps the other secrets as they were' 


        it 'warns about the missing secrets' 


        it 'deletes the .secret file' 

      end
    end

    context 'when db_key_base is blank but exists in secrets.yml' do
      before do
        secrets.otp_key_base = 'otp_key_base'
        secrets.secret_key_base = 'secret_key_base'
        yaml_secrets = secrets.to_h.stringify_keys.merge('db_key_base' => '<%= an_erb_expression %>')

        allow(File).to receive(:exist?).with('.secret').and_return(false)
        allow(File).to receive(:exist?).with('config/secrets.yml').and_return(true)
        allow(YAML).to receive(:load_file).with('config/secrets.yml').and_return('test' => yaml_secrets)
        allow(self).to receive(:warn_missing_secret)
      end

      it 'warns about updating db_key_base' 


      it 'warns about the blank value existing in secrets.yml and exits' 


      it 'does not update secrets.yml' 

    end
  end
end

