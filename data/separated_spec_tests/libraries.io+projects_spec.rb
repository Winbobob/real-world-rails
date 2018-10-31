require "rails_helper"

describe "Api::ProjectsController" do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, name: 'foo.bar@baz:bah,name') }
  let!(:dependent_project) { create(:project) }
  let!(:version) { create(:version, project: project) }
  let!(:dependent_version) { create(:version, project: dependent_project) }
  let!(:dependency) { create(:dependency, version: version, project: dependent_project) }

  before :each do
    project.reload
    dependent_project.reload
  end

  describe "GET /api/:platform/:name", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/dependents", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/dependent_repositories", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/searchcode", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/dependencies", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/dependencies?subset=minimum", type: :request do
    it "renders successfully" 

  end

  describe "POST /api/projects/dependencies", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/contributors", type: :request do
    it "renders successfully" 

  end

  describe "GET /api/:platform/:name/sourcerank", type: :request do
    it "renders successfully" 

  end
end

