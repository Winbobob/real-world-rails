require "rails_helper"

describe RepoSynchronization do
  describe "#start" do
    it "saves privacy flag" 


    it "saves organization flag" 


    context "when there is an 'ActiveRecord::RecordNotUnique' exception" do
      it "finishes the synchronization" 

    end

    context "when the user is a repo admin" do
      it "the memberships admin flag is true" 

    end

    context "when the user is not a repo admin" do
      it "the membership admin flag is false" 

    end

    it "replaces existing repos" 


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

    def stub_github_api_repos(repo_name:, repo_id:, owner_id: 1, admin: false)
      repo = build_github_repo(id: repo_id, name: repo_name)
      repo[:owner][:id] = owner_id
      repo[:permissions][:admin] = admin

      api = double("GitHubApi", repos: [repo])
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

