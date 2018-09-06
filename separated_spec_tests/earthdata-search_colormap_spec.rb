require 'spec_helper'

describe 'Collection Colormaps', reset: false do
  gibs_collection_id = 'C119124186-NSIDC_ECS'
  non_gibs_collection_id = 'C179003030-ORNL_DAAC'

  before :all do
    load_page :search
  end
  
  context 'when viewing a GIBS-enabled collection' do
    before :all do
      fill_in 'keywords', with: gibs_collection_id
      wait_for_xhr

      first_collection_result.click
      wait_for_xhr
    end

    it 'shows the GIBS colormap' 


    context 'when returning to the collection results' do
      before :all do
        click_link 'Back to Collections'
        wait_for_xhr
      end

      it 'removes the colormap' 

    end
  end

  context 'when viewing a non-GIBS-enabled collection' do
    before :all do
      fill_in 'keywords', with: non_gibs_collection_id
      wait_for_xhr

      first_collection_result.click
      wait_for_xhr
    end

    it 'does not show a colormap' 

  end
end

