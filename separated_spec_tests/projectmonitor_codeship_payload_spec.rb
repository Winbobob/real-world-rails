require 'spec_helper'
require Rails.root.join('spec', 'shared', 'json_payload_examples')

describe CodeshipPayload do

  let(:fixture_file)      { "success.json" }
  let(:fixture_content)   { load_fixture('codeship_examples', fixture_file) }
  let(:payload)           { CodeshipPayload.new(45716, 'master') }
  let(:converted_content) { payload.convert_content!(fixture_content).first }

  it_behaves_like "a JSON payload"

  context 'filtering on the branch name' do
    it 'can match the exact branch name' 


    it 'can accept a ruby-flavor regex' 


    it 'does not happen when the branch name is empty' 

  end

  describe '#parse_url' do
    before(:each) {}
    subject { payload.parse_url(converted_content) }
    it { is_expected.to eq('https://www.codeship.io/projects/45716/builds/2776509') }
  end

  describe '#parse_build_id' do
    subject { payload.parse_build_id(converted_content) }

    context 'polled content' do
      it { is_expected.to eq(2776509) }
    end

    context 'webhook content' do
      let(:fixture_file) { 'webhook.json' }
      let(:converted_webhook_content) { payload.convert_webhook_content!(JSON.parse(fixture_content)).first }

      it { expect(payload.parse_build_id(converted_webhook_content)).to eq(2778736) }
    end
  end

  describe '#convert_webhook_content' do
    let(:fixture_file) { 'webhook.json' }
    subject { CodeshipPayload.new(nil) }

    it "converts the webhook content" 


    it "sets the Project ID" 

  end
end

