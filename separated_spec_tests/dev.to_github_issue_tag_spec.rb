require "rails_helper"

vcr_option = {
  cassette_name: "github_api",
  allow_playback_repeats: "true",
}

RSpec.describe GithubTag::GithubIssueTag, vcr: vcr_option do
  describe "#id" do
    let(:github_link) { "https://github.com/facebook/react/issues/9218" }

    setup { Liquid::Template.register_tag("github", GithubTag) }

    def generate_github_issue(link)
      Liquid::Template.parse("{% github #{link} %}")
    end

    it "rejects github link without domain" 


    it "rejects invalid github issue link" 


    it "renders properly" 

  end
end

