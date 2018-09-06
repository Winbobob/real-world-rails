require "rails_helper"

describe "Api::BowerSearchController", elasticsearch: true do
  let!(:project) { create(:project, platform: 'Bower') }

  describe "GET /api/bower-search", type: :request do
    it "renders successfully" 

  end
end

