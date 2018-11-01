require "rails_helper"

describe "API::StatusController" do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }
  let!(:project_django) { create(:project, name: 'Django', platform: 'Pypi') }

  describe "GET /api/check", type: :request do
    it "renders successfully with one" 


    it "renders empty json list if cannot find Project" 


    it "renders successfully" 

  end
end

