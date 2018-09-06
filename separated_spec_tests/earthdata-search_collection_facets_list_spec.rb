require 'spec_helper'

describe 'Collection Facet Display', reset: false do
  context 'When viewing facets on before taking any actions' do
    before :all do
      Capybara.reset_sessions!

      load_page :search, facets: true
    end

    it 'expands only Features by default' 


    it 'does not expand Keywords by default' 


    it 'does not expand Platforms by default' 


    it 'does not expand Instruments by default' 


    it 'does not expand Organizations by default' 


    it 'does not expand Processing levels by default' 


    it 'contains the hard coded facets for Features' 


    it 'shows at least one Keywords facet' 


    it 'shows at least one Platforms facet' 


    it 'shows at least one Instruments facet' 


    it 'shows at least one Projects facet' 


    it 'shows at least one Organizations facet' 


    it 'shows at least one Processing levels facet' 

  end
end

