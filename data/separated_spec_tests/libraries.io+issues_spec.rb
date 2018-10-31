require "rails_helper"

describe "Api::IssuesController", elasticsearch: true do
  let!(:issue) { create(:issue) }

  describe "GET /api/github/issues/help-wanted", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/github/issues/first-pull-request", type: :request do
    it "renders successfully" 

  end
end

