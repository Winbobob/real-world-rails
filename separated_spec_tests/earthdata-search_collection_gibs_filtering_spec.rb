require 'spec_helper'

describe 'Collection GIBS Filtering', reset: false do
  before :all do
    Capybara.reset_sessions!
    load_page :search, facets: true
  end

  context 'when selecting the GIBS filter' do
    before :all do
      find('.facets-item', text: 'Map Imagery').click
      wait_for_xhr
    end

    it 'shows only GIBS enabled collections' 


    context 'when un-selecting the GIBS filter' do
      before :all do
        find('.facets-item', text: 'Map Imagery').click
        wait_for_xhr
      end

      it 'shows all collections' 

    end
  end

end

