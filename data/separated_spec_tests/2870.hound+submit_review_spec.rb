require "rails_helper"

RSpec.describe SubmitReview do
  describe ".call" do
    it "posts a review with max comments to GitHub" 


    context "with existing violations" do
      it "makes comments only for new violations" 

    end

    context "without installation id" do
      it "uses Hound's github token to submit review" 

    end
  end

  def stub_violation(message)
    instance_double(
      "Violation",
      filename: "test.rb",
      messages: [message],
      patch_position: 1,
    )
  end

  def build_comment(filename:, body:)
    double("GitHubComment", path: filename, position: 1, body: body)
  end

  def stub_repo
    instance_double("Repo", installation_id: 505, name: "org/repo")
  end

  def stub_build(violations:, review_errors: [], repo: stub_repo)
    instance_double(
      "Build",
      repo: repo,
      repo_name: "org/repo",
      pull_request_number: 55,
      violations: violations,
      review_errors: review_errors,
    )
  end

  def stub_github(comments: [])
    github = instance_double(
      "GitHubApi",
      pull_request_comments: comments,
      create_pull_request_review: nil,
      create_installation_token: "gh-installation-token",
    )
    allow(GitHubApi).to receive(:new).and_return(github)
    github
  end
end

