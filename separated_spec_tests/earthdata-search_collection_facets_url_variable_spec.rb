require 'spec_helper'

describe 'Collection Facet URL Query Params', reset: false do
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

  context 'When selecting a Keywords [Topic] facet' do
    before :all do
      find('h3.panel-title', text: 'Keywords').click

      within '.panel.keywords' do
        find('.facets-item', text: 'Atmosphere', match: :prefer_exact).click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 


    # TODO: RDA // Test the nesting of Keywords to ensure that the correct
    # variables make it to the url
    # context 'When selecting a Keywords [Term] facet' do
    #   before :all do
    #     find('h3.panel-title', text: 'Keywords').click

    #     within '.panel.keywords' do
    #       find('.facets-item', text: 'Atmospheric Temperature', match: :prefer_exact).click
    #       wait_for_xhr
    #     end
    #   end

    #   it 'adds the appropriate param to the query string' do
    #     uri = URI.parse(current_url)
    #     expect(uri.query).to have_content('fsm0=')
    #   end

    #   context 'When selecting a Keywords [Variable Level 1] facet' do
    #     before :all do
    #       find('h3.panel-title', text: 'Keywords').click

    #       within '.panel.keywords' do
    #         find('.facets-item', text: 'Upper Air Temperature', match: :prefer_exact).click
    #         wait_for_xhr
    #       end
    #     end

    #     it 'adds the appropriate param to the query string' do
    #       uri = URI.parse(current_url)
    #       expect(uri.query).to have_content('fs10=')
    #     end

    #     context 'When selecting a Keywords [Variable Level 2] facet' do
    #       before :all do
    #         find('h3.panel-title', text: 'Keywords').click

    #         within '.panel.keywords' do
    #           find('.facets-item', text: 'Upper Air Temperature', match: :prefer_exact).click
    #           wait_for_xhr
    #         end
    #       end

    #       it 'adds the appropriate param to the query string' do
    #         uri = URI.parse(current_url)
    #         expect(uri.query).to have_content('fs20=')
    #       end

    #       context 'When selecting a Keywords [Variable Level 3] facet' do
    #         before :all do
    #           find('h3.panel-title', text: 'Keywords').click

    #           within '.panel.keywords' do
    #             find('.facets-item', text: 'Vertical Profiles', match: :prefer_exact).click
    #             wait_for_xhr
    #           end
    #         end

    #         it 'adds the appropriate param to the query string' do
    #           uri = URI.parse(current_url)
    #           expect(uri.query).to have_content('fs30=')
    #         end

    #         context 'When selecting a Keywords [Details Variable] facet' do
    #           before :all do
    #             find('h3.panel-title', text: 'Keywords').click

    #             within '.panel.keywords' do
    #               find('.facets-item', text: 'Inversion Height', match: :prefer_exact).click
    #               wait_for_xhr
    #             end
    #           end

    #           it 'adds the appropriate param to the query string' do
    #             uri = URI.parse(current_url)
    #             expect(uri.query).to have_content('fsd0=')
    #           end
    #         end
    #       end
    #     end
    #   end
    # end
  end

  context 'When selecting a Platforms facet' do
    before :all do
      find('h3.panel-title', text: 'Platforms').click

      within '.panel.platforms' do
        first('.facets-item').click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 

  end

  context 'When selecting a Instruments facet' do
    before :all do
      find('h3.panel-title', text: 'Instruments').click

      within '.panel.instruments' do
        first('.facets-item').click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 

  end

  context 'When selecting a Organizations facet' do
    before :all do
      find('h3.panel-title', text: 'Organizations').click

      within '.panel.organizations' do
        first('.facets-item').click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 

  end

  context 'When selecting a Projects facet' do
    before :all do
      find('h3.panel-title', text: 'Projects').click

      within '.panel.projects' do
        first('.facets-item').click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 

  end

  context 'When selecting a Processing levels facet' do
    before :all do
      find('h3.panel-title', text: 'Processing levels').click

      within '.panel.processing-levels' do
        first('.facets-item').click
        wait_for_xhr
      end
    end

    it 'adds the appropriate param to the query string' 

  end
end

