require "rails_helper"

describe "TreeController" do
  let(:project) { create(:project) }
  let!(:version) { create(:version, project: project)}

  describe "GET /:platform/:project/tree", type: :request do
    it "renders successfully when logged out" 

  end

  describe "GET /:platform/:project/:version/tree", type: :request do
    it "renders successfully when logged out" 

  end
end

