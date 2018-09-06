require 'spec_helper'

describe 'Granule metadata' do
  before do
    load_page :search
    fill_in 'keywords', with: 'C179003030-ORNL_DAAC'
    wait_for_xhr
    first_collection_result.click
    # Select a specific granule
    fill_in 'granule-ids', with: "FIFE_STRM_15M.80611715.s15\t"
    wait_for_xhr
    
    first_granule_list_item.click_link('View granule details')
    wait_for_xhr
    click_link 'Metadata'
    wait_for_xhr
  end

  it 'provides metadata in multiple formats' 


  context 'when a logged in user views granule metadata' do
    before do
      login
      wait_for_xhr
      click_link 'Metadata'
      wait_for_xhr
    end

    it 'provides metadata in multiple formats with user tokens' 

   end
end

