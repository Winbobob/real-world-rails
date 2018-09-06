require "spec_helper"

describe "Grid coordinate search", reset: false do
  extend Helpers::CollectionHelpers

  before :all do
    load_page :search
  end

  after :all do
    wait_for_xhr
  end

  context 'before selecting the grid spatial type' do
    it 'shows no grid input fields' 

  end

  context 'selecting the grid spatial type' do
    before(:all) { choose_tool_from_site_toolbar('Grid') }
    after(:all) { click_on 'Clear Filters' }

    it 'shows grid input fields' 


    it 'displays all of the potential coordinate systems' 

    context 'selecting a coordinate system' do
      before :all  do
        select 'WRS-1 (Landsat 1-3)', from: 'map-grid-system'
        wait_for_xhr
      end
      after :all do
        select 'Coordinate System...', from: 'map-grid-system'
        wait_for_xhr
      end

      it 'filters collections to those which use that coordinate system' 


      context 'and choosing a different spatial type' do
        before(:all) { choose_tool_from_site_toolbar('Point') }
        after(:all) { choose_tool_from_site_toolbar('Grid') }

        it 'keeps the coordinate system input visible' 


        context 'clearing the selected name' do
          before :all do
            select 'Coordinate System...', from: 'map-grid-system'
            wait_for_xhr
          end

          after :all  do
            choose_tool_from_site_toolbar('Grid')
            select 'WRS-1 (Landsat 1-3)', from: 'map-grid-system'
            choose_tool_from_site_toolbar('Point')
          end

          it 'hides the grid input fields' 

        end

        context 'clearing grid search filter (by clicking the "x")' do
          before :all do
            select 'Coordinate System...', from: 'map-grid-system'
            wait_for_xhr
          end

          after :all  do
            choose_tool_from_site_toolbar('Grid')
            select 'WRS-1 (Landsat 1-3)', from: 'map-grid-system'
            choose_tool_from_site_toolbar('Point')
          end

          it 'clears the grid input filter' 

        end
      end

      context 'entering valid tile numbers and viewing granule results' do
        hook_granule_results('Landsat 1-5 Multispectral Scanner V1')

        before :all do
          fill_in 'map-grid-coordinates', with: "24,24\t"
        end

        after :all do
          fill_in 'map-grid-coordinates', with: " \t"
        end

        it 'filters granules to those matching the given tile' 

      end

      context 'entering tile numbers which are non-numeric' do
        before :all do
          fill_in 'map-grid-coordinates', with: "111,111a\t"
        end

        after :all do
          fill_in 'map-grid-coordinates', with: " \t"
        end

        it 'produces an error message' 

      end

      context 'entering tile numbers with incorrect separators' do
        before :all do
          fill_in 'map-grid-coordinates', with: "111:111\t"
        end

        after :all do
          fill_in 'map-grid-coordinates', with: " \t"
        end

        it 'produces an error message' 

      end

      context 'entering tile numbers with the wrong number of coordinates' do
        before :all do
          fill_in 'map-grid-coordinates', with: "111,111 222\t"
        end

        after :all do
          fill_in 'map-grid-coordinates', with: " \t"
        end

        it 'produces an error message' 

      end
    end

    context 'and clearing grid search filter (by clicking the "x")' do
      before :all do
        page.find('a[title="Remove grid coordinates constraint"]').click
      end

      after :all do
        choose_tool_from_site_toolbar('Grid')
        wait_for_xhr
      end

      it 'hides the grid input fields' 

    end

    context 'and clearing all search filters' do
      before(:all) { click_on 'Clear Filters' }
      after :all do
        choose_tool_from_site_toolbar('Grid')
        wait_for_xhr
      end

      it 'hides the grid input fields' 

    end
  end
end

