require 'spec_helper'

describe 'Saving Projects', reset: false do
  context 'when adding a name to a project' do
    let(:path) { '/search/collections?p=!C179002914-ORNL_DAAC!C179003030-ORNL_DAAC' }
    let(:query_re) { /^projectId=(\d+)$/ }

    before :all do
      Capybara.reset_sessions!

      load_page :search, project: ['C179002914-ORNL_DAAC', 'C179003030-ORNL_DAAC']

      # Need to login so that we can save our project
      login

      click_link 'Save your project'
      
      fill_in "workspace-name", with: "Test Project\t" #press tab to exit the input field
      click_save_project_name
    end

    it "shortens the url" 


    it "shows the project name" 


    context "when renaming the project" do
      before :all do
        click_link 'Test Project'
        fill_in "workspace-name", with: "Test Project 2\t"
        click_save_project_name
      end

      it "keeps the same short url" 


      it "shows the new project name" 

    end

    context "when loading the named project" do
      before :each do
        project = create_project(path)

        visit "/search/collections?projectId=#{project.to_param}"
        wait_for_xhr
      end

      it "shows the project name" 

    end
  end
end

