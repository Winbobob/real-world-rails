require "rails_helper"

RSpec.describe "POST /builds" do
  let(:payload) do
    File.read("spec/support/fixtures/pull_request_opened_event.json")
  end
  let(:parsed_payload) { JSON.parse(payload) }
  let(:repo_name) { parsed_payload["repository"]["full_name"] }
  let(:repo_id) { parsed_payload["repository"]["id"] }
  let(:pr_sha) { parsed_payload["pull_request"]["head"]["sha"] }
  let(:pr_number) { parsed_payload["number"] }

  context "with violations" do
    it "makes a new comment and cleans up resolved one" 

  end

  context "without violations" do
    it "does not make a comment" 

  end

  def stub_review_job(klass, violations:, error:)
    allow(klass).to receive(:perform) do |attributes|
      CompleteFileReview.call(
        commit_sha: attributes.fetch("commit_sha"),
        filename:  attributes.fetch("filename"),
        linter_name:  attributes.fetch("linter_name"),
        patch:  attributes.fetch("patch"),
        pull_request_number:  attributes.fetch("pull_request_number"),
        violations:  violations,
        error:  error,
      )
    end
  end
end

