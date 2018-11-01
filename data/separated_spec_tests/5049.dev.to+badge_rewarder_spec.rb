# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
require "rails_helper"

RSpec.describe BadgeRewarder do
  it "rewards birthday badge to birthday folks who registered a year ago" 


  it "rewards beloved comment to folks who have a qualifying comment" 


  it "rewards top seven badge to users" 


  it "rewards contributor badges" 


  describe "::award_contributor_badges_from_github" do
    let(:my_ocktokit_client) { instance_double(Octokit::Client) }
    let(:user) { create(:user) }

    let(:stubbed_github_commit) do
      [OpenStruct.new(author: OpenStruct.new(id: user.identities.first.uid))]
    end

    before do
      allow(Octokit::Client).to receive(:new).and_return(my_ocktokit_client)
      allow(my_ocktokit_client).to receive(:commits).and_return(stubbed_github_commit)
      create(:badge, title: "DEV Contributor")
    end

    it "award contributor badge" 

  end
end

# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

