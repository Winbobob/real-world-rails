require 'spec_helper'

describe "Viewing Projects", reset: false do
  context "when viewing list of saved projects" do
    before :all do
      Capybara.reset_sessions!
      load_page :search

      login

      create_project

      visit '/projects'
    end

    it "shows a list of saved projects" 


    context "when clicking on a project" do
      before :all do
        click_link "Test Project"
      end

      after :all do
        visit '/projects'
      end

      it "displays the selected project" 

    end

    context "when clicking on the remove button" do
      before :all do
        click_link 'Remove Project'
        wait_for_xhr
      end

      after :all do
        create_project
        visit '/projects'
      end

      it "removes the project from the list" 

    end

    context "when clicking the share button" do
      before :all do
        click_link "Share Project"
      end

      after :all do
        click_button 'Close'
      end

      it "shows a popover" 


      it "shows the project url to be copied" 


      it "highlights the url" 

    end

  end
end

