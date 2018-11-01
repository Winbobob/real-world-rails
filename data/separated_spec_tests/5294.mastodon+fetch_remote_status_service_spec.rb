require 'rails_helper'

RSpec.describe FetchRemoteStatusService, type: :service do
  let(:account) { Fabricate(:account) }
  let(:prefetched_body) { nil }
  let(:valid_domain) { Rails.configuration.x.local_domain }

  let(:note) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: "https://#{valid_domain}/@foo/1234",
      type: 'Note',
      content: 'Lorem ipsum',
      attributedTo: ActivityPub::TagManager.instance.uri_for(account),
    }
  end

  context 'protocol is :activitypub' do
    subject { described_class.new.call(note[:id], prefetched_body, protocol) }
    let(:prefetched_body) { Oj.dump(note) }
    let(:protocol) { :activitypub }

    before do
      account.update(uri: ActivityPub::TagManager.instance.uri_for(account))
      subject
    end

    it 'creates status' 

  end

  context 'protocol is :ostatus' do
    subject { described_class.new }

    before do
      Fabricate(:account, username: 'tracer', domain: 'real.domain', remote_url: 'https://real.domain/users/tracer')
    end

    it 'does not create status with author at different domain' 


    it 'does not create status with wrong id when id uses http format' 

  end
end

