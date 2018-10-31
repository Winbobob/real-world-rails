# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require Rails.root.join('spec', 'shared_behaviors', 'stream')

describe Stream::Tag do
  context 'with a user' do
    before do
      @stream = Stream::Tag.new(alice, "what")
      bob.post(:status_message, :text => "#not_what", :to => 'all')
    end

   it 'displays your own post' 


   it "displays a friend's post" 


   it 'displays a public post' 


   it 'displays a public post that was sent to no one' 

  end

  context 'without a user' do
    before do
      @post = alice.post(:status_message, :text => "#what", :public => true, :to => 'all')
      alice.post(:status_message, :text => "#tagwhat", :public => true, :to => 'all')
      alice.post(:status_message, :text => "#what", :public => false, :to => 'all')
    end

    it "displays only public posts with the tag" 

  end

  describe "people" do
    it "assigns the set of people who authored a post containing the tag" 

  end

  describe 'tagged_people' do
    it "assigns the set of people who have that tag in their profile tags" 

  end

  describe 'case insensitivity' do
    before do
      @post_lc = alice.post(:status_message, :text => '#newhere', :public => true, :to => 'all')
      @post_uc = alice.post(:status_message, :text => '#NewHere', :public => true, :to => 'all')
      @post_cp = alice.post(:status_message, :text => '#NEWHERE', :public => true, :to => 'all')
    end

    it 'returns posts regardless of the tag case' 

  end

  describe 'shared behaviors' do
    before do
      @stream = Stream::Tag.new(FactoryGirl.create(:user), FactoryGirl.create(:tag).name)
    end
    it_should_behave_like 'it is a stream'
  end

  describe '#stream_posts' do
    it "returns an empty array if the tag does not exist" 


    it "returns an empty array if there are no visible posts for the tag" 


    it "returns the post containing the tag" 

  end

  describe '#tag_name=' do
    it 'downcases the tag' 


    it 'removes #es' 

  end

  describe "#publisher" do
    it 'creates a publisher with the tag prefill' 

  end
end

