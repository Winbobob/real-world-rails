# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe LikesController, type: :controller do
  before do
    @alices_aspect = alice.aspects.where(:name => "generic").first
    @bobs_aspect = bob.aspects.where(:name => "generic").first

    sign_in(alice, scope: :user)
  end

  describe "#create" do
    let(:like_hash) {
      {post_id: @target.id}
    }

    context "on my own post" do
      it "succeeds" 

    end

    context "on a post from a contact" do
      before do
        @target = bob.post(:status_message, text: "AWESOME", to: @bobs_aspect.id)
      end

      it "likes" 


      it "doesn't post multiple times" 

    end

    context "on a post from a stranger" do
      before do
        @target = eve.post :status_message, text: "AWESOME", to: eve.aspects.first.id
      end

      it "doesn't post" 

    end

    context "when an the exception is raised" do
      before do
        @target = alice.post :status_message, text: "AWESOME", to: @alices_aspect.id
      end

      it "should be catched when it means that the target is not found" 


      it "should not be catched when it is unexpected" 

    end
  end

  describe "#index" do
    before do
      @message = alice.post(:status_message, text: "hey", to: @alices_aspect.id)
    end

    it "returns a 404 for a post not visible to the user" 


    it "returns an array of likes for a post" 


    it "returns an empty array for a post with no likes" 


    it "returns likes for a public post without login" 


    it "returns a 401 for a private post when logged out" 

  end

  describe "#destroy" do
    before do
      @message = bob.post(:status_message, text: "hey", to: @alices_aspect.id)
      @like = alice.like!(@message)
    end

    it "lets a user destroy their like" 


    it "does not let a user destroy other likes" 

  end
end

