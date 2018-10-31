require "rails_helper"

describe "SearchController", elasticsearch: true do
  let!(:project) { create(:project) }

  describe "GET /search", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /search.atom", type: :request do
    it "renders successfully when logged out" 

  end
end

