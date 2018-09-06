require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a TripsController" do
  describe "index" do
    it "should list trips" 


    it "should include pagination data in headers" 

  end

  describe "by_login" do
    it "should list trips by a user" 


    it "should filter by published=true" 


    it "should filter by published=false" 


    it "should filter by published=any" 


    it "should not show drafts for people who didn't write them" 


    it "should include pagination data in headers" 

  end

  describe "show" do
    it "should work" 


    it "should include trip taxa" 


    it "should include trip purposes" 

  end

  describe "create" do
    it "should work" 


    it "should allow nested trip taxa" 


    it "should allow nested trip purposes" 

  end

  describe "update" do
    it "should work" 


    it "should allow nested trip taxa" 


    it "should allow nested trip purposes" 

  end

  describe "destroy" do
    it "should work" 

  end
end

describe TripsController, "oauth authentication" do
  let(:user) { User.make! }
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    controller.stub(:doorkeeper_token) { token }
  end
  it_behaves_like "a TripsController"
end

describe TripsController, "devise authentication" do
  let(:user) { User.make! }
  before do
    http_login(user)
  end
  it_behaves_like "a TripsController"
end

