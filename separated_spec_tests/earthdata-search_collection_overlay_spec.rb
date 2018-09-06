require 'spec_helper'

describe 'Collections overlay', :reset => false do
  before(:all) do
    Capybara.reset_sessions!
    load_page :search
  end

  after(:each) do
    reset_overlay
    reset_project
  end

  it "shows collection details when clicking on a collection" 


  context "after returning to the collection list from the project view" do
    before(:all) do
      first_collection_result.click_link "Add collection to the current project"
      second_collection_result.click_link "Add collection to the current project"
      find("#view-project").click
      project_overview.click_link "Back to Collection Search"
    end

    it "shows facet list" 


    it "shows collection details when clicking on a collection" 

  end

  context "clicking to close facet list and adding collections to a project" do
    before :all do
      load_page :search, facets: true
      manual_close_facet_list

      first_collection_result.click_link "Add collection to the current project"
      second_collection_result.click_link "Add collection to the current project"
      find("#view-project").click
    end

    after :all do
      reset_overlay
      reset_project
    end

    context "returning to the collections list from the project view" do
      before :all do
        project_overview.click_link "Back to Collection Search"
      end

      it "doesn't show facet list" 

    end
  end
end

