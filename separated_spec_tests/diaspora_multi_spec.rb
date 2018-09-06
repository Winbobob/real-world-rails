# frozen_string_literal: true

require Rails.root.join('spec', 'shared_behaviors', 'stream')

describe Stream::Multi do
  before do
    @stream = Stream::Multi.new(alice, :max_time => Time.now, :order => 'updated_at')
  end

  describe 'shared behaviors' do
    it_should_behave_like 'it is a stream'
  end

  describe "#posts" do
    it "calls EvilQuery::MultiStream with correct parameters" 

  end

  describe '#publisher_opts' do
    it 'prefills, sets public, and autoexpands if welcome? is set' 


    it 'provides no opts if welcome? is not set' 

  end

  describe "#publisher_prefill" do
    before do
      @tag = ActsAsTaggableOn::Tag.find_or_create_by(name: "cats")
      @tag_following = alice.tag_followings.create(:tag_id => @tag.id)

      @stream = Stream::Multi.new(alice)
    end

    it 'returns includes new user hashtag' 


    it 'includes followed hashtags' 


    context 'when invited by another user' do
      before do
        @user = FactoryGirl.create(:user, :invited_by => alice)
        @inviter = alice.person

        @stream = Stream::Multi.new(@user)
      end

      it 'includes a mention of the inviter' 

    end
  end

  describe "#welcome?" do
    before do
      @stream = Stream::Multi.new(alice)
    end

    it 'returns true if user is getting started' 


    it 'returns false if user is getting started' 

  end
end

