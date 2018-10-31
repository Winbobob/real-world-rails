# frozen_string_literal: true

require "rails_helper"

describe ClassroomConfig do
  let(:organization) { classroom_org }
  let(:config_branch) { ClassroomConfig::CONFIG_BRANCH }

  before do
    Octokit.reset!
    @client = oauth_client
  end

  before(:each) do
    github_organization = GitHubOrganization.new(@client, organization.github_id)
    @github_repository  = github_organization.create_repository("test-repository", private: true)
  end

  after(:each) do
    @client.delete_repository(@github_repository.id)
  end

  describe "#initialize", :vcr do
    it "raises Error without github-classroom branch" 


    it "succeeds with a github-classroom branch" 

  end

  context "valid template repo" do
    subject { ClassroomConfig.new(stub_repository("template")) }

    before(:each) do
      create_github_branch(@client, @github_repository, config_branch)
    end

    describe "#setup_repository", :vcr do
      it "completes repo setup" 

    end

    describe "#configurable?", :vcr do
      it "is configurable when github-classroom exists" 


      it "is not configurable after setup" 

    end
  end
end

