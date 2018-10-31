require "attr_extras"
require "rails_helper"
require "app/policies/commenting_policy"

describe CommentingPolicy do
  describe "#comment_on?" do
    context "when line with violation has not been previously commented on" do
      it "returns true" 

    end

    context "when line with violation has been previously commented on" do
      context "when comment includes violation message" do
        it "returns false" 

      end

      context "when comment exists for the same line but different files" do
        it "returns true" 

      end

      context "when comment does not include violation message" do
        it "returns true" 

      end

      context "when commented line changes patch location" do
        it "returns false" 

      end
    end
  end

  def stub_comment(options = {})
    defaults = {
      user: double("GitHubUser", login: Hound::GITHUB_USERNAME),
    }
    double("GitHubComment", defaults.merge(options))
  end

  def stub_violation(options = {})
    defaults = {
      filename: "foo.rb",
      messages: ["Extra newline"],
      patch_position: 1,
    }
    instance_double("Violation", defaults.merge(options))
  end

  def stub_pull_request(options = {})
    defaults = { opened?: true, comments: [] }
    instance_double("PullRequest", defaults.merge(options))
  end
end

