require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a SavedLocationsController" do
  let(:user) { User.make! }

  describe "index" do
    it "shows the current user's saved locations" 

    it "does not show other users' saved locations" 

  end

  describe "create" do
    it "should associate a new SavedLocation with the user that created it" 

  end
  describe "destroy" do
    it "should not allow deletion of a SavedLocation that does not belong to the authenticated user" 

  end
end

describe SavedLocationsController, "oauth authentication" do
  let(:token) { double acceptable?: true, accessible?: true, resource_owner_id: user.id, application: OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow( controller ).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a SavedLocationsController"
end


