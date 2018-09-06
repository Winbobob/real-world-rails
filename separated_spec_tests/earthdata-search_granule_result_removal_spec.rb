require "spec_helper"

describe "Granule result removal", reset: false do
  second_granule_temporal = 'START1988-02-01 00:00:00 END1988-03-01 00:00:00'
  second_granule_temporal_map = '1988-02-01 00:00:00 1988-03-01 00:00:00'

  context 'pressing the delete key while focused on a granule' do
    before :all do
      load_page :search, focus: 'C179003030-ORNL_DAAC'
      first_granule_list_item.click
      keypress('#granule-list', :delete)
      wait_for_xhr
    end

    it 'removes the granule from the granule list' 


    it "updates the page's hits count" 


    it "focuses the next granule in the list" 


    it "focuses the next granule on the map" 

  end

  context 'pressing the delete key while not focused on a granule' do
    before :all do
      load_page :search, focus: 'C179003030-ORNL_DAAC'
      keypress('#granule-list', :delete)
      wait_for_xhr
    end

    it 'does nothing' 

  end
end

