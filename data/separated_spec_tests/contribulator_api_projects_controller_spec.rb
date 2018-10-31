require "rails_helper"

RSpec.describe Api::ProjectsController, type: :controller do
  describe "GET #index" do
    let!(:project) { create(:project, github_id: 123) }

    before do
      get :index
    end

    it "status" 


    it "data contains the project" 


    it "meta contains the record count" 

  end

  describe "GET #show" do
    context 'success' do
      let!(:project) { create(:project, github_id: 123, owner: 'jack', name: 'foo') }

      before do
        get :show, params: { id: 123 }
      end

      it "responds successfully with an HTTP 200 status code" 


      it "github_id" 


      it "attributes" 


      it "links" 

    end

    context '404' do
      before do
        get :show, params: { id: 999 }
      end

      it "404" 


      it "errors" 

    end
  end
end

