# frozen_string_literal: true

require "rails_helper"

describe Admin::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:comment) { create :comment, user: user, commentable: CommentablePage.create(name: "Fake Wiki", id: 1) }

  before do
    sign_in create(:admin)
  end

  describe "GET index" do
    it "should work" 

  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" 

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" 


      it "redirects to the comment" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" 


    it "redirects to the comments list" 

  end
end

