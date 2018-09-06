require 'spec_helper'

describe 'Map Zooming', reset: false, ci_only: true do
  it 'is currently skipped due to zoom issues on os x'
  before :all do
    page.driver.resize_window(1680, 1050) # Default capybara window size
    Capybara.reset_sessions!
    load_page :search
  end

  after :all do
    page.driver.resize_window(1280, 1024)
  end

  context 'when zooming with the zoom buttons' do
    context 'and the overlay is visible' do
      before :all do
        Capybara.reset_sessions!

        load_page :search
        find('.leaflet-control-zoom-in').click
        wait_for_xhr
        sleep 0.2 # Allow animations to finish and avoid clickfailed
      end

      after :all do
        find('.leaflet-control-zoom-out').click
        wait_for_xhr
        expect(page).to have_map_center(0, 0, 2)
      end

      it 'zooms to the center of the visible map' 

    end

    context 'and the overlay is minimized', pending_updates: true do
      before :all do
        within '.master-overlay-main' do
          find('.master-overlay-minimize').click
        end
        zoom_level = MapUtil.get_zoom(page)
        find('.leaflet-control-zoom-in').click
        wait_for_zoom_animation zoom_level
      end

      after :all do
        synchronize(30) do
          # Synchronize because animations can cause occlusion if execution is very fast
          zoom_level = MapUtil.get_zoom(page)
          find('.leaflet-control-zoom-out').click
          wait_for_zoom_animation zoom_level
          find('.master-overlay-maximize').click
        end
        wait_for_xhr
        expect(page).to have_map_center(0, 0, 2)
      end

      it 'zooms to the center of the visible map' 

    end
  end

  context 'when using the zoom home button' do
    context 'with spatial bounds' do
      before :all do
        load_page :search
        wait_for_xhr
        script = "$('#map').data('map').map.fitBounds([{lat: -40, lng:0}, {lat: -20, lng: 0}]);"
        page.execute_script(script)

        create_bounding_box(0, 0, 20, 20)

        find('.leaflet-control-zoom-home').click
      end

      after :all do
        click_on 'Clear Filters'
        script = "$('#map').data('map').map.setView([0, 0], 2);"
        page.execute_script(script)
        expect(page).to have_map_center(0, 0, 2)
      end

      it "centers the map over the spatial area" 

    end

    context 'without spatial bounds' do
      before :all do
        script = "$('#map').data('map').map.fitBounds([{lat: -40, lng:-10}, {lat: -20, lng: -10}]);"
        page.execute_script(script)

        find('.leaflet-control-zoom-home').click
      end

      after :all do
        script = "$('#map').data('map').map.setView([0, 0], 2);"
        page.execute_script(script)
        expect(page).to have_map_center(0, 0, 2)
      end

      it "centers the map at (0,0)" 

    end

    context "on polar view" do
      
      before :all do
        find("#collection-results").find_link("Minimize").click
        wait_for_xhr
      end
      after :all do
        click_on "Geographic (Equirectangular)"
        find_by_id("collection-results").find_link("Maximize").click
        wait_for_xhr
        script = "$('#map').data('map').map.setView([0, 0], 2);"
        page.execute_script(script)
        wait_for_xhr
        expect(page).to have_map_center(0, 0, 2)
      end

      it "centers the map at (90, 0) for north polar view" 


      it "centers the map at (-90, 0) for south polar view" 

    end
  end

  context 'on geo view' do
    context 'at the minimum zoom level' do
      before :all do
        load_page :search
        click_on "Geographic (Equirectangular)"
        MapUtil.set_zoom(page, 0)
      end

      after :all do
        find('.leaflet-control-zoom-home').click
        wait_for_zoom_animation(2)
        wait_for_xhr
      end

      context 'clicking zoom out' do
        before :all do
          find('.leaflet-control-zoom-out').click
          wait_for_zoom_animation(0)
          wait_for_xhr
        end

        after :all do
          find('.leaflet-control-zoom-home').click
          wait_for_zoom_animation(2)
          wait_for_xhr
        end

        it 'maintains the map center' 


        it 'does not zoom out any further' 

      end
    end

    context 'at the maximum zoom level' do
      before :all do
        MapUtil.set_zoom(page, 7)
      end

      after :all do
        find('.leaflet-control-zoom-home').click
        wait_for_zoom_animation(2)
      end

      context 'clicking zoom out' do
        before :all do
          find('.leaflet-control-zoom-in').click
          wait_for_zoom_animation(7)
        end

        after :all do
          find('.leaflet-control-zoom-home').click
          wait_for_zoom_animation(2)
        end

        it 'maintains the map center' 


        it 'does not zoom in any further' 

      end
    end
  end

  context 'on polar view (e.g. EPSG3031 - South Polar Stereographic)' do
    context 'at the maximum zoom level' do
      before :all do
        load_page :search
        click_on "North Polar Stereographic"
        MapUtil.set_zoom(page, 4)
      end

      after :all do
        click_on "Geographic (Equirectangular)"
      end

      context 'clicking zoom in' do
        before :all do
          find('.leaflet-control-zoom-in').click
        end

        it 'does not zoom in any further' 


        it 'maintains the map center' 

      end
    end
  end
end

