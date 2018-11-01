# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Stream::Aspect do
  describe '#aspects' do
    it 'queries the user given initialized aspect ids' 


    it "returns all the user's aspects if no aspect ids are specified" 


    it 'filters aspects given a user' 

  end

  describe '#posts' do
    before do
      @alice = double.as_null_object
    end

    it 'calls visible posts for the given user' 


    it 'is called with 2 types' 


    it 'respects ordering' 


    it 'respects max_time' 


    it 'passes for_all_aspects to visible posts' 

  end

  describe "#people" do
    it "should call Person.all_from_aspects" 

  end

  describe '#aspect' do
    before do
      alice = double.as_null_object
      @stream = Stream::Aspect.new(alice, [1,2])
    end

    it "returns an aspect if the stream is not for all the user's aspects" 


    it "returns nothing if the stream is not for all the user's aspects" 

  end

  describe "for_all_aspects?" do
    before do
      alice = double.as_null_object
      allow(alice.aspects).to receive(:size).and_return(2)
      @stream = Stream::Aspect.new(alice, [1, 2])
    end

    it "is true if the count of aspects is equal to the size of the user's aspect count" 


    it "is false if the count of aspects is not equal to the size of the user's aspect count" 

  end

  describe 'shared behaviors' do
    before do
      @stream = Stream::Aspect.new(alice, alice.aspects.map(&:id))
    end
    it_should_behave_like 'it is a stream'
  end
end

