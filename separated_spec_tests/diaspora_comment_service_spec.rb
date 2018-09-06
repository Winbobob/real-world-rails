# frozen_string_literal: true

describe CommentService do
  let(:post) { alice.post(:status_message, text: "hello", to: alice.aspects.first) }

  describe "#create" do
    it "creates a comment on my own post" 


    it "creates a comment on post of a contact" 


    it "attaches the comment to the post" 


    it "fail if the post does not exist" 


    it "fail if the user can not see the post" 

  end

  describe "#destroy" do
    let(:comment) { CommentService.new(bob).create(post.id, "hi") }

    it "lets the user destroy his own comment" 


    it "lets the parent author destroy others comment" 


    it "does not let someone destroy others comment" 


    it "fails if the comment does not exist" 

  end

  describe "#find_for_post" do
    context "with user" do
      it "returns comments for a public post" 


      it "returns comments for a visible private post" 


      it "does not return comments for private post the user can not see" 

    end

    context "without user" do
      it "returns comments for a public post" 


      it "does not return comments for private post" 

    end

    it "returns all comments of a post" 

  end
end

