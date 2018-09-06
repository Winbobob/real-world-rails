require 'rails_helper'

RSpec.describe FollowService, type: :service do
  let(:sender) { Fabricate(:account, username: 'alice') }

  subject { FollowService.new }

  context 'local account' do
    describe 'locked account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, locked: true, username: 'bob')).account }

      before do
        subject.call(sender, bob.acct)
      end

      it 'creates a follow request with reblogs' 

    end

    describe 'locked account, no reblogs' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, locked: true, username: 'bob')).account }

      before do
        subject.call(sender, bob.acct, reblogs: false)
      end

      it 'creates a follow request without reblogs' 

    end

    describe 'unlocked account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

      before do
        subject.call(sender, bob.acct)
      end

      it 'creates a following relation with reblogs' 

    end

    describe 'unlocked account, no reblogs' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

      before do
        subject.call(sender, bob.acct, reblogs: false)
      end

      it 'creates a following relation without reblogs' 

    end

    describe 'already followed account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

      before do
        sender.follow!(bob)
        subject.call(sender, bob.acct)
      end

      it 'keeps a following relation' 

    end

    describe 'already followed account, turning reblogs off' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

      before do
        sender.follow!(bob, reblogs: true)
        subject.call(sender, bob.acct, reblogs: false)
      end

      it 'disables reblogs' 

    end

    describe 'already followed account, turning reblogs on' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

      before do
        sender.follow!(bob, reblogs: false)
        subject.call(sender, bob.acct, reblogs: true)
      end

      it 'disables reblogs' 

    end
  end

  context 'remote OStatus account' do
    describe 'locked account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, protocol: :ostatus, locked: true, username: 'bob', domain: 'example.com', salmon_url: 'http://salmon.example.com')).account }

      before do
        stub_request(:post, "http://salmon.example.com/").to_return(:status => 200, :body => "", :headers => {})
        subject.call(sender, bob.acct)
      end

      it 'creates a follow request' 


      it 'sends a follow request salmon slap' 

    end

    describe 'unlocked account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, protocol: :ostatus, username: 'bob', domain: 'example.com', salmon_url: 'http://salmon.example.com', hub_url: 'http://hub.example.com')).account }

      before do
        stub_request(:post, "http://salmon.example.com/").to_return(:status => 200, :body => "", :headers => {})
        stub_request(:post, "http://hub.example.com/").to_return(status: 202)
        subject.call(sender, bob.acct)
      end

      it 'creates a following relation' 


      it 'sends a follow salmon slap' 


      it 'subscribes to PuSH' 

    end

    describe 'already followed account' do
      let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, protocol: :ostatus, username: 'bob', domain: 'example.com', salmon_url: 'http://salmon.example.com', hub_url: 'http://hub.example.com')).account }

      before do
        sender.follow!(bob)
        subject.call(sender, bob.acct)
      end

      it 'keeps a following relation' 


      it 'does not send a follow salmon slap' 


      it 'does not subscribe to PuSH' 

    end
  end

  context 'remote ActivityPub account' do
    let(:bob) { Fabricate(:user, account: Fabricate(:account, username: 'bob', domain: 'example.com', protocol: :activitypub, inbox_url: 'http://example.com/inbox')).account }

    before do
      stub_request(:post, "http://example.com/inbox").to_return(:status => 200, :body => "", :headers => {})
      subject.call(sender, bob.acct)
    end

    it 'creates follow request' 


    it 'sends a follow activity to the inbox' 

  end
end

