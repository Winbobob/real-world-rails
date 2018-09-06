require 'rails_helper'

describe "posts/_single" do
  def render_post
    render partial: "single", locals: { post: @post }
  end

  before(:each) do
    @post = FactoryBot.create(:post)
    controller.stub(:current_user) { nil }
  end

  context "when the number of comments doesn't matter" do
    before(:each) do
      render_post
    end

    it "contains a permanent link to post" 


    it "doesn't contain a link to new comment" 

  end

  context "when logged in" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      render_post
    end

    it "contains link to new comment" 


    it "does not contain an edit link" 

  end

  context "when logged in as post author" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @post = FactoryBot.create(:post, author: @member)
      render_post
    end

    it "contains an edit link" 

  end

  context "when there are no comments" do
    before(:each) do
      render_post
    end

    it "renders the number of comments" 

  end

  context "when there is 1 comment" do
    before(:each) do
      @comment = FactoryBot.create(:comment, post: @post)
      render_post
    end

    it "renders the number of comments" 

  end

  context "when there are 2 comments" do
    before(:each) do
      @comment = FactoryBot.create(:comment, post: @post)
      @comment2 = FactoryBot.create(:comment, post: @post)
      render_post
    end

    it "renders the number of comments" 

  end

  context "when comments should be hidden" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @comment = FactoryBot.create(:comment, post: @post)
      render partial: "single", locals: {
        post: @post, hide_comments: true
      }
    end

    it "renders no value of comments" 


    it "does not contain link to post" 


    it "does not contain link to new comment" 

  end

  context "when post has been edited" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @post = FactoryBot.create(:post, author: @member)
      @post.update(body: "I am updated")
      render_post
    end

    it "shows edited at" 


    it "shows the updated time" 

  end

  context "when comment has been edited" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @post = FactoryBot.create(:post, author: @member)
      @comment = FactoryBot.create(:comment, post: @post)
      @comment.update(body: "I've been updated")
      render partial: "comments/single", locals: { comment: @comment }
    end

    it "shows edited at time" 


    it "shows updated time" 

  end

  context "when post has not been edited" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @post = FactoryBot.create(:post, author: @member)
      @post.update(updated_at: @post.created_at)
      render_post
    end

    it "does not show edited at" 

  end

  context "when comment has not been edited" do
    before(:each) do
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @post = FactoryBot.create(:post, author: @member)
      @comment = FactoryBot.create(:comment, post: @post)
      @comment.update(updated_at: @comment.created_at)
      render partial: "comments/single", locals: { comment: @comment }
    end

    it "does not show edited at" 

  end
end

