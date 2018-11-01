require "rails_helper"

RSpec.describe StartBuild do
  describe "#call" do
    context "with active repo and opened pull request" do
      it "creates a build record with violations" 


      it "initializes PullRequest with payload and Hound token" 


      it "sets the GitHub status to pending" 


      it "upserts repository owner" 

    end

    context "when the repo is not active" do
      it "does not create a build" 

    end

    context "when pull request is not opened or synchronized" do
      it "does not create a build" 

    end

    context "with subscribed private repo and opened pull request" do
      it "tracks build events" 

    end

    context "when the config is invalid" do
      it "sets the status with a helpful message" 

    end

    context "when user's token doesn't have access to the repo" do
      it "removes the repo from user" 

    end

    context "when build creation fails" do
      it "does not schedule review job" 


      it "updates commit status with error to avoid hanging build" 


      def force_fail_build_creation
        allow(SecureRandom).to receive(:uuid)
      end
    end

    context "when no files need to be reviewed" do
      it "sets the final status as passing" 

    end

    context "when status cannot be updated" do
      it "removes the user's repo membership" 

    end

    def stub_review_files(violations: [])
      file_review = build(:file_review, :completed, violations: violations)
      review_files = instance_double("ReviewFiles", call: nil)
      allow(ReviewFiles).to receive(:new) do |*args|
        build = args[1]
        build.file_reviews << file_review
      end.and_return(review_files)

      review_files
    end

    def stubbed_pull_request(files = [double("CommitFile")])
      head_commit = double(
        "HeadCommit",
        sha: "headsha",
        repo_name: "test/repo",
        file_content: "",
      )
      stub_commit_to_return_hound_config(head_commit)
      pull_request = double(
        "PullRequest",
        commit_files: files,
        config: double(:config),
        opened?: true,
        head_commit: head_commit,
      )
      allow(PullRequest).to receive(:new).and_return(pull_request)

      pull_request
    end

    def stubbed_pull_request_with_file(filename, file_content)
      commit_file = commit_file_stub(filename, file_content)
      stubbed_pull_request([commit_file])
    end

    def commit_file_stub(filename, file_content)
      double(
        "CommitFile",
        filename: filename,
        content: file_content,
        removed?: false,
        sha: "abcd1234",
        pull_request_number: 1,
        patch: "sometext",
      )
    end

    def stub_commit(configuration)
      commit = double("Commit")
      hound_config = configuration.delete(:hound_config)
      allow(commit).to receive(:file_content)
      allow(commit).to receive(:file_content).
        with(HoundConfig::CONFIG_FILE).and_return(hound_config)
      stub_configuration_for_commit(configuration, commit)

      commit
    end

    def stub_configuration_for_commit(configuration, commit)
      configuration.each do |filename, contents|
        allow(commit).to receive(:file_content).
          with(filename).and_return(contents)
      end
    end
  end

  def make_service(repo: create(:repo, :active))
    payload = stubbed_payload(
      github_repo_id: repo.github_id,
      full_repo_name: repo.name,
    )
    described_class.new(payload)
  end

  def stubbed_payload(options = {})
    defaults = {
      action: "synchronize",
      pull_request_number: 123,
      head_sha: "somesha",
      full_repo_name: "foo/bar",
      repository_owner_id: 456,
      repository_owner_name: "foo",
      repository_owner_is_organization?: true,
      build_data: { payload_stuff: "test" }
    }
    double("Payload", defaults.merge(options))
  end

  def stubbed_github_api
    github_api = instance_double(
      "GitHubApi",
      create_pending_status: nil,
      create_success_status: nil,
      create_error_status: nil,
      repository?: true,
    )
    allow(GitHubApi).to receive(:new).and_return(github_api)

    github_api
  end

  def invalid_config_file(pull_request, stubs = {})
    stubs.each do |filename, content|
      allow(pull_request.head_commit).to receive(:file_content).
        with(filename).
        and_return(content)
    end
  end

  def config_url
    ENV.fetch("DOCS_URL")
  end
end

