require "spec_helper"

describe ProjectsController do
  before do
    @project = FactoryGirl.create :project
  end

  describe "POST #build" do
    it 'should respond 200 if params is ok' 


    it 'should respond 400 if push about removed branch' 


    it 'should respond 400 if some params missed' 


    it 'should respond 403 if token is wrong' 

  end

  describe "POST /projects" do
    let(:project_dump) { YAML.load File.read(Rails.root.join('spec/support/gitlab_stubs/raw_project.yml')) }
    let(:gitlab_url) { GitlabCi.config.gitlab_server.url }

    let (:user_data) do
      data = JSON.parse File.read(Rails.root.join('spec/support/gitlab_stubs/user.json'))
      data.merge("url" => gitlab_url)
    end

    let(:user) do
      User.new(user_data)
    end

    it "creates project" 


    it "shows error" 

  end

  describe "GET /gitlab" do
    let(:gitlab_url) { GitlabCi.config.gitlab_server.url }

    let (:user_data) do
      data = JSON.parse File.read(Rails.root.join('spec/support/gitlab_stubs/user.json'))
      data.merge("url" => gitlab_url)
    end

    let(:user) do
      User.new(user_data)
    end

    it "searches projects" 

  end
end

