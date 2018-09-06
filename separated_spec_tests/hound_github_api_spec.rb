require "spec_helper"
require "attr_extras"
require "lib/github_api"
require "json"

describe GitHubApi do
  before { stub_const("Hound::GITHUB_TOKEN", "token") }

  describe "#repos" do
    it "fetches all repos from GitHub" 

  end

  describe "#scopes" do
    it "returns scopes as a string" 

  end

  describe "#file_contents" do
    context "used multiple times with same arguments" do
      it "requests file content once" 

    end
  end

  describe "#create_hook" do
    context "when hook does not exist" do
      it "creates pull request web hook" 


      it "yields hook" 

    end

    context "when hook already exists" do
      it "does not raise" 


      it "returns true" 

    end
  end

  describe "#remove_hook" do
    it "removes pull request web hook" 


    it "yields given block" 

  end

  describe "#pull_request_files" do
    it "returns changed files in a pull request" 

  end

  describe "#create_pull_request_review" do
    it "adds review comments to GitHub pull request" 

  end

  describe "#pull_request_comments" do
    it "returns comments added to pull request" 

  end

  describe "#create_pending_status" do
    it "makes request to GitHub for creating a pending status" 

  end

  describe "#create_success_status" do
    it "makes request to GitHub for creating a success status" 

  end

  describe "#create_error_status" do
    it "makes request to GitHub for creating an error status" 

  end

  describe "#add_collaborator" do
    it "makes a request to GitHub" 

  end

  describe "#remove_collaborator" do
    it "makes a request to GitHub" 

  end

  def token
    "github_token"
  end

  def repo_name
    "foo/bar"
  end
end

