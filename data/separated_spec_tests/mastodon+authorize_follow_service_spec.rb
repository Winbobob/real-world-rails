require 'rails_helper'

RSpec.describe AuthorizeFollowService, type: :service do
  let(:sender) { Fabricate(:account, username: 'alice') }

  subject { AuthorizeFollowService.new }

  describe 'local' do
    let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob')).account }

    before do
      FollowRequest.create(account: bob, target_account: sender)
      subject.call(bob, sender)
    end

    it 'removes follow request' 


    it 'creates follow relation' 

  end

  describe 'remote OStatus' do
    let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob', domain: 'example.com', salmon_url: 'http://salmon.example.com')).account }

    before do
      FollowRequest.create(account: bob, target_account: sender)
      stub_request(:post, "http://salmon.example.com/").to_return(:status => 200, :body => "", :headers => {})
      subject.call(bob, sender)
    end

    it 'removes follow request' 


    it 'creates follow relation' 


    it 'sends a follow request authorization salmon slap' 

  end

  describe 'remote ActivityPub' do
    let(:bob) { Fabricate(:user, email: 'bob@example.com', account: Fabricate(:account, username: 'bob', domain: 'example.com', protocol: :activitypub, inbox_url: 'http://example.com/inbox')).account }

    before do
      FollowRequest.create(account: bob, target_account: sender)
      stub_request(:post, bob.inbox_url).to_return(status: 200)
      subject.call(bob, sender)
    end

    it 'removes follow request' 


    it 'creates follow relation' 


    it 'sends an accept activity' 

  end
end

