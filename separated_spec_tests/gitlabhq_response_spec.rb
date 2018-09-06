require 'spec_helper'

describe Gitlab::StorageCheck::Response do
  let(:fake_json) do
    {
      check_interval: 42,
      results: [
        { storage: 'working', success: true },
        { storage: 'skipped', success: nil },
        { storage: 'failing', success: false }
      ]
    }.to_json
  end

  let(:fake_http_response) do
    fake_response = instance_double("Excon::Response - Status check")
    allow(fake_response).to receive(:status).and_return(200)
    allow(fake_response).to receive(:body).and_return(fake_json)
    allow(fake_response).to receive(:headers).and_return('Content-Type' => 'application/json')

    fake_response
  end
  let(:response) { described_class.new(fake_http_response) }

  describe '#valid?' do
    it 'is valid for a success response with parseable JSON' 

  end

  describe '#check_interval' do
    it 'returns the result from the JSON' 

  end

  describe '#responsive_shards' do
    it 'contains the names of working shards' 

  end

  describe '#skipped_shards' do
    it 'contains the names of skipped shards' 

  end

  describe '#failing_shards' do
    it 'contains the name of failing shards' 

  end
end

