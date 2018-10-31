require "rails_helper"

describe "RepositoriesController" do
  let!(:repository) { create(:repository) }
  let!(:tag) { create(:tag, repository: repository) }
  let!(:issue) { create(:issue, repository: repository) }
  let!(:contribution) { create(:contribution, repository: repository) }

  describe "GET /github", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/search", type: :request, elasticsearch: true do
    it "renders successfully when logged out" 

  end

  describe "GET /github/search.atom", type: :request, elasticsearch: true do
    it "renders successfully when logged out" 

  end

  describe "GET /github/languages", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/trending", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/new", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/:owner/:name", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/:owner/:name/tags", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/:owner/:name/contributors", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/:owner/:name/forks", type: :request do
    it "renders successfully when logged out" 

  end
end

