require 'spec_helper'

describe 'Collections Collapsed View', reset: false do
  context 'on the search results screen' do
    before :all do
      Capybara.reset_sessions!
      load_page :search, env: :sit
    end

    it 'shows the expanded collections list by default' 


    it 'displays a minimize button for the collections list' 


    it 'displays no close button for the collections list' 


    context 'clicking the minimize button for the collections list' do
      before :all do
        click_link 'Minimize'
      end

      it 'displays a narrower view of collections' 

    end
  end
end

