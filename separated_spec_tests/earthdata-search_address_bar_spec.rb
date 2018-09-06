# EDSC-147 - EDSC-153: Persisting sessions and bookmarks

require 'spec_helper'

describe 'Address bar', reset: false do
  def query_string
    URI.parse(current_url).query
  end

  context 'when loading collection details page from search page' do
    before :all do
      load_page :search
      wait_for_xhr
      first_collection_result.click_link 'View collection details'
      wait_for_xhr
    end

    it 'saves "collection-details" in the address bar' 

  end

  context 'when searching by keywords' do
    before(:all) do
      visit '/search/map'
      wait_for_xhr
      fill_in "keywords", with: 'C1219032686-LANCEMODIS'
    end

    it 'saves the keyword condition in the address bar' 


    context 'clearing filters' do
      before(:all) { click_link "Clear Filters" }

      it 'removes the keyword condition from the address bar' 

    end
  end

  context 'when loading a url containing a search keyword' do
    before(:all) do
      visit '/search/collections?q=C1219032686-LANCEMODIS&ok=C1219032686-LANCEMODIS&ac=true'
      wait_for_xhr
    end

    it 'loads the condition into the keywords field' 


    it 'filters collections using the condition' 

  end

  context 'when searching by temporal' do
    before(:all) do
      visit '/search/map'
      wait_for_xhr
      click_link "Temporal"
      js_check_recurring "collection"
      fill_in "Start", with: "12-01 00:00:00\t"
      fill_in "End", with: "12-31 00:00:00\t"
      script = "edsc.page.query.temporal.pending.years([1970, 1975])"
      page.execute_script(script)
      wait_for_xhr
      js_click_apply ".temporal-dropdown"
      wait_for_xhr
    end

    it 'saves the temporal condition in the address bar' 


    context 'clearing filters' do
      before(:all) do
        # Temporal dropdown causes capybara to throw persistent fits of ClickFailed errors, so we do this with JS.
        page.execute_script('$(".clear-filters").click()')
      end

      it 'removes the temporal condition from the address bar' 

    end
  end

  context 'when loading a url containing a temporal condition' do
    before(:all) do
      visit '/search/collections?qt=1970-12-01T00%3A00%3A00.000Z%2C1975-12-31T00%3A00%3A00.000Z%2C335%2C365'
      wait_for_xhr
    end

    it 'loads the condition into the temporal fields' 


    it 'displays the temporal on the map' 

  end

  context 'when searching by spatial' do
    before(:all) do
      load_page :search, q: 'C14758250-LPDAAC_ECS', sb: [0,0,10,10]
    end

    it 'saves the spatial condition in the address bar' 


    context 'clearing filters' do
      before :all do
        click_link "Clear Filters"
        wait_for_xhr
      end

      after :all do
        load_page :search, q: 'C14758250-LPDAAC_ECS', sb: [0,0,10,10]
      end

      it 'removes the spatial condition from the address bar' 

    end

    context 'setting granule filters' do
      before(:all) do
        expect(page.current_url).to have_content("sb=0%2C0%2C10%2C10")
        first_collection_result.click
        wait_for_xhr
        click_link 'Filter granules'
        wait_for_xhr

        fill_in "Start", with: "2013-12-01 00:00:00\t"
        fill_in "End", with: "2013-12-31 00:00:00\t"
        js_click_apply ".master-overlay-content"
        wait_for_xhr
        select 'Day only', from: "day-night-select"
        wait_for_xhr
        check 'Find only granules that have browse images.'
        wait_for_xhr
        fill_in "Minimum:", with: "2.5"
        wait_for_xhr
        fill_in "Maximum:", with: "5.0\t"
        wait_for_xhr
      end

      it 'saves the granule filters in the address bar' 


      context 'clearing filters' do
        before(:all) do
          click_link "Clear Filters"
          wait_for_xhr
        end

        it 'removes the granule filter and spatial conditions from the address bar' 

      end
    end
  end

  context 'when loading a url containing a spatial condition' do
    before(:all) do
      # 0,0,10,10
      visit '/search/collections?sb=0%2C0%2C10%2C10'
      wait_for_xhr
    end

    it 'draws the condition on the map' 


    it 'filters collections using the condition' 

  end

  context 'when searching by facets' do
    before(:all) do
      visit '/search?test_facets=true'
      wait_for_xhr
      dismiss_banner
      find(".facets-item", text: "Map Imagery").click
      wait_for_xhr
    end

    it 'saves the facet condition in the address bar' 


    context 'clearing filters' do
      before(:all) { click_link "Clear Filters" }

      it 'removes the facet condition from the address bar' 

    end
  end

  context 'when loading a url containing a facet condition' do
    before(:all) do
      visit '/search?test_facets=true&ff=Map%20Imagery'
      wait_for_xhr
      dismiss_banner
    end

    it 'displays the selected facet condition' 

  end


  context 'when setting granule filters' do
    before(:all) do
      load_page :search, q: 'C14758250-LPDAAC_ECS'
      first_collection_result.click
      wait_for_xhr
      click_link 'Filter granules'
      wait_for_xhr

      fill_in "Start", with: "2013-12-01 00:00:00\t"
      fill_in "End", with: "2013-12-31 00:00:00\t"
      js_click_apply ".master-overlay-content"
      wait_for_xhr
      select 'Day only', from: "day-night-select"
      wait_for_xhr
      check 'Find only granules that have browse images.'
      wait_for_xhr
      fill_in "Minimum:", with: "2.5"
      wait_for_xhr
      fill_in "Maximum:", with: "5.0\t"
      wait_for_xhr
      click_button 'Apply'
    end

    it 'saves the granule filters in the address bar' 


    context 'clearing filters' do
      before(:all) do
        click_link "Clear Filters"
        wait_for_xhr
      end

      it 'removes the granule filter conditions from the address bar' 

    end
  end

  context 'when adding collections to a project' do
    before(:all) do
      visit '/search/collections'
      wait_for_xhr

      add_collection_to_project('C179003620-ORNL_DAAC', 'Global Maps of Atmospheric Nitrogen Deposition, 1860, 1993, and 2050')
      add_collection_to_project('C179002914-ORNL_DAAC', '30 Minute Rainfall Data (FIFE)')
      click_link "Clear Filters"
    end

    it 'saves the project in the address bar' 

  end

  context 'when loading a url containing project collections' do
    before(:all) do
      visit '/search/project?p=!C179001887-SEDAC!C179002914-ORNL_DAAC'
      wait_for_xhr
    end

    it 'restores the project' 

  end

  context "when viewing a collection's granules" do
    before(:all) do
      visit '/search/collections?q=C179003030-ORNL_DAAC'
      view_granule_results
    end

    it 'saves the selected collection in the address bar' 

  end

  context "when loading a url containing a collection's granules" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it 'restores the collection granules view' 

  end

  context "when viewing a collection's details" do
    before(:all) do
      visit '/search/collections?q=C179003030-ORNL_DAAC'
      wait_for_xhr
      first_collection_result.click_link('View collection details')
    end

    it 'saves the selected collection in the address bar' 

  end

  context "when loading a url containing a collection's details" do
    before(:all) do
      visit '/search/collection-details?p=C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it 'restores the collection details view' 

  end

  context "when viewing a granule's details" do
    before :all do
      visit '/search/collections?q=C179003030-ORNL_DAAC'
      wait_for_xhr


      first_collection_result.click
      wait_for_xhr

      # Sort the granules so that the oldest appears first so that we
      # have a more reliable piece of data in the second granule slot
      find('#granule-sort').find(:xpath, 'option[2]').select_option
      wait_for_xhr

      first_granule_list_item.click_link 'View granule details'
      wait_for_xhr
    end

    it 'saves the selected granule in the address bar' 

  end

  context "when loading a url containing a granule's details" do
    before :all do
      visit '/search/granules/granule-details?p=C179003030-ORNL_DAAC&g=G1422671947-ORNL_DAAC'
      wait_for_xhr
    end

    it "restores the granule details view" 

  end

  context "setting granule query conditions within the project" do
    before(:all) do
      visit '/search/project?p=!C179003030-ORNL_DAAC!C92711294-NSIDC_ECS'
      wait_for_xhr

      view_granule_filters("15 Minute Stream Flow Data: USGS (FIFE)")
      check "Find only granules that have browse images."

      view_granule_filters("MODIS/Terra Snow Cover Daily L3 Global 500m SIN Grid V005")
      select 'Day only', from: "day-night-select"

      find_by_id('granule-search').click_on 'close'
      first_project_collection.click_link 'View collection details'
      wait_for_xhr

      expect(page).to have_visible_collection_details
    end

    it "saves the query conditions in the URL" 


    it "does not duplicate the query conditions for the focused collection" 

  end

  context "setting granule query conditions when the focused collection is not the project" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC!C179002914-ORNL_DAAC'
      wait_for_xhr

      find_link("Filter granules").click
      check "Find only granules that have browse images."
      wait_for_xhr
    end

    it "saves the query conditions in the URL" 


    it "includes query conditions for the focused collection" 

  end

  context "loading a URL with saved query conditions" do
    before :all do
      visit '/search/project?p=!C179003030-ORNL_DAAC!C92711294-NSIDC_ECS!C179002883-ORNL_DAAC&pg[1][bo]=true&pg[2][dnf]=DAY'
      wait_for_xhr
    end

    it "restores the granule query conditions" 


  end

  # TODO: RDA // Map Zooming fails for unknown reasons potentially related to QT
  # context "when panning and zooming the map" do
  #   before(:all) do
  #     visit '/search/map'
  #     wait_for_xhr
  #     page.execute_script("$('#map').data('map').map.setView(L.latLng(12, -34), 5)")
  #     wait_for_zoom_animation(5)
  #     wait_for_xhr
  #   end

  #   it "saves the map state in the query conditions" do
  #     expect(page).to have_query_string('m=12!-34!5!1!0!0%2C2')
  #   end
  # end

  # context "when loading a url with a saved map state" do
  #   before(:all) do
  #     visit '/search/map?m=12!-34!5!1'
  #   end

  #   it "restores the map pan state from the query conditions" do
  #     synchronize do
  #       lat = page.evaluate_script("$('#map').data('map').map.getCenter().lat")
  #       lng = page.evaluate_script("$('#map').data('map').map.getCenter().lng")
  #       expect(lat).to eql(12)
  #       expect(lng).to eql(-34)
  #     end
  #   end

  #   it "restores the map zoom state from the query conditions" do
  #     synchronize do
  #       zoom = page.evaluate_script("$('#map').data('map').map.getZoom()")
  #       expect(zoom).to eql(5)
  #     end
  #   end
  # end

  present = DateTime.new(2014, 3, 1, 0, 0, 0, '+0')

  context "when panning the timeline" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC'
      wait_for_xhr
      pan_to_time(present - 20.years)
      wait_for_xhr
    end

    it 'saves the timeline pan state in the URL' 

  end

  context "when selecting a timeline date" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC'
      wait_for_xhr
      click_timeline_date('Nov', '1987')
      wait_for_xhr
    end

    it 'saves the timeline date selection in the URL' 

  end

  context "when zooming the timeline" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC'
      wait_for_xhr
      find('.timeline-zoom-out').click
      wait_for_xhr
    end

    it 'saves the timeline zoom level' 

  end

  context "when loading a URL with a saved timeline state" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC&tl=604713600!5!536457600!567993600'
      wait_for_xhr
    end

    it "restores the timeline pan state" 


    it "restores the timeline zoom state" 


    it "restores the selected timeline date" 

  end

  context "when selecting a granule" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC'
      wait_for_xhr

      # Sort the granules so that the oldest appears first so that we
      # have a more reliable piece of data in the second granule slot
      find('#granule-sort').find(:xpath, 'option[2]').select_option
      wait_for_xhr

      # Click on the second granule
      second_granule_list_item.click
      wait_for_xhr
    end

    it "saves the selected granule in the URL" 

  end

  context "when loading a URL with a selected granule" do
    before(:all) do
      visit '/search/granules?p=C179003030-ORNL_DAAC&g=G1422671857-ORNL_DAAC'
      wait_for_xhr

      # Sort the granules so that the oldest appears first so that we
      # have a more reliable piece of data in the second granule slot
      find('#granule-sort').find(:xpath, 'option[2]').select_option
      wait_for_xhr
    end

    it "restores the granule selection in the granules list" 


    it "restores the granule selection on the map" 

  end

  context "Long URLs" do
    let(:long_path) { '/search/collections?p=!C179001887-SEDAC!C1000000220-SEDAC!C179001967-SEDAC!C179001889-SEDAC!C179001707-SEDAC&q=C179003030-ORNL_DAAC&ok=C179003030-ORNL_DAAC' }
    let(:longer_path) { long_path.gsub('!C179001707-SEDAC&', '!C179001707-SEDAC!C179003030-ORNL_DAAC&') }
    let(:query_re) { /^projectId=(\d+)$/ }

    def query
      URI.parse(page.current_url).query
    end

    def project_id
      query[query_re, 1].to_i
    end

    context "when the site URL grows beyond the allowable limit" do
      # Each to avoid database cleanup problems
      before(:each) do
        visit long_path
        wait_for_xhr
        target_collection_result.click_link 'Add collection to the current project'
        wait_for_xhr
      end

      it "stores the URL remotely and provides a shortened URL" 


      context "further updating the page state" do
        before_project_id = nil

        before(:each) do
          before_project_id = project_id
          fill_in "keywords", with: 'AST'
          wait_for_xhr
        end

        it "keeps the URL the same but updates the remote store" 

      end
    end

    context "loading a shortened URL" do
      before(:each) do
        project = Project.new
        project.path = longer_path
        project.save!

        visit "/search/collections?projectId=#{project.to_param}"
        wait_for_xhr
      end

      it "restores the persisted long path" 

    end
  end


  context 'when the labs parameter is set to true' do
    context 'the granule filters panel' do
      before(:all) do
        visit "/search/granules?labs=true&p=C14758250-LPDAAC_ECS"
        wait_for_xhr
        click_on 'Filter granules'
      end

      it 'shows a section for additional attribute search' 


      it 'shows additional attribute search fields' 

    end
  end

  context 'when the labs parameter not set' do
    context 'the granule filters panel' do
      before(:all) do
        visit "/search/granules?p=C14758250-LPDAAC_ECS"
        click_on 'Filter granules'
      end

      it 'shows no section for additional attribute search' 


      it 'shows no additional attribute search fields' 

    end
  end

  context 'when changing the base layer' do
    before :all do
      load_page :search
      page.find_link('Layers').trigger(:mouseover)
      within '#map' do
        choose 'Land / Water Map'
      end
      wait_for_xhr
    end

    it 'saves the base layer in the url' 


    context 'when refreshing the page' do
      before :all do
        visit '/search?m=0!0!2!1!2!'
        wait_for_xhr
        dismiss_banner
        wait_for_xhr
      end

      it 'remembers the base layer' 

    end
  end

  context 'when changing the map overlays' do
    before :all do
      load_page :search
      wait_for_xhr
      page.find_link('Layers').trigger(:mouseover)
      within '#map' do
        check 'Borders and Roads'
        check 'Coastlines'
      end
      wait_for_xhr
    end

    it 'saves the applied overlays in the url' 


    context 'when refreshing the page' do
      before :all do
        visit '/search?m=0!0!2!1!0!0%2C1'
        wait_for_xhr
        dismiss_banner
      end

      it 'remembers the applied overlays' 

    end
  end

end

