require "rails_helper"

RSpec.describe CompleteFileReview do
  describe ".call" do
    it "completes FileReview with violations" 


    it "runs completes the build" 


    context "when there are two builds with the same commit_sha" do
      it "finds the correct build by pull request number" 

    end

    context "when one of the file reviews is not complete" do
      it "does not complete build" 

    end
  end

  def attributes
    {
      filename: "test.scss",
      commit_sha: "abc123",
      pull_request_number: 123,
      patch: File.read("spec/support/fixtures/patch.diff"),
      violations: [line: 14, message: "woohoo"],
      error: "Your linter config is invalid",
    }
  end

  def create_file_review
    build = build(
      :build,
      commit_sha: attributes.fetch(:commit_sha),
      pull_request_number: attributes.fetch(:pull_request_number),
    )
    create(:file_review, build: build, filename: attributes.fetch(:filename))
  end
end

