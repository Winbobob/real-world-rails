# EDSC-139: As a user, I want to access concise help text about key concepts on
#           the site so that I may learn about features that are unclear to me

# Note: We also show popover help in places it is needed, particularly shape files
#       that help is tested with the corresponding feature that triggers it.

require "spec_helper"

describe 'Project help', reset: false do

  before :all do
    load_page :search
  end

  context 'viewing collection results with no items in the project' do
    it 'shows a "Learn More" button for learning more about projects' 


    context 'clicking the "Learn More" button' do
      before :all do
        click_on 'Learn More'
      end

      after :all do
        click_on 'Back to Collection Search'
      end

      it 'displays an empty project list with help information' 

    end
  end

  context 'viewing collection results with items in the project' do
    before :all do
      first_collection_result.click_link "Add collection to the current project"
    end

    after :all do
      first_collection_result.click_link "Remove collection from the current project"
    end

    it 'hides the "Learn More" button' 

  end

  context 'viewing the project list with collections in the project' do
    before :each do
      first_collection_result.click_link "Add collection to the current project"
      find("#view-project").click
    end

    after :each do
      reset_overlay
      reset_project
      reset_visible_collections
    end

    it 'displays no project help information' 


    context 'removing all collections from the project' do
      before :each do
        first_project_collection.click_link 'Remove collection from the current project'
      end

      it 'displays project help information' 

    end
  end


end

