require 'spec_helper'

describe 'Collection NRT Filtering', reset: false do
  before :all do
    Capybara.reset_sessions!
    load_page :search, facets: true
  end

  context 'when selecting the NRT filter' do
    before :all do
      find('.facets-item', text: 'Near Real Time').click
      wait_for_xhr
    end

    it 'shows only NRT collections' 


    context 'when un-selecting the NRT filter' do
      before :all do
        find('.facets-item', text: 'Near Real Time').click
        wait_for_xhr
      end

      it 'shows all collections' 

    end
  end
end

