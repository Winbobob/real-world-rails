require "rails_helper"

RSpec.describe ReviewFiles do
  describe "#call" do
    it "returns a collection of incomplete file reviews" 


    it "only fetches content for supported files" 


    context "with unsupported file type" do
      it "uses the unsupported linter" 

    end
  end

  def pull_request_file_reviews(pull_request)
    repo = build(:repo, owner: build(:owner, config_enabled: false))
    build = build(:build, repo: repo)

    described_class.new(pull_request, build).call

    build.file_reviews
  end

  def pull_request_violation_messages(pull_request)
    build = build(
      :build,
      repo: build(:repo, owner: build(:owner, config_enabled: false)),
    )

    described_class.new(pull_request, build).call

    build.violations.flat_map(&:messages)
  end

  def stub_pull_request(options = {})
    defaults = {
      file_content: "",
      head_commit: stubbed_head_commit,
      commit_files: [],
    }

    double("PullRequest", defaults.merge(options))
  end

  def stubbed_head_commit
    head_commit = double("Commit", file_content: "{}")
    allow(head_commit).to receive(:file_content).with(".hound.yml").
      and_return(raw_hound_config)

    head_commit
  end

  def stub_commit_file(filename, contents, line = nil)
    line ||= Line.new(content: "foo", number: 1, patch_position: 2)
    formatted_contents = "#{contents}\n"
    double(
      "CommitFile",
      filename: filename,
      content: formatted_contents,
      line_at: line,
      sha: "abc123",
      patch: "patch",
      pull_request_number: 123
    )
  end

  def stub_head_commit(options = {})
    default_options = {
      HoundConfig::CONFIG_FILE => raw_hound_config,
    }
    head_commit = double("Commit", file_content: "")

    default_options.merge(options).each do |filename, file_contents|
      allow(head_commit).to receive(:file_content).
        with(filename).and_return(file_contents)
    end

    head_commit
  end

  def payload_stub
    double(
      "Payload",
      full_repo_name: "foo/bar",
      head_sha: "abc",
      repository_owner_name: "ralph",
    )
  end
end

