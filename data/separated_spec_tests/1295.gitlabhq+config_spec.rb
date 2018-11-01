require 'spec_helper'

describe Gitlab::Auth::LDAP::Config do
  include LdapHelpers

  let(:config) { described_class.new('ldapmain') }

  describe '.servers' do
    it 'returns empty array if no server information is available' 

  end

  describe '#initialize' do
    it 'requires a provider' 


    it 'works' 


    it 'raises an error if a unknown provider is used' 

  end

  describe '#adapter_options' do
    it 'constructs basic options' 


    it 'includes authentication options when auth is configured' 


    it 'sets encryption method to simple_tls when configured as simple_tls' 


    it 'sets encryption method to start_tls when configured as start_tls' 


    context 'when verify_certificates is enabled' do
      it 'sets tls_options to OpenSSL defaults' 

    end

    context 'when verify_certificates is disabled' do
      it 'sets verify_mode to OpenSSL VERIFY_NONE' 

    end

    context 'when ca_file is specified' do
      it 'passes it through in tls_options' 

    end

    context 'when ca_file is a blank string' do
      it 'does not add the ca_file key to tls_options' 

    end

    context 'when ssl_version is specified' do
      it 'passes it through in tls_options' 

    end

    context 'when ssl_version is a blank string' do
      it 'does not add the ssl_version key to tls_options' 

    end
  end

  describe '#omniauth_options' do
    it 'constructs basic options' 


    it 'includes authentication options when auth is configured' 


    context 'when verify_certificates is enabled' do
      it 'specifies disable_verify_certificates as false' 

    end

    context 'when verify_certificates is disabled' do
      it 'specifies disable_verify_certificates as true' 

    end

    context 'when ca_file is present' do
      it 'passes it through' 

    end

    context 'when ca_file is blank' do
      it 'does not include the ca_file option' 

    end

    context 'when ssl_version is present' do
      it 'passes it through' 

    end

    context 'when ssl_version is blank' do
      it 'does not include the ssl_version option' 

    end
  end

  describe '#has_auth?' do
    it 'is true when password is set' 


    it 'is true when bind_dn is set and password is empty' 


    it 'is false when password and bind_dn are not set' 

  end

  describe '#attributes' do
    it 'uses default attributes when no custom attributes are configured' 


    it 'merges the configuration attributes with default attributes' 

  end

  describe '#base' do
    context 'when the configured base is not normalized' do
      it 'returns the normalized base' 

    end

    context 'when the configured base is normalized' do
      it 'returns the base unaltered' 

    end

    context 'when the configured base is malformed' do
      it 'returns the base unaltered' 

    end

    context 'when the configured base is blank' do
      it 'returns the base unaltered' 

    end
  end
end

