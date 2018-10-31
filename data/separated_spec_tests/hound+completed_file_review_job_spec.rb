require "rails_helper"

describe CompletedFileReviewJob do
  it "is retryable" 


  it "queue_as high" 


  describe "perform" do
    it "calls `CompleteFileReview`" 


    context "when build doesn't exist" do
      it "enqueues job with a 30 second delay" 

    end
  end

  let(:attributes) do
    {
      filename: "test.scss",
      commit_sha: "abc123",
      pull_request_number: 123,
      patch: File.read("spec/support/fixtures/patch.diff"),
      violations: [line: 14, message: "woohoo"],
    }
  end
end

