require 'rails_helper'

RSpec.describe ActivityPub::Activity::Create do
  let(:sender) { Fabricate(:account, followers_url: 'http://example.com/followers') }

  let(:json) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: [ActivityPub::TagManager.instance.uri_for(sender), '#foo'].join,
      type: 'Create',
      actor: ActivityPub::TagManager.instance.uri_for(sender),
      object: object_json,
    }.with_indifferent_access
  end

  subject { described_class.new(json, sender) }

  before do
    sender.update(uri: ActivityPub::TagManager.instance.uri_for(sender))

    stub_request(:get, 'http://example.com/attachment.png').to_return(request_fixture('avatar.txt'))
    stub_request(:get, 'http://example.com/emoji.png').to_return(body: attachment_fixture('emojo.png'))
  end

  describe '#perform' do
    before do
      subject.perform
    end

    context 'standalone' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
        }
      end

      it 'creates status' 


      it 'missing to/cc defaults to direct privacy' 

    end

    context 'public' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          to: 'https://www.w3.org/ns/activitystreams#Public',
        }
      end

      it 'creates status' 

    end

    context 'unlisted' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          cc: 'https://www.w3.org/ns/activitystreams#Public',
        }
      end

      it 'creates status' 

    end

    context 'private' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          to: 'http://example.com/followers',
        }
      end

      it 'creates status' 

    end

    context 'direct' do
      let(:recipient) { Fabricate(:account) }

      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          to: ActivityPub::TagManager.instance.uri_for(recipient),
        }
      end

      it 'creates status' 

    end

    context 'as a reply' do
      let(:original_status) { Fabricate(:status) }

      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          inReplyTo: ActivityPub::TagManager.instance.uri_for(original_status),
        }
      end

      it 'creates status' 

    end

    context 'with mentions' do
      let(:recipient) { Fabricate(:account) }

      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          tag: [
            {
              type: 'Mention',
              href: ActivityPub::TagManager.instance.uri_for(recipient),
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with mentions missing href' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          tag: [
            {
              type: 'Mention',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with media attachments' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          attachment: [
            {
              type: 'Document',
              mediaType: 'image/png',
              url: 'http://example.com/attachment.png',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with media attachments with focal points' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          attachment: [
            {
              type: 'Document',
              mediaType: 'image/png',
              url: 'http://example.com/attachment.png',
              focalPoint: [0.5, -0.7],
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with media attachments missing url' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          attachment: [
            {
              type: 'Document',
              mediaType: 'image/png',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with hashtags' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          tag: [
            {
              type: 'Hashtag',
              href: 'http://example.com/blah',
              name: '#test',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with hashtags missing name' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum',
          tag: [
            {
              type: 'Hashtag',
              href: 'http://example.com/blah',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with emojis' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum :tinking:',
          tag: [
            {
              type: 'Emoji',
              icon: {
                url: 'http://example.com/emoji.png',
              },
              name: 'tinking',
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with emojis missing name' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum :tinking:',
          tag: [
            {
              type: 'Emoji',
              icon: {
                url: 'http://example.com/emoji.png',
              },
            },
          ],
        }
      end

      it 'creates status' 

    end

    context 'with emojis missing icon' do
      let(:object_json) do
        {
          id: [ActivityPub::TagManager.instance.uri_for(sender), '#bar'].join,
          type: 'Note',
          content: 'Lorem ipsum :tinking:',
          tag: [
            {
              type: 'Emoji',
              name: 'tinking',
            },
          ],
        }
      end

      it 'creates status' 

    end
  end
end

