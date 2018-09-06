require "spec_helper"

describe "Granule search filters", reset: false do
  context "for granules that can be filtered by day/night flag or cloud cover" do
    before_granule_count = 0

    before :all do
      page.driver.resize_window(2000, 3000)
    end

    before(:each) do
      # Labs parameter enables additional attribute searching
      load_page :search, project: ['C14758250-LPDAAC_ECS'], view: :project, labs: true

      temporal_start_date = DateTime.new(1999, 12, 1, 0, 0, 0, '+0')
      temporal_stop_date = DateTime.new(2015, 1, 1, 0, 0, 0, '+0')
      set_temporal(temporal_start_date, temporal_stop_date)
      wait_for_xhr
      first_project_collection.click_link "Show granule filters"
      wait_for_xhr
      number_granules = project_overview.text.match /\d+ Granules/
      before_granule_count = number_granules.to_s.split(" ")[0].to_i
    end

    context "when choosing a day/night flag" do

      it "selecting day returns day granules" 


      it "selecting night returns night granules" 


      it "selecting both returns both day and night granules" 


      it "clicking the clear button selects Anytime" 

    end

    context "when choosing cloud cover" do

      it "filters with both min and max" 


      it "filters with only min" 


      it "filters with only max" 


      it "clicking the clear button clears minimum and maximum" 


      it "entering and removing values doesn't set invalid query param in the url" 


      context "validates input" do
        it "minimum must be more than 0.0" 


        it "maximum must be less than 100.0" 


        it "minimum must be less than maximum" 

      end
    end

    context "when choosing data access options" do

      it "selecting browse only loads granules with browse images" 


      it "selecting online only loads downloadable granules" 


      it "clicking the clear button unchecks data access options" 

    end

    # JS: New layout may make these tests invalid
    #
    # context "when excluding by granule id" do
    #   before :all do
    #     first_project_collection.click
    #     wait_for_xhr
    #     number_granules = granule_list.text.match /Showing \d+ of \d+ matching granules/
    #     before_granule_count = number_granules.to_s.split(" ")[3].to_i
    #
    #     first_granule_list_item.click
    #     first_granule_list_item.click_link "Exclude this granule"
    #   end
    #
    #   after :all do
    #     click_button "granule-filters-clear"
    #     wait_for_xhr
    #     granule_list.click_link "Back to Collections"
    #     wait_for_xhr
    #     first_project_collection.click_link "Show granule filters"
    #     wait_for_xhr
    #   end
    #
    #   it "displays an indication that granules have been excluded" do
    #     expect(page).to have_content("1 granule has been removed from your results")
    #   end
    #
    #   it "removes the granule from the granule list" do
    #     expect(page).to have_css('#granule-list .panel-list-item', count: 38)
    #   end
    #
    #   it "updates the page's hits count" do
    #     # 38 = (page size - 1) * 2. Because of the browser height
    #     # removing a granule immediately loads the next page.
    #     expect(granule_list).to have_content("Showing 38 of #{before_granule_count.to_i - 1} matching granules")
    #   end
    #
    #   context "when the user clicks the link to clear removed granules" do
    #     before :all do
    #       click_link "Add it back"
    #       wait_for_xhr
    #     end
    #
    #     after :all do
    #       first_granule_list_item.click
    #       first_granule_list_item.click_link "Exclude this granule"
    #       wait_for_xhr
    #     end
    #
    #     it "includes the excluded granules in the list" do
    #       expect(page).to have_css('#granule-list .panel-list-item', count: 20)
    #     end
    #
    #     it "updates the granule hits count" do
    #       expect(page).to have_content("Showing 20 of #{before_granule_count} matching granules")
    #     end
    #   end
    # end

    context "when searching by temporal" do

      it "selecting temporal range filters granules" 


      it "selecting temporal recurring filters granules" 


      it "clicking the clear button clears temporal fields" 

    end

    it "shows collection additional attributes" 


    context "when searching by additional attributes" do
      before(:each) do
        load_page :search, project: ['C14758250-LPDAAC_ECS'], view: :project, labs: true
        temporal_start_date = DateTime.new(1999, 12, 1, 0, 0, 0, '+0')
        temporal_stop_date = DateTime.new(2015, 1, 1, 0, 0, 0, '+0')
        set_temporal(temporal_start_date, temporal_stop_date)
        wait_for_xhr
        first_project_collection.click_link "Show granule filters"
        fill_in('DAR_ID', with: '')
        wait_for_xhr
        fill_in('LowerLeftQuadCloudCoverage', with: "50 - 100\t")
        wait_for_xhr
      end

      it "filters granules using the additional attribute values" 


      context "when clearing the attribute search" do
        before(:all) do
          click_button "granule-filters-clear"
          wait_for_xhr
        end

        it "clears the attribute search field" 


        it "resets the granule search" 

      end
    end
  end

  context "for granules that can't be filtered by day/night flag or cloud cover" do
    before :all do
      load_page :search, project: ['C1236224182-GES_DISC'], view: :project
      first_project_collection.click_link "Show granule filters"
    end

    it "day/night flag or cloud cover don't show up in the filter panel" 

  end

  context "When specifying a collection level project/campaign param" do
    before :all do
      load_page :search, facets: true, q: 'C1000000062-NSIDC_ECS'
      find("h3.panel-title", text: 'Projects').click
      within '.panel.projects' do
        first(".facets-item").click
      end
      wait_for_xhr
      first_collection_result.click
      wait_for_xhr
    end

    it "the param is carried over to the granule search" 

  end

  context "for granules that cannot be filtered by orbit spatial parameters" do

    before(:all) do
      # Labs parameter enables additional attribute searching
      load_page :search, project: ['C14758250-LPDAAC_ECS'], view: :project, labs: true

      temporal_start_date = DateTime.new(1999, 12, 1, 0, 0, 0, '+0')
      temporal_stop_date = DateTime.new(2015, 1, 1, 0, 0, 0, '+0')
      set_temporal(temporal_start_date, temporal_stop_date)
      wait_for_xhr
      first_project_collection.click_link "Show granule filters"
    end

    it 'does not show the orbit spatial parameters in the granule filter list' 

  end

  context "for granules that can be filtered by orbit spatial parameters" do
    before_granule_count = 0
    before(:each) do
      load_page :search, project: ['C1000001167-NSIDC_ECS'], view: :project, labs: true
      wait_for_xhr
      first_project_collection.click_link "Show granule filters"
      number_granules = project_overview.text.match /\d+ Granules/
      before_granule_count = number_granules.to_s.split(" ")[0].to_i
    end
    # Capybara::Screenshot.screenshot_and_save_page
    it 'shows the orbit spatial parameters in the granule filter list' 


    it 'filters when only the orbit number min is set' 


    it 'filters when only the orbit number max is set' 


    it 'filters when the orbit number min and max are set' 


    it 'filters when only the equatorial crossing longitude min is set' 


    it 'filters when only the equatorial crossing longitude max is set' 


    it 'filters when the equatorial crossing longitude min and max are set' 


    it 'filters when only the equatorial crossing date start time is set' 


    it 'filters when only the equatorial crossing date end time is set' 


    it 'filters when the equatorial crossing date start and end times are set' 


    it 'loads the orbit number fields correctly when read from URL parameters' 


    it 'loads the equatorial crossing longitude fields correctly when read from URL parameters' 


    it 'loads the equatorial crossing date fields correctly when read from URL parameters' 

  end
end

