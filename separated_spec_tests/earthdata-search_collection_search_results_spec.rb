require 'spec_helper'

describe 'CWIC-enabled collection search results', reset: false do
  context 'When viewing the collection results list' do
    context 'When viewing a CWIC collection' do
      before :all do
        Capybara.reset_sessions!

        # This is not a CWIC collection but this functionality is only
        # in SIT at the time of writing this feature/test so we tagged
        # a collection in SIT to test it.
        load_page :search, q: 'C1000000575-DEV07', env: :sit
      end

      it 'shows the CWIC tagged collection' 


      it 'does not show a granule count' 


      it 'displays an indication that its search and retrieval is provided externally' 

    end

    context 'When viewing a non CWIC-tagged item' do
      before :all do
        Capybara.reset_sessions!
        
        load_page :search, q: 'C1000001188-LARC_ASDC'
      end

      it 'shows a granule count' 


      it 'displays no indication of external search and retrieval' 

    end
  end
end

