require 'spec_helper'

describe 'Collection Facets With No Results', reset: false do
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

  context 'When selecting facets that result in empty categories' do
    it 'hides empty facet lists' 

  end

  context 'When selecting facets that result in empty facets' do
    it 'updates facet lists' 

  end

  context 'When searching for keywords that will yeild no results' do
    context 'When one facet is selected' do
      before :all do
        find('h3.panel-title', text: 'Keywords').click
        find('.panel.keywords .facets-item', text: 'Atmosphere', match: :prefer_exact).click

        fill_in :keywords, with: 'somestringthatmatchesnocollections'
        wait_for_xhr
      end

      it 'displays the selected facet and empty result count' 

    end

    context 'When two facets are selected' do
      before :all do
        find('h3.panel-title', text: 'Keywords').click

        within '.panel.keywords' do
          find('.facets-item', text: 'Atmosphere', match: :prefer_exact).click
          wait_for_xhr

          find('.facets-item', text: 'Cryosphere', match: :prefer_exact).click
          wait_for_xhr

          find('.facets-item', text: 'Oceans', match: :prefer_exact).click
          wait_for_xhr
        end

        fill_in :keywords, with: 'somestringthatmatchesnocollections'
        wait_for_xhr
      end

      it 'displays the selected facets and empty result count' 

    end
  end
end

