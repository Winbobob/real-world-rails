require 'rails_helper'

RSpec.describe ActivityPub::Activity::Undo do
  let(:sender) { Fabricate(:account, domain: 'example.com') }

  let(:json) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: 'foo',
      type: 'Undo',
      actor: ActivityPub::TagManager.instance.uri_for(sender),
      object: object_json,
    }.with_indifferent_access
  end

  subject { described_class.new(json, sender) }

  describe '#perform' do
    context 'with Announce' do
      let(:status) { Fabricate(:status) }

      let(:object_json) do
        {
          id: 'bar',
          type: 'Announce',
          actor: ActivityPub::TagManager.instance.uri_for(sender),
          object: ActivityPub::TagManager.instance.uri_for(status),
          atomUri: 'barbar',
        }
      end

      context do
        before do
          Fabricate(:status, reblog: status, account: sender, uri: 'bar')
        end

        it 'deletes the reblog' 

      end

      context 'with atomUri' do
        before do
          Fabricate(:status, reblog: status, account: sender, uri: 'barbar')
        end

        it 'deletes the reblog by atomUri' 

      end
    end

    context 'with Accept' do
      let(:recipient) { Fabricate(:account) }
      let(:object_json) do
        {
          id: 'bar',
          type: 'Accept',
          actor: ActivityPub::TagManager.instance.uri_for(sender),
          object: 'follow-to-revoke',
        }
      end

      before do
        recipient.follow!(sender, uri: 'follow-to-revoke')
      end

      it 'deletes follow from recipient to sender' 


      it 'creates a follow request from recipient to sender' 

    end

    context 'with Block' do
      let(:recipient) { Fabricate(:account) }

      let(:object_json) do
        {
          id: 'bar',
          type: 'Block',
          actor: ActivityPub::TagManager.instance.uri_for(sender),
          object: ActivityPub::TagManager.instance.uri_for(recipient),
        }
      end

      before do
        sender.block!(recipient)
      end

      it 'deletes block from sender to recipient' 

    end

    context 'with Follow' do
      let(:recipient) { Fabricate(:account) }

      let(:object_json) do
        {
          id: 'bar',
          type: 'Follow',
          actor: ActivityPub::TagManager.instance.uri_for(sender),
          object: ActivityPub::TagManager.instance.uri_for(recipient),
        }
      end

      before do
        sender.follow!(recipient)
      end

      it 'deletes follow from sender to recipient' 

    end

    context 'with Like' do
      let(:status) { Fabricate(:status) }

      let(:object_json) do
        {
          id: 'bar',
          type: 'Like',
          actor: ActivityPub::TagManager.instance.uri_for(sender),
          object: ActivityPub::TagManager.instance.uri_for(status),
        }
      end

      before do
        Fabricate(:favourite, account: sender, status: status)
      end

      it 'deletes favourite from sender to status' 

    end
  end
end

