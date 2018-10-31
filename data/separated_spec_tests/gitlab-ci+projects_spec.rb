require 'spec_helper'

describe API::API do
  include ApiHelpers

  let(:gitlab_url) { GitlabCi.config.gitlab_server.url }
  let(:private_token) { Network.new.authenticate(access_token: "some_token")["private_token"] }

  let(:options) {
    {
      private_token: private_token,
      url: gitlab_url
    }
  }
  
  before {
    stub_gitlab_calls
  }
  
  context "requests for scoped projects" do
    # NOTE: These ids are tied to the actual projects on demo.gitlab.com
    describe "GET /projects" do
      let!(:project1) { FactoryGirl.create(:project, name: "gitlabhq", gitlab_id: 3) }
      let!(:project2) { FactoryGirl.create(:project, name: "gitlab-ci", gitlab_id: 4) }

      it "should return all projects on the CI instance" 

    end

    describe "GET /projects/owned" do
      # NOTE: This user doesn't own any of these projects on demo.gitlab.com
      let!(:project1) { FactoryGirl.create(:project, name: "gitlabhq", gitlab_id: 3) }
      let!(:project2) { FactoryGirl.create(:project, name: "random-project", gitlab_id: 9898) }

      it "should return all projects on the CI instance" 

    end
  end
  
  describe "POST /projects/:project_id/webhooks" do
    let!(:project) { FactoryGirl.create(:project) }

    context "Valid Webhook URL" do
      let!(:webhook) { {web_hook: "http://example.com/sth/1/ala_ma_kota" } }

      before do
        options.merge!(webhook)
      end

      it "should create webhook for specified project" 


      it "fails to create webhook for non existsing project" 


      it "non-manager is not authorized" 

    end

    context "Invalid Webhook URL" do
      let!(:webhook) { {web_hook: "ala_ma_kota" } }

      before do
        options.merge!(webhook)
      end

      it "fails to create webhook for not valid url" 

    end

    context "Missed web_hook parameter" do
      it "fails to create webhook for not provided url" 

    end
  end

  describe "GET /projects/:id" do
    let!(:project) { FactoryGirl.create(:project) }

    context "with an existing project" do
      it "should retrieve the project info" 

    end

    context "with a non-existing project" do
      it "should return 404 error if project not found" 

    end
  end

  describe "PUT /projects/:id" do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:project_info) { {name: "An updated name!" } }

    before do
      options.merge!(project_info)
    end

    it "should update a specific project's information" 


    it "fails to update a non-existing project" 


    it "non-manager is not authorized" 

  end

  describe "DELETE /projects/:id" do
    let!(:project) { FactoryGirl.create(:project) }

    it "should delete a specific project" 


    it "non-manager is not authorized" 


    it "is getting not found error" 

  end

  describe "POST /projects" do
    let(:project_info) {
      {
        name: "My project",
        gitlab_id: 1,
        path: "testing/testing",
        ssh_url_to_repo: "ssh://example.com/testing/testing.git"
      }
    }

    let(:invalid_project_info) { {} }

    context "with valid project info" do
      before do
        options.merge!(project_info)
      end

      it "should create a project with valid data" 

    end

    context "with invalid project info" do
      before do
        options.merge!(invalid_project_info)
      end

      it "should error with invalid data" 

    end

    describe "POST /projects/:id/runners/:id" do
      let(:project) { FactoryGirl.create(:project) }
      let(:runner) { FactoryGirl.create(:runner) }

      it "should add the project to the runner" 


      it "should fail if it tries to link a non-existing project or runner" 


      it "non-manager is not authorized" 

    end

    describe "DELETE /projects/:id/runners/:id" do
      let(:project) { FactoryGirl.create(:project) }
      let(:runner) { FactoryGirl.create(:runner) }

      before do
        post api("/projects/#{project.id}/runners/#{runner.id}"), options
      end

      it "should remove the project from the runner" 


      it "non-manager is not authorized" 

    end
  end
end

