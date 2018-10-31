require 'spec_helper'

describe Gitlab::LegacyGithubImport::Client do
  let(:token) { '123456' }
  let(:github_provider) { Settingslogic.new('app_id' => 'asd123', 'app_secret' => 'asd123', 'name' => 'github', 'args' => { 'client_options' => {} }) }

  subject(:client) { described_class.new(token) }

  before do
    allow(Gitlab.config.omniauth).to receive(:providers).and_return([github_provider])
  end

  it 'convert OAuth2 client options to symbols' 


  it 'does not crash (e.g. Settingslogic::MissingSetting) when verify_ssl config is not present' 


  context 'when config is missing' do
    before do
      allow(Gitlab.config.omniauth).to receive(:providers).and_return([])
    end

    it 'is still possible to get an Octokit client' 


    it 'is not be possible to get an OAuth2 client' 

  end

  context 'allow SSL verification to be configurable on API' do
    before do
      github_provider['verify_ssl'] = false
    end

    it 'uses supplied value' 

  end

  describe '#api_endpoint' do
    context 'when provider does not specity an API endpoint' do
      it 'uses GitHub root API endpoint' 

    end

    context 'when provider specify a custom API endpoint' do
      before do
        github_provider['args']['client_options']['site'] = 'https://github.company.com/'
      end

      it 'uses the custom API endpoint' 

    end

    context 'when given a host' do
      subject(:client) { described_class.new(token, host: 'https://try.gitea.io/') }

      it 'builds a endpoint with the given host and the default API version' 

    end

    context 'when given an API version' do
      subject(:client) { described_class.new(token, api_version: 'v3') }

      it 'does not use the API version without a host' 

    end

    context 'when given a host and version' do
      subject(:client) { described_class.new(token, host: 'https://try.gitea.io/', api_version: 'v3') }

      it 'builds a endpoint with the given options' 

    end
  end

  it 'does not raise error when rate limit is disabled' 

end

