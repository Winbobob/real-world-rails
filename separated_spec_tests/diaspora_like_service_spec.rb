# frozen_string_literal: true

describe LikeService do
  let(:post) { alice.post(:status_message, text: "hello", to: alice.aspects.first) }

  describe "#create" do
    it "creates a like on my own post" 


    it "creates a like on a post of a contact" 


    it "attaches the like to the post" 


    it "fails if the post does not exist" 


    it "fails if the user can't see the post" 


    it "fails if the user already liked the post" 

  end

  describe "#destroy" do
    let(:like) { LikeService.new(bob).create(post.id) }

    it "lets the user destroy their own like" 


    it "doesn't let the parent author destroy others likes" 


    it "doesn't let someone destroy others likes" 


    it "fails if the like doesn't exist" 

  end

  describe "#find_for_post" do
    context "with user" do
      it "returns likes for a public post" 


      it "returns likes for a visible private post" 


      it "doesn't return likes for a private post the user can not see" 


      it "returns the user's like first" 

    end

    context "without user" do
      it "returns likes for a public post" 


      it "doesn't return likes a for private post" 

    end

    it "returns all likes of a post" 

  end
end

