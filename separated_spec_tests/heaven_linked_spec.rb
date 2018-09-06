require "spec_helper"
require "heaven/comparison/linked"
require "support/helpers/comparison_helper"

describe "Heaven::Comparison::Linked" do
  include ComparisonHelper

  let(:comparison) do
    {
      :html_url => "https://github.com/org/repo/compare/sha...sha",
      :total_commits => 1,
      :commits => [
        build_commit_hash("Commit message #123"),
        build_commit_hash("Another commit")
      ],
      :files => [{
        :additions => 1,
        :deletions => 2,
        :changes => 3
      }, {
        :additions => 1,
        :deletions => 2,
        :changes => 3
      }]
    }.with_indifferent_access
  end

  describe "#changes" do
    it "prints out a formatted and linked list of commit changes" 


    it "accepts a commit list limit" 

  end
end

