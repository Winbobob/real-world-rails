require 'spec_helper'

describe Gitlab::Auth::OAuth::Provider do
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

