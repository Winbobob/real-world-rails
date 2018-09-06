require 'rails_helper'

describe GithubHookHandler do
  describe "#run" do
    describe "create event" do
      context "repository" do
        it "runs a repository event" 

      end

      context "tag" do
        it "enqueues TagWorker" 

      end
    end

    describe "issue_comment event" do
      it "enqueues IssueWorker" 

    end

    describe "issues event" do
      context "valid action" do
        it "enqueues IssueWorker" 

      end

      context "invalid action" do
        it "does not enqueue IssueWorker" 

      end
    end

    describe "pull_request event" do
      let(:params) do
        {
          "action" => "opened",
          "repository" => {},
          "pull_request" => {},
          "sender" => {}
        }
      end

      it "runs pull request events" 

    end

    describe "push event" do
      it "enqueues GithubHookWorker" 

    end

    describe "public, release, repository event" do
      it "enqueues CreateRepositoryWorker" 

    end

    describe "watch event" do
      it "enqueues a GithubStarWorker" 

    end
  end
end

