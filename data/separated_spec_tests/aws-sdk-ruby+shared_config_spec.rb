require 'spec_helper'

module Aws
  describe SharedConfig do

    before(:each) do
      stub_const('ENV', {})
      allow(Dir).to receive(:home).and_raise(ArgumentError)
    end

    let(:mock_credential_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_credentials'))
    }

    let(:mock_config_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_config'))
    }

    context 'resolving config files' do
      before(:each) do
        allow(Dir).to receive(:home).and_return('HOME')
      end

      it 'defaults credentials_path to Dir.home/.aws/credentials' 


      it 'defaults config_path to Dir.home/.aws/config' 


      it 'will use the ENV variable AWS_SHARED_CREDENTIALS_FILE if set' 


      it 'will use the ENV variable AWS_CONFIG_FILE if set' 


      it 'will not load the shared config file if no ENV variable set' 

    end

    context 'resolving profile name' do
      it 'uses "default" as the default profile name' 


      it 'uses the ENV["AWS_PROFILE"] value before the default value' 


      it 'uses explicitly provided profile names over other choices' 

    end

    context 'region selection' do
      it 'does not resolve region if :config_enabled not set' 


      it 'does resolve region from config if :config_enabled set' 


      it 'will attempt to first resolve a region from credentials' 

    end

  end
end

