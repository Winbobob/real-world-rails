require 'rails_helper'

RSpec.describe FeedManager do
  before do |example|
    unless example.metadata[:skip_stub]
      stub_const 'FeedManager::MAX_ITEMS', 10
      stub_const 'FeedManager::REBLOG_FALLOFF', 4
    end
  end

  it 'tracks at least as many statuses as reblogs', skip_stub: true do
    expect(FeedManager::REBLOG_FALLOFF).to be <= FeedManager::MAX_ITEMS
  end

  describe '#key' do
    subject { FeedManager.instance.key(:home, 1) }

    it 'returns a string' 

  end

  describe '#filter?' do
    let(:alice) { Fabricate(:account, username: 'alice') }
    let(:bob)   { Fabricate(:account, username: 'bob', domain: 'example.com') }
    let(:jeff)  { Fabricate(:account, username: 'jeff') }

    context 'for home feed' do
      it 'returns false for followee\'s status' 


      it 'returns false for reblog by followee' 


      it 'returns true for reblog by followee of blocked account' 


      it 'returns true for reblog by followee of muted account' 


      it 'returns true for reblog by followee of someone who is blocking recipient' 


      it 'returns true for reblog from account with reblogs disabled' 


      it 'returns false for reply by followee to another followee' 


      it 'returns false for reply by followee to recipient' 


      it 'returns false for reply by followee to self' 


      it 'returns true for reply by followee to non-followed account' 


      it 'returns true for the second reply by followee to a non-federated status' 


      it 'returns false for status by followee mentioning another account' 


      it 'returns true for status by followee mentioning blocked account' 


      it 'returns true for reblog of a personally blocked domain' 

    end

    context 'for mentions feed' do
      it 'returns true for status that mentions blocked account' 


      it 'returns true for status that replies to a blocked account' 


      it 'returns true for status by silenced account who recipient is not following' 


      it 'returns false for status by followed silenced account' 

    end
  end

  describe '#push_to_home' do
    it 'trims timelines if they will have more than FeedManager::MAX_ITEMS' 


    context 'reblogs' do
      it 'saves reblogs of unseen statuses' 


      it 'does not save a new reblog of a recent status' 


      it 'saves a new reblog of an old status' 


      it 'does not save a new reblog of a recently-reblogged status' 


      it 'does not save a new reblog of a multiply-reblogged-then-unreblogged status' 


      it 'saves a new reblog of a long-ago-reblogged status' 

    end

    it "does not push when the given status's reblog is already inserted" 

  end

  describe '#push_to_list' do
    it "does not push when the given status's reblog is already inserted" 

  end

  describe '#merge_into_timeline' do
    it "does not push source account's statuses whose reblogs are already inserted" 

  end

  describe '#trim' do
    let(:receiver) { Fabricate(:account) }

    it 'cleans up reblog tracking keys' 

  end

  describe '#unpush' do
    let(:receiver) { Fabricate(:account) }

    it 'leaves a reblogged status if original was on feed' 


    it 'removes a reblogged status if it was only reblogged once' 


    it 'leaves a multiply-reblogged status if another reblog was in feed' 


    it 'sends push updates' 

  end
end

