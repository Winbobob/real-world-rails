require "rails_helper"

describe RepoActivator do
  describe "#activate" do
    context "when repo is public" do
      context "when repo belongs to an org" do
        it "will not add Hound to repo" 


        it "marks repo as active" 


        it "returns true" 

      end

      context "when repo belongs to a user" do
        it "will not add Hound to repo" 


        it "marks repo as active" 


        it "returns true" 

      end
    end

    context "when repo is private" do
      context "when repo belongs to an org" do
        it "adds Hound to repo and accepts the GitHub invitation" 


        it "marks repo as active" 


        it "returns true" 

      end

      context "when repo belongs to a user" do
        it "adds Hound to repo" 


        it "marks repo as active" 


        it "returns true" 

      end

      it "enqueues an invitation job" 

    end

    context "when repo activation succeeds" do
      context "when https is enabled" do
        it "creates GitHub hook using secure build URL" 

      end

      context "when https is disabled" do
        it "creates GitHub hook using insecure build URL" 

      end
    end

    context "when adding hound to repo results in an error" do
      it "returns false" 


      it "adds an error" 


      it "reports raised exception to Sentry" 


      it "only swallows Octokit errors" 

    end

    context "hook already exists" do
      it "does not raise" 

    end
  end

  describe "#deactivate" do
    context "when repo is public" do
      it "does not remove Hound from the repo" 

    end

    context "when repo is private" do
      it "removes Hound from the repo" 


      context "when the subscribed user does not have a membership" do
        it "deactivates the repo" 


        it "does not interact with GitHub" 

      end
    end

    context "when repo deactivation succeeds" do
      it "marks repo as deactivated" 


      it "removes GitHub hook" 


      it "returns true" 

    end

    context "when repo deactivation fails" do
      it "returns false" 


      it "only swallows Octokit errors" 

    end

    context "when removing houndci user from org fails" do
      it "returns true" 

    end
  end

  def build_activator(token: "githubtoken", repo: build(:repo))
    RepoActivator.new(github_token: token, repo: repo)
  end

  def stub_github_api(options = {})
    default_options = {
      remove_hook: true,
      add_collaborator: true,
      remove_collaborator: true,
    }
    api = instance_double("GitHubApi", default_options.merge(options))
    hook = double(:hook, id: 1)
    allow(api).to receive(:create_hook).and_yield(hook)
    allow(GitHubApi).to receive(:new).and_return(api)
    api
  end
end

