require 'spec_helper'

describe Gitlab::Auth::OAuth::Provider do
  describe '.enabled?' do
    before do
      allow(described_class).to receive(:providers).and_return([:ldapmain, :google_oauth2])
    end

    context 'when OmniAuth is disabled' do
      before do
        allow(Gitlab::Auth).to receive(:omniauth_enabled?).and_return(false)
      end

      it 'allows database auth' 


      it 'allows LDAP auth' 


      it 'does not allow other OmniAuth providers' 

    end

    context 'when OmniAuth is enabled' do
      before do
        allow(Gitlab::Auth).to receive(:omniauth_enabled?).and_return(true)
      end

      it 'allows database auth' 


      it 'allows LDAP auth' 


      it 'allows other OmniAuth providers' 

    end
  end

  describe '#config_for' do
    context 'for an LDAP provider' do
      context 'when the provider exists' do
        it 'returns the config' 

      end

      context 'when the provider does not exist' do
        it 'returns nil' 

      end
    end

    context 'for an OmniAuth provider' do
      before do
        provider = OpenStruct.new(
          name: 'google',
          app_id: 'asd123',
          app_secret: 'asd123'
        )
        allow(Gitlab.config.omniauth).to receive(:providers).and_return([provider])
      end

      context 'when the provider exists' do
        it 'returns the config' 

      end

      context 'when the provider does not exist' do
        it 'returns nil' 

      end
    end
  end
end

