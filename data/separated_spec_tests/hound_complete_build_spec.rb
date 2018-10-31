require "rails_helper"

describe CompleteBuild do
  describe ".call" do
    context "when build has violations" do
      context "when the build is complete" do
        it "makes comments only for new violations and repects max limit" 


        context "when fail on violations is disabled" do
          it "sets GitHub status to complete" 

        end

        context "when fail on violations is enabled" do
          it "sets GitHub status to failed" 

        end
      end

      context "when the build is not complete" do
        it "does not comment and does not set success status" 

      end
    end

    context "when build does not have violations" do
      it "sets GitHub status to complete" 


      it "does not send a PR review" 

    end

    context "when build has file review errors" do
      it "adds a comment to pull request review" 

    end

    context "with subscribed private repo and opened pull request" do
      it "tracks build events" 

    end

    def stubbed_github_api
      github_api = instance_double(
        "GitHubApi",
        create_success_status: nil,
        create_error_status: nil,
      )
      allow(GitHubApi).to receive(:new).and_return(github_api)

      github_api
    end

    def stubbed_hound_config(options = {})
      hound_config = instance_double("HoundConfig", options)
      allow(HoundConfig).to receive(:new).and_return(hound_config)

      hound_config
    end

    def stub_build(violation_messages, attributes = {})
      violations = violation_messages.map do |violation_message|
        instance_double(
          "Violation",
          filename: "app/anything.rb",
          patch_position: 1,
          messages: [violation_message],
        )
      end
      repo = instance_double(
        "Repo",
        subscription: false,
        owner: MissingOwner.new,
      )
      default_attributes = {
        completed?: true,
        review_errors: [],
        repo: repo,
        repo_name: "foo/bar",
        commit_sha: "abc123",
        violations: violations,
        violations_count: violations.size,
      }
      instance_double("Build", default_attributes.merge(attributes))
    end

    def stub_pull_request(comments = [])
      head_commit = instance_double("Commit", file_content: "")
      instance_double(
        "PullRequest",
        head_commit: head_commit,
        comments: comments,
        make_comments: nil,
      )
    end

    def build_comment(body)
      OpenStruct.new(path: "app/anything.rb", position: 1, body: body)
    end

    def run_service(build)
      CompleteBuild.call(
        pull_request: stub_pull_request,
        build: build,
        token: "abc123",
      )
    end
  end
end

