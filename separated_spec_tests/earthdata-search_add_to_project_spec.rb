require "spec_helper"

describe "Add to project", reset: false do
  collection_name = '15 Minute Stream Flow Data: USGS (FIFE)'
  before(:all) do
    Capybara.reset_sessions!
    load_page :search, q: 'C179003030-ORNL_DAAC'
    login
    wait_for_xhr
  end

  context "in the collection results list" do
    it 'displays "Add" buttons for collections not in the current project' 


    it 'displays "Remove" buttons for collections not in the current project' 


    it 'initially displays information about adding items to projects' 


    it 'initially displays no link to view the current project' 


    context 'clicking on an "Add" button' do
      before(:all) do
        add_to_project(collection_name)
      end

      after(:all) do
        reset_project
      end

      # EDSC-146: As a user, I want to see how long my granule searches take,
      #           so that I may understand the performance of the system
      # Removed in EDSC-811. This is irrelevant here. We display it on the results page.
      #it "searches for granules, displaying a granule count and search time" do
      #  within '#collection-results-list > :first-child' do
      #    expect(page).to have_text("Granules")
      #    granules_info = find('.collection-granules-info')
      #    expect(granules_info.text).to match(/\d Granules in \d+\.\d+s/)
      #  end
      #end

      it 'adds the collection to the current project' 


      it 'updates the button for the collection to be a remove button' 


      it 'displays a summary of the collections in the project' 


      it 'displays a link to view the project' 

    end

    context 'clicking on a "Remove" button' do
      context 'when the removed collection was the last one in the project' do
        before(:all) do
          within '#collection-results-list > :first-child' do
            click_link "Add collection to the current project"
            click_link "Remove collection from the current project"
          end
        end

        after(:all) do
          reset_project
        end

        it 'removes the summary of the collections in the project' 


        it 'hides the link to view the project' 


        it 'removes the collection from the current project' 


        it 'updates the button for the collection to be an add button' 

      end

      context 'when collections remain in the project' do
        before(:all) do
          fill_in :keywords, with: 'C179003030-ORNL_DAAC'
          wait_for_xhr
          login
          wait_for_xhr
          target_collection_result.click_link "Add collection to the current project"
          wait_for_xhr
          fill_in :keywords, with: ' '
          within second_unfeatured_collection do
            click_link "Add collection to the current project"
            click_link "Remove collection from the current project"
          end
        end

        after(:all) do
          fill_in :keywords, with: 'C179003030-ORNL_DAAC'
          reset_project
          wait_for_xhr
        end

        it 'updates the summary of the collections in the project' 


        it 'continues to show the link to view the project' 


        it 'removes the collection from the current project' 


        it 'updates the button for the collection to be an add button' 

      end
    end
  end
end

