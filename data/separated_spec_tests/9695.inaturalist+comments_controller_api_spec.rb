require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a CommentsController" do
  let(:user) { User.make! }
  let(:observation) { Observation.make! }

  describe "create" do
    it "should work" 


    it "should error out for invalid comments" 

  end

  describe "update" do
    let(:comment) { Comment.make!(:user => user) }
    it "should work" 

  end

  describe "destroy" do
    let(:comment) { Comment.make!(:user => user) }
    it "should work" 

  end
end

describe CommentsController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a CommentsController"
end

describe CommentsController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "a CommentsController"
end

