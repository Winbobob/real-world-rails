require 'rails_helper'

RSpec.describe ActivityPub::ProcessCollectionService, type: :service do
  let(:actor) { Fabricate(:account, domain: 'example.com', uri: 'http://example.com/account') }

  let(:payload) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: 'foo',
      type: 'Create',
      actor: ActivityPub::TagManager.instance.uri_for(actor),
      object: {
        id: 'bar',
        type: 'Note',
        content: 'Lorem ipsum',
      },
    }
  end

  let(:json) { Oj.dump(payload) }

  subject { described_class.new }

  describe '#call' do
    context 'when actor is the sender'
    context 'when actor differs from sender' do
      let(:forwarder) { Fabricate(:account, domain: 'example.com', uri: 'http://example.com/other_account') }

      it 'processes payload with sender if no signature exists' 


      it 'processes payload with actor if valid signature exists' 


      it 'does not process payload if invalid signature exists' 

    end
  end
end

