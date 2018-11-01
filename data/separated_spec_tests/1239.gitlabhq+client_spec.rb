require 'spec_helper'

describe Gitlab::GithubImport::Client do
  describe '#parallel?' do
    it 'returns true when the client is running in parallel mode' 


    it 'returns false when the client is running in sequential mode' 

  end

  describe '#user' do
    it 'returns the details for the given username' 

  end

  describe '#repository' do
    it 'returns the details of a repository' 

  end

  describe '#labels' do
    it 'returns the labels' 

  end

  describe '#milestones' do
    it 'returns the milestones' 

  end

  describe '#releases' do
    it 'returns the releases' 

  end

  describe '#each_page' do
    let(:client) { described_class.new('foo') }
    let(:object1) { double(:object1) }
    let(:object2) { double(:object2) }

    before do
      allow(client)
        .to receive(:with_rate_limit)
        .and_yield

      allow(client.octokit)
        .to receive(:public_send)
        .and_return([object1])

      response = double(:response, data: [object2], rels: { next: nil })
      next_page = double(:next_page, get: response)

      allow(client.octokit)
        .to receive(:last_response)
        .and_return(double(:last_response, rels: { next: next_page }))
    end

    context 'without a block' do
      it 'returns an Enumerator' 


      it 'the returned Enumerator returns Page objects' 

    end

    context 'with a block' do
      it 'yields every retrieved page to the supplied block' 


      it 'starts at the given page' 

    end
  end

  describe '#with_rate_limit' do
    let(:client) { described_class.new('foo') }

    it 'yields the supplied block when enough requests remain' 


    it 'waits before yielding if not enough requests remain' 


    it 'waits and retries the operation if all requests were consumed in the supplied block' 


    it 'increments the request count counter' 


    it 'ignores rate limiting when disabled' 

  end

  describe '#requests_remaining?' do
    let(:client) { described_class.new('foo') }

    it 'returns true if enough requests remain' 


    it 'returns false if not enough requests remain' 

  end

  describe '#raise_or_wait_for_rate_limit' do
    it 'raises RateLimitError when running in parallel mode' 


    it 'sleeps when running in sequential mode' 


    it 'increments the rate limit counter' 

  end

  describe '#remaining_requests' do
    it 'returns the number of remaining requests' 

  end

  describe '#rate_limit_resets_in' do
    it 'returns the number of seconds after which the rate limit is reset' 

  end

  describe '#api_endpoint' do
    let(:client) { described_class.new('foo') }

    context 'without a custom endpoint configured in Omniauth' do
      it 'returns the default API endpoint' 

    end

    context 'with a custom endpoint configured in Omniauth' do
      it 'returns the custom endpoint' 

    end
  end

  describe '#custom_api_endpoint' do
    let(:client) { described_class.new('foo') }

    context 'without a custom endpoint' do
      it 'returns nil' 

    end

    context 'with a custom endpoint' do
      it 'returns the API endpoint' 

    end
  end

  describe '#default_api_endpoint' do
    it 'returns the default API endpoint' 

  end

  describe '#verify_ssl' do
    let(:client) { described_class.new('foo') }

    context 'without a custom configuration' do
      it 'returns true' 

    end

    context 'with a custom configuration' do
      it 'returns the configured value' 

    end
  end

  describe '#github_omniauth_provider' do
    let(:client) { described_class.new('foo') }

    context 'without a configured provider' do
      it 'returns an empty Hash' 

    end

    context 'with a configured provider' do
      it 'returns the provider details as a Hash' 

    end
  end

  describe '#rate_limiting_enabled?' do
    let(:client) { described_class.new('foo') }

    it 'returns true when using GitHub.com' 


    it 'returns false for GitHub enterprise installations' 

  end
end

