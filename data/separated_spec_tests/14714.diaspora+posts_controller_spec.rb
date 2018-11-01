# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe PostsController, type: :controller do
  let(:post) { alice.post(:status_message, text: "ohai", to: alice.aspects.first) }
  let(:post_service) { controller.send(:post_service) }

  describe "#show" do
    context "user signed in" do
      context "given a post that the user is allowed to see" do
        before do
          sign_in alice, scope: :user
        end

        it "succeeds" 


        it "succeeds after removing a mention when closing the mentioned user's account" 


        it "renders the application layout on mobile" 


        it "succeeds on mobile with a reshare" 

      end

      context "given a post that the user is not allowed to see" do
        before do
          sign_in eve, scope: :user
        end

        it "returns a 404" 

      end
    end

    context "user not signed in" do
      context "given a public post" do
        let(:public) { alice.post(:status_message, text: "hello", public: true) }
        let(:public_with_tags) { alice.post(:status_message, text: "#hi #howareyou", public: true) }

        it "shows a public post" 


        it "succeeds for statusnet" 


        it "includes the correct uniques meta tags" 


        it "includes the correct multiple meta tags" 

      end

      context "given a limited post" do
        it "forces the user to sign" 

      end
    end
  end

  describe "oembed" do
    it "works when you can see it" 


    it "returns a 404 response when the post is not found" 

  end

  describe "#mentionable" do
    context "with a user signed in" do
      before do
        sign_in alice
      end

      it "returns status 204 without a :q parameter" 


      it "responses status 406 (not acceptable) on html request" 


      it "responses status 404 when the post can't be found" 


      it "calls PostService#mentionable_in_comment and passes the result as a response" 

    end

    context "without a user signed in" do
      it "returns 401" 

    end
  end

  describe "#destroy" do
    context "own post" do
      before do
        sign_in alice
      end

      it "works when it is your post" 


      it "redirects to stream on mobile" 

    end

    context "post of another user" do
      it "will respond with a 403" 


      it "will respond with a 404 if the post is not visible" 

    end
  end
end

