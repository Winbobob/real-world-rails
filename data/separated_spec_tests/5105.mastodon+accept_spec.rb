require 'rails_helper'

RSpec.describe ActivityPub::Activity::Accept do
  let(:sender)    { Fabricate(:account) }
  let(:recipient) { Fabricate(:account) }

  let(:json) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: 'foo',
      type: 'Accept',
      actor: ActivityPub::TagManager.instance.uri_for(sender),
      object: {
        id: 'bar',
        type: 'Follow',
        actor: ActivityPub::TagManager.instance.uri_for(recipient),
        object: ActivityPub::TagManager.instance.uri_for(sender),
      },
    }.with_indifferent_access
  end

  describe '#perform' do
    subject { described_class.new(json, sender) }

    before do
      Fabricate(:follow_request, account: recipient, target_account: sender)
      subject.perform
    end

    it 'creates a follow relationship' 


    it 'removes the follow request' 

  end

  context 'given a relay' do
    let!(:relay) { Fabricate(:relay, state: :pending, follow_activity_id: 'https://abc-123/456') }

    let(:json) do
      {
        '@context': 'https://www.w3.org/ns/activitystreams',
        id: 'foo',
        type: 'Accept',
        actor: ActivityPub::TagManager.instance.uri_for(sender),
        object: {
          id: 'https://abc-123/456',
          type: 'Follow',
          actor: ActivityPub::TagManager.instance.uri_for(recipient),
          object: ActivityPub::TagManager.instance.uri_for(sender),
        },
      }.with_indifferent_access
    end

    subject { described_class.new(json, sender) }

    it 'marks the relay as accepted' 

  end
end

