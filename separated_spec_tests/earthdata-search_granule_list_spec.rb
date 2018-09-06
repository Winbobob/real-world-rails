# EDSC-56: As a user, I want to see a list of top granules matching my search so
#          that I may preview my results before retrieving data
# EDSC-58: As a user, I want to load more granules as I scroll so that I may see
#          granules that are not among my top results

require "spec_helper"

describe "Granule list", reset: false do
  extend Helpers::CollectionHelpers

  before :all do
    Capybara.reset_sessions!
    load_page :search
  end

  context "for all collections with granules" do
    before :all do
      visit('/search/granules?p=C92711294-NSIDC_ECS&tl=1501695072!4!!&q=C92711294-NSIDC_ECS&ok=C92711294-NSIDC_ECS')
      wait_for_xhr
    end
    it 'provides a text field to search for single or multiple granules by granule IDs' 


    it "provides a button to get collection details" 


    it "provides a button to get download the collection" 


    it "provides a button to edit granule filters" 


    it 'provides a button to download single granule' 


    it 'displays start and end temporal labels' 


    context 'entering multiple granule IDs' do
      before :all do
        fill_in 'granule-ids', with: "MOD10A1.A2016001.h31v13.005.2016006204744.hdf, MOD10A1.A2016001.h31v12*\t"
        wait_for_xhr
      end

      after :all do
        click_link "Filter granules"
        click_button "granule-filters-clear"
        find('#granule-search').click_link('close')
      end

      it 'filters granules down to 2 results' 


      it 'finds the granules' 

    end

    context "clicking on the collection details button" do
      before :all do
        granule_list.click_link('View collection details')
      end

      after :all do
        collection_details.click_link('Back to Granules')
        wait_for_xhr
      end

      it "displays the collection details" 


      it "displays back navigation with the appropriate text" 

    end

    context "clicking on the download button" do
      before :all do
        granule_list.click_button('Download')
      end

      after :all do
        page.execute_script('window.history.back()')
        wait_for_xhr
      end

      it "triggers the download workflow" 

    end

    context "clicking on the edit filters button" do
      before :all do
        dismiss_banner
        granule_list.click_link('Filter granules')
      end

      after :all do
        find('#granule-search').click_link('close')
      end

      it "allows the user to edit granule filters" 


      context "and editing a filter" do
        before :all do
          select 'Day only', from: "day-night-select"
        end

        after :all do
          select 'Anytime', from: "day-night-select"
        end

        it "shows the filters in an applied state" 

      end
    end

    context "clicking the exclude granule button" do
      before :all do
        dismiss_banner
        first_granule_list_item.click
        first_granule_list_item.click_link "Remove granule"
        wait_for_xhr
      end

      after :all do
        click_link "Filter granules"
        click_button "granule-filters-clear"
        find('#granule-search').click_link('close')
      end

      it "removes the selected granule from the list" 


      it "shows undo button to re-add the granule" 


      context "until all granules on current page are excluded" do
        before :all do
          num_of_clicks = 19
          while num_of_clicks > 0
            first_granule_list_item.click_link "Remove granule"
            num_of_clicks -= 1
            wait_for_xhr
          end
        end

        after :all do
          Capybara.reset_sessions!
          load_page :search
          fill_in 'keywords', with: 'C92711294-NSIDC_ECS'
          view_granule_results('MODIS/Terra Snow Cover Daily L3 Global 500m SIN Grid V005')

          first_granule_list_item.click
          first_granule_list_item.click_link "Remove granule"
          wait_for_xhr
        end

        it "loads next page" 

      end

      context "and clicking the undo button" do
        before :all do
          click_link "Undo"
        end

        after :all do
          first_granule_list_item.click_link "Remove granule"
        end

        it "shows the excluded granule in the granule list" 


        it "selects the previously excluded granule" 

      end

      context "and changing granule query" do
        before :all do
          click_link "Filter granules"
          check "Find only granules that have browse images."
          wait_for_xhr
        end

        after :all do
          uncheck "Find only granules that have browse images."
          click_link "Add it back"
          wait_for_xhr
          find('#granule-search').click_link('close')
          first_granule_list_item.click
          first_granule_list_item.click_link "Remove granule"
          wait_for_xhr
        end

        it "removes the undo button" 

      end
    end
  end

  context "for collections with many granule results" do
    before :all do
      visit('/search/granules?p=C179002914-ORNL_DAAC&tl=1501695072!4!!&q=C179002914-ORNL_DAAC&ok=C179002914-ORNL_DAAC')
      wait_for_xhr
    end
    context "clicking on a collection result" do

      it "displays the first granule results in a list that pages by 20" 

    end
  end

  context "for collections with few granule results" do
    before :all do
      visit('/search/granules?p=C179003380-ORNL_DAAC&tl=1501695072!4!!&q=C179003380-ORNL_DAAC&ok=C179003380-ORNL_DAAC')
      wait_for_xhr
    end

    context "clicking on a collection result" do

      it "displays all available granule results" 


      it "does not attempt to load additional granule results" 

    end
  end

  context "for collections without granules" do
    before do
      set_temporal('2018-01-01 00:00:00', '2018-01-31 23:59:59')
    end

    use_collection 'C1426717545-LANCEMODIS', 'MODIS/Aqua Aerosol 5-Min L2 Swath 3km - NRT'

    context "clicking on a collection result" do
      before :all do
        visit('/search?q=C179002107-SEDAC&ok=C179002107-SEDAC')
        wait_for_xhr
        dismiss_banner
        expect(page).to have_visible_collection_results
        first_collection_result.click
        wait_for_xhr
      end

      it "shows no granules" 


      it "does not attempt to load additional granule results" 

    end
  end

  context 'for collections whose granules have more than one downloadable links' do

    context 'clicking on the single granule download button when the links have titles' do
      before :all do
        visit('/search/granules?p=C1000000042-LANCEAMSR2&tl=1501695072!4!!&q=C1000000042-LANCEAMSR2&ok=C1000000042-LANCEAMSR2')
        wait_for_xhr
        within '#granules-scroll .panel-list-item:nth-child(1)' do
          find('a[data-toggle="dropdown"]').click
        end
      end

      after :all do
        within '#granules-scroll .panel-list-item:nth-child(1)' do
          find('a[data-toggle="dropdown"]').click
        end
      end

      it 'shows a dropdown with all the downloadable granules' 

    end

    context 'clicking on the single granule download button when the links do not have titles' do
      before :all do
        visit('/search/granules?p=C1353062857-NSIDC_ECS&tl=1502209871!4!!&q=NSIDC-0481&ok=NSIDC-0481')
        wait_for_xhr
        within '#granules-scroll .panel-list-item:nth-child(1)' do
          find('a[data-toggle="dropdown"]').click
        end
      end

      after :all do
        within '#granules-scroll .panel-list-item:nth-child(1)' do
          find('a[data-toggle="dropdown"]').click
        end
      end

      it 'shows a dropdown with all the downloadable granules' 

    end
  end

  context 'for collections whose granules have duplicate downloadable links, with one pointing to https and the other ftp' do
    before :all do
      # A collection known to have duplicate downloadable links
      visit('/search/granules?p=C1444742099-PODAAC&tl=1501695072!4!!&q=C1444742099-PODAAC&ok=C1444742099-PODAAC')
      wait_for_xhr
      within '#granules-scroll .panel-list-item:nth-child(1)' do
        # If the test works, this dropdown won't even exist...
        if page.has_css?('a[data-toggle="dropdown"]')
          find('a[data-toggle="dropdown"]').click
        end
      end
    end

    it 'only shows the http link' 

  end

  context "for collections that are known to cause download delays" do
    before :all do
      visit('/search/granules?cmr_env=sit&p=C24931-LAADS&tl=1501695072!4!!&q=C24931-LAADS&ok=C24931-LAADS')
      wait_for_xhr
      click_button('Download')
    end
    it "shows a modal warning of the delay" 

  end

  context "for collections that have granules without end times" do
    before :all do
      visit('/search/granules?cmr_env=uat&p=C1000-LPDAAC_TS2')
    end
    it "displays correct start and end temporal labels" 

  end
end

