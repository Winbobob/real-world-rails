require 'spec_helper'

describe 'Collection "Customizable" Filtering', reset: false do
  before :all do
    Capybara.reset_sessions!
  end

  context 'when a collection search result has ESI customizability' do
    before :all do
      load_page :search, q: 'C179014697-NSIDC_ECS'
    end

    it 'displays the customizable badge on the collection' 

  end

  context 'when a collection search result has OPeNDAP customizability' do
    before :all do
      load_page :search, q: 'C179014688-NSIDC_ECS'
    end

    it 'displays the customizable badge on the collection' 

  end

  context 'when a collection search result has no customizability' do
    before :all do
      load_page :search, q: 'C179002726-ORNL_DAAC'
    end

    it 'displays the customizable badge on the collection' 

  end

  context 'when selecting the "Customizable" filter' do
    before :all do
      load_page :search, facets: true
      find('.facets-item', text: 'Customizable').click
      wait_for_xhr
    end

    it 'shows only customizable-enabled collections' 


    context 'when un-selecting the "Customizable" filter' do
      before :all do
        find('.facets-item', text: 'Customizable').click
        wait_for_xhr
      end

      it 'shows all collections' 

    end
  end

end

