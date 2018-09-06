require 'spec_helper'

describe Import::GithubController do
  include ImportSpecHelper

  let(:provider) { :github }

  include_context 'a GitHub-ish import controller'

  describe "GET new" do
    it_behaves_like 'a GitHub-ish import controller: GET new'

    it "redirects to GitHub for an access token if logged in with GitHub" 

  end

  describe "GET callback" do
    it "updates access token" 

  end

  describe "POST personal_access_token" do
    it_behaves_like 'a GitHub-ish import controller: POST personal_access_token'
  end

  describe "GET status" do
    it_behaves_like 'a GitHub-ish import controller: GET status'
  end

  describe "POST create" do
    it_behaves_like 'a GitHub-ish import controller: POST create'
  end
end

