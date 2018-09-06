require 'spec_helper'

describe "Sharing Projects", reset: false do
  let(:query_re) { /^projectId=(\d+)$/ }

  before :all do
    Capybara.reset_sessions!
    load_page :search
    login
  end

  context "when viewing a project that has been shared" do
    before :all do
      project = create_project
      logout

      project_id = project.to_param
      visit "/search/collections?projectId=#{project_id}"
      wait_for_xhr
      login
      wait_for_xhr
    end

    after :all do
      logout
    end

    it "shows the contents of the project" 


    it "inflates the url" 

  end

  context "when sharing a project with a long path" do
    project_id = nil
    new_project_id = nil

    before :all do
      path = '/search/collections?p=!C179001887-SEDAC!C1000000220-SEDAC!C179001967-SEDAC!C179001889-SEDAC!C179001707-SEDAC!C179002107-SEDAC!C179002147-SEDAC!C1000000000-SEDAC'
      user = User.first
      project = Project.new
      project.path = path
      project.name = "Test Project"
      project.user_id = user.id
      project.save!

      logout

      project_id = Project.first.to_param
      visit "/search/collections?projectId=#{project_id}"
      wait_for_xhr
      # EDSC-1394: This login really might be defeating the purpose of this test and should be reviewed
      login
      wait_for_xhr
      new_project_id = Project.first.to_param
    end

    it "shows the contents of the project" 


    it "saves the path into a new project for the new user" 


    it "changes the url to include a new project id" 

  end
end

