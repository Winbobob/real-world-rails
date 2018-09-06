require_relative '../spec_helper'

module Aws
  describe CredentialProviderChain do

    let(:env) {{}}

    let(:config) {
      double('config',
        access_key_id: nil,
        secret_access_key: nil,
        session_token: nil,
        profile: nil,
        instance_profile_credentials_timeout: 1,
        instance_profile_credentials_retries: 0,
      )
    }

    let(:chain) { CredentialProviderChain.new(config) }

    let(:credentials) { chain.resolve }

    before(:each) do
      stub_const('ENV', env)
    end

    it 'defaults to nil when credentials not set' 


    it 'hydrates credentials from config options' 


    it 'hydrates credentials from ENV with prefix AWS_' 


    it 'hydrates credentials from ENV with prefix AMAZON_' 


    it 'hydrates credentials from ENV at AWS_ACCESS_KEY & AWS_SECRET_KEY' 


    it 'hydrates credentials from ENV at AWS_ACCESS_KEY_ID & AWS_SECRET_KEY' 


    it 'hydrates credentials from the shared credentials file' 


    it 'hydrates profile from ENV with AWS_PROFILE when available' 


    it 'hydrates credentials from the instance profile service' 


    describe 'with config set to nil' do
      let(:config) { nil }

      it 'defaults to nil' 


    end
    describe 'with shared credentials' do

      let(:path) { File.join('HOME', '.aws', 'credentials') }

      before(:each) do
        allow(File).to receive(:exist?).with(path).and_return(true)
        allow(File).to receive(:readable?).with(path).and_return(true)
        allow(Dir).to receive(:home).and_return('HOME')
      end

      it 'returns no credentials when the shared file is empty' 


      it 'returns no credentials when the shared file profile is missing' 


    end

  end
end

