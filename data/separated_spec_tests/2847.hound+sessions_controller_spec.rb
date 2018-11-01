require "rails_helper"

describe SessionsController do
  describe "#create" do
    context "with valid new user" do
      it "creates new user" 

    end

    context "with invalid new user" do
      it "raises and does not save user" 

    end

    context "with existing user" do
      it "updates email and token" 

    end
  end

  def stub_github_api
    instance_double("GitHubApi", scopes: "public_repo,user:email")
  end
end

