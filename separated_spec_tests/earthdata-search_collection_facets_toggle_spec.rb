require 'spec_helper'

describe 'Collection Facets Show/Hide', reset: false do
  before :all do
    Capybara.reset_sessions!

    load_page :search, facets: true
  end

  context 'When closing the facet list with no facets selected' do
    before :all do
      page.find('#master-overlay-parent .master-overlay-hide-parent').click
    end

    it 'displays links to re-open the facet list' 


    context 'When re-opening the facet list' do
      before :all do
        page.find('.master-overlay-when-parent-hidden .master-overlay-show-parent').click
      end

      it 'hides the link to show facets' 


      it 'shows the facet panel' 

    end
  end

  context 'When closing the facet list with one facet selected' do
    before :all do
      find('h3.panel-title', text: 'Projects').click

      within '.panel.projects' do
        first('.facets-item').click
        wait_for_xhr
      end

      page.find('#master-overlay-parent .master-overlay-hide-parent').click
    end

    after :all do
      # Clears any selected facets to accomodate random order of tests
      reset_search

      # Reset the facet category toggling
      reset_facet_ui
    end

    it 'displays links to re-open the facet list' 


    it 'informs the user that one facet is selected' 


    context 'When re-opening the facet list' do
      before :all do
        page.find('.master-overlay-when-parent-hidden .master-overlay-show-parent').click
      end

      it 'the facets are still selected' 

    end
  end

  context 'When closing the facet list with two facets from different categories selected' do
    before :all do
      find('h3.panel-title', text: 'Platforms').click

      within '.panel.platforms' do
        first('.facets-item').click
        wait_for_xhr
      end

      find('h3.panel-title', text: 'Projects').click

      within '.panel.projects' do
        first('.facets-item').click
        wait_for_xhr
      end

      page.find('#master-overlay-parent .master-overlay-hide-parent').click
    end

    after :all do
      # Clears any selected facets to accomodate random order of tests
      reset_search

      # Reset the facet category toggling
      reset_facet_ui
    end

    it 'displays links to re-open the facet list' 


    it 'informs the user that one facet is selected' 


    context 'When re-opening the facet list' do
      before :all do
        page.find('.master-overlay-when-parent-hidden .master-overlay-show-parent').click
      end

      it 'the facets are still selected' 

    end
  end
end

