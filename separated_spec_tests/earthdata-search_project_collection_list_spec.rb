require "spec_helper"

describe "Project collection list", reset: true do

  context 'For collections that have granules' do
    before(:each) do
      load_page :search
      add_collection_to_project("C179003030-ORNL_DAAC", "15 Minute Stream Flow Data: USGS (FIFE)")
      add_collection_to_project("C179002914-ORNL_DAAC", "30 Minute Rainfall Data (FIFE)")
      find("#view-project").click
    end

    after(:each) do
      Capybara.reset_sessions!
    end

    it "displays collections that have been added to the project" 


    it 'hides the "Browse Collections" pane' 


    it "provides navigation back to the collection search" 


    context "when clicking on a collection's \"View collection details\" link" do
      it "shows the collection's details" 

    end

    context 'when clicking the "Remove" button' do
      before(:each) do
        first_project_collection.click_link "Remove collection from the current project"
      end

      it "removes the selected collection from the project list" 

    end

    context "when clicking the 'View all collections' button" do
      before :each do
        click_link 'View all collections'
      end

      it "highlights all project collections" 


      it "un-highlights all project collections when clicking the button again" 

    end

    context "when applying a temporal constraint to the second collection in the project" do

      before :each do
        second_project_collection.click_link "Show granule filters"
        fill_in "Start", with: "1987-10-15 00:00:00\t"
        fill_in "End", with: "1987-10-20 23:59:59\t"
        click_button "granule-filters-submit"
        wait_for_xhr
      end

      after :each do
        second_project_collection.click_link "Show granule filters"
        click_button "granule-filters-clear"
      end

      it "doesn't show an empty query param 'pg[]=' in the url" 

    end
  end

  context 'For collection-only collections' do
    before :each do
      load_page :search, project: ['C1386250131-NSIDCV0'], view: :project, ac: true
    end

    after :each do
      Capybara.reset_sessions!
    end

    it 'displays the collection in the project' 

  end
end

