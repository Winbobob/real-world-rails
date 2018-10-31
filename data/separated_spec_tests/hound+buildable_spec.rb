require "rails_helper"

describe Buildable do
  class BuildableTestJob < ActiveJob::Base
    include Buildable
  end

  describe "#perform" do
    it 'runs build runner' 


    it "runs repo updater" 


    context "when the pull request has been blacklisted" do
      it "does not set the status" 


      it "does not run the build" 

    end
  end

  describe "#after_retry_exhausted" do
    it "sets internal server error on github" 

  end

  def payload_data(github_id: 1234, repo_name: "user/repo", pr_number: 1)
    {
      "number" => pr_number,
      "repository" => {
        "id" => github_id,
        "full_name" => repo_name,
        "owner" => {
          "login" => "foo",
          "type" => "Organization"
        }
      }
    }
  end

  def stub_payload(payload_data)
    payload = double(
      Payload,
      github_repo_id: 1,
      full_repo_name: "user/repo",
      pull_request_number: 1,
    )
    allow(Payload).to receive(:new).with(payload_data).and_return(payload)
    payload
  end
end

