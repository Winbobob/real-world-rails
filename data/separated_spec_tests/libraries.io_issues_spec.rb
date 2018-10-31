require "rails_helper"

describe "IssuesController", elasticsearch: true do
  let!(:issue) { create(:issue) }

  describe "GET /help-wanted", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /first-pull-request", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/issues", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /github/issues/your-dependencies", type: :request do
    it "renders successfully when logged in" 

  end
end

