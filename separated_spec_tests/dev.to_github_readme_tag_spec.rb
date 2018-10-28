# Sigh, this is tough to test.

require "rails_helper"

vcr_option = {
  cassette_name: "github_api_readme",
  allow_playback_repeats: "true",
}

RSpec.describe GithubTag::GithubReadmeTag, vcr: vcr_option do
  describe "#id" do
    let(:path) { "facebook/react" }
    let(:my_ocktokit_client) { instance_double(Octokit::Client) }
    let(:user) { create(:user) }
    let(:identity) do
      create(:identity, user_id: user.id, token: "ebd80ff5515c4d14dd1af2e0c33ff570114d1f99")
    end

    setup { Liquid::Template.register_tag("github", GithubTag) }

    def generate_github_readme(path)
      Liquid::Template.parse("{% github #{path} %}")
    end

    it "accepts proper github link" 


    it "rejects github link without domain" 


    it "rejects invalid github issue link" 

  end
end

