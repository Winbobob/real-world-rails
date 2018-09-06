require 'spec_helper'

describe API::ProjectHooks, 'ProjectHooks' do
  let(:user) { create(:user) }
  let(:user3) { create(:user) }
  let!(:project) { create(:project, creator_id: user.id, namespace: user.namespace) }
  let!(:hook) do
    create(:project_hook,
           :all_events_enabled,
           project: project,
           url: 'http://example.com',
           enable_ssl_verification: true)
  end

  before do
    project.add_master(user)
    project.add_developer(user3)
  end

  describe "GET /projects/:id/hooks" do
    context "authorized user" do
      it "returns project hooks" 

    end

    context "unauthorized user" do
      it "does not access project hooks" 

    end
  end

  describe "GET /projects/:id/hooks/:hook_id" do
    context "authorized user" do
      it "returns a project hook" 


      it "returns a 404 error if hook id is not available" 

    end

    context "unauthorized user" do
      it "does not access an existing hook" 

    end

    it "returns a 404 error if hook id is not available" 

  end

  describe "POST /projects/:id/hooks" do
    it "adds hook to project" 


    it "adds the token without including it in the response" 


    it "returns a 400 error if url not given" 


    it "returns a 422 error if url not valid" 

  end

  describe "PUT /projects/:id/hooks/:hook_id" do
    it "updates an existing project hook" 


    it "adds the token without including it in the response" 


    it "returns 404 error if hook id not found" 


    it "returns 400 error if url is not given" 


    it "returns a 422 error if url is not valid" 

  end

  describe "DELETE /projects/:id/hooks/:hook_id" do
    it "deletes hook from project" 


    it "returns success when deleting hook" 


    it "returns a 404 error when deleting non existent hook" 


    it "returns a 404 error if hook id not given" 


    it "returns a 404 if a user attempts to delete project hooks he/she does not own" 

  end
end

