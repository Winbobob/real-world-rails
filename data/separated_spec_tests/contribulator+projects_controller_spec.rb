require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "GET #index" do
    let(:project) { create(:project) }

    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" 


    it "renders the index template" 


    it "loads all of the projects into @projects" 

  end

  describe "GET #show" do
    let(:project) { create(:project) }

    describe "show by id" do
      before do
        get :show, params: { id: project.id }
      end

      it "responds successfully with an HTTP 200 status code" 


      it "renders the index template" 


      it "loads all of the project into @project" 

    end

    describe "show by user/repo" do
      before do
        get :show, params: { user: project.owner, repo: project.name }
      end

      it "responds successfully with an HTTP 200 status code" 


      it "renders the index template" 


      it "loads all of the project into @project" 

    end

    describe "missing repo by user/repo" do
      it "redirects to a prompt screen before adding the repo" 


      it "redirects on create action too" 


      it "doesn't attempt to add the project" 

    end
  end

  describe "GET #confirm" do
    it "redirects to the proejcts index if the url parameter is missing" 


    it "displays a confirmation screen for adding a project" 

  end
end

