require "rails_helper"

describe RepoSynchronization do
  describe "#start" do
    it "saves privacy flag" 


    it "replaces existing repos" 


    context "when there is an 'ActiveRecord::RecordNotUnique' exception" do
      it "finishes the synchronization" 

    end

    context "when the user is a repo admin" do
      it "the memberships admin flag is true" 

    end

    context "when the user is not a repo admin" do
      it "the membership admin flag is false" 

    end

    context "when repo was renamed to an existing repo" do
      it "updates the repo names" 

    end

    context "when a repo membership already exists" do
      it "creates another membership" 

    end

    describe "repo owners" do
      context "when the owner doesn't exist" do
        it "creates and associates an owner to the repo" 

      end

      context "when the owner exists" do
        it "updates and associates an owner to the repo" 

      end
    end

    context "when user has an installation" do
      it "saves the installation id on the repo" 

    end

    def stub_github_api_installation_repos(repo_name:)
      repo = build_github_repo(id: 123, name: repo_name)
      app_token = instance_double("AppToken", generate: "some-app-token")
      api = instance_double(
        "GitHubApi",
        create_installation_token: "some-token",
        installation_repos: [repo],
      )
      allow(AppToken).to receive(:new).and_return(app_token)
      allow(GitHubApi).to receive(:new).and_return(api)
    end

    def stub_github_api_repos(repo_name:, repo_id:, owner_id: 1, admin: false)
      repo = build_github_repo(id: repo_id, name: repo_name)
      repo[:owner][:id] = owner_id
      repo[:permissions][:admin] = admin

      api = instance_double("GitHubApi", repos: [repo])
      allow(GitHubApi).to receive(:new).and_return(api)

      repo
    end

    def build_github_repo(id:, name:)
      {
        full_name: name,
        id: id,
        private: true,
        owner: {
          id: 123,
          login: "thoughtbot",
          type: "Organization",
        },
        permissions: {
          admin: false,
        },
      }
    end
  end
end

