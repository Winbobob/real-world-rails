require 'rails_helper'

RSpec.describe ReblogService, type: :service do
  let(:alice)  { Fabricate(:account, username: 'alice') }

  context 'OStatus' do
    let(:bob)    { Fabricate(:account, username: 'bob', domain: 'example.com', salmon_url: 'http://salmon.example.com') }
    let(:status) { Fabricate(:status, account: bob, uri: 'tag:example.com;something:something') }

    subject { ReblogService.new }

    before do
      stub_request(:post, 'http://salmon.example.com')
      subject.call(alice, status)
    end

    it 'creates a reblog' 


    it 'sends a Salmon slap for a remote reblog' 

  end

  context 'ActivityPub' do
    let(:bob)    { Fabricate(:account, username: 'bob', protocol: :activitypub, domain: 'example.com', inbox_url: 'http://example.com/inbox') }
    let(:status) { Fabricate(:status, account: bob) }

    subject { ReblogService.new }

    before do
      stub_request(:post, bob.inbox_url)
      allow(ActivityPub::DistributionWorker).to receive(:perform_async)
      subject.call(alice, status)
    end

    it 'creates a reblog' 


    describe 'after_create_commit :store_uri' do
      it 'keeps consistent reblog count' 

    end

    it 'distributes to followers' 


    it 'sends an announce activity to the author' 

  end
end

