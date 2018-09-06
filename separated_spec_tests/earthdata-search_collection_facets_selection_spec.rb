require 'spec_helper'

describe 'Collection Facet Selection', reset: false do
  before :all do
    Capybara.reset_sessions!

    load_page :search, facets: true
  end

  after :each do
    # Clears any selected facets to accomodate random order of tests
    reset_search

    # Reset the facet category toggling
    reset_facet_ui
  end

  # EDSC-622 - We had been displaying duplicate entries with special characters escaped
  context 'When applying facets containing special characters' do
    before :each do
      fill_in :keywords, with: 'C203234448-LAADS'
      wait_for_xhr

      find('h3.panel-title', text: 'Keywords').click
      find('.facet-title', text: 'Spectral/Engineering').click
      wait_for_xhr
    end

    it 'does not display a duplicate entry with special characters escaped' 


    it 'displays the selected entry' 

  end

  context 'When selecting multiple facets from the same category' do
    before :all do
      find('h3.panel-title', text: 'Organizations').click

      within(:css, '.organizations') do
        @first_organization = first('.facets-item .facet-title')
        @first_organization_title = @first_organization.text
        @first_organization_collection_count = first('.facets-item .facet-item-collection-count').text

        @first_organization.click

        wait_for_xhr

        @second_organization = find('.facets-item:nth-of-type(2) .facet-title').click
        wait_for_xhr
      end
    end

    it 'ORs the results of the same category' 

  end

  context 'When selecting multiple facets from different categories' do
    before :all do
      find('h3.panel-title', text: 'Organizations').click

      within(:css, '.organizations') do
        @first_organization = first('.facets-item')
        @first_organization_title = first('.facets-item .facet-title').text
        @first_organization_collection_count = first('.facets-item .facet-item-collection-count').text
      end
      @first_organization.click

      wait_for_xhr

      find('h3.panel-title', text: 'Platforms').click
      within(:css, '.platforms') do
        @first_platform = first('.facets-item .facet-title')
        @first_platform_title = @first_platform.text
        @first_platform_collection_count = first('.facets-item .facet-item-collection-count').text
      end
      @first_platform.click

      wait_for_xhr
    end

    it 'ANDs the results of different categories' 

  end
end

