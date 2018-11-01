require "rails_helper"

RSpec.describe "GithubRepos", type: :request do
  let(:user) { create(:user) }
  let(:repo) { build(:github_repo, user_id: user.id) }
  let(:my_ocktokit_client) { instance_double(Octokit::Client) }
  let(:stubbed_github_repos) do
    [OpenStruct.new(repo.attributes.merge(id: repo.github_id_code, html_url: Faker::Internet.url))]
  end

  before do
    allow(Octokit::Client).to receive(:new).and_return(my_ocktokit_client)
    allow(my_ocktokit_client).to receive(:repositories) { stubbed_github_repos }
    sign_in user
  end

  describe "POST /github_repos" do
    it "returns a 302" 


    it "creates a new GithubRepo object" 

  end

  describe "PUT /github_repos/:id" do
    before do
      repo.save
    end

    it "returns a 302" 


    it "unfeatures the requested GithubRepo" 

  end
end

