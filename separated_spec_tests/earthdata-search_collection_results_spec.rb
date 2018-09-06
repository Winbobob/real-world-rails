require 'spec_helper'

describe 'Collection results', reset: false do
  before :all do
    load_page :search
  end

  it 'displays the first 20 collections when first visiting the page' 


  # EDSC-145: As a user, I want to see how long my collection searches take, so that
  #           I may understand the performance of the system
  it 'shows how much time the collection search took' 


  context 'When collections do not have a version_id', pending_updates: true do
    before :all do
      fill_in 'keywords', with: 'C1214605943-SCIOPS'
      wait_for_xhr
    end

    it 'doesn\'t show version_id' 

  end

  context 'When collections are no longer collecting data' do
    before :all do
      fill_in 'keywords', with: 'C1443538967-NSIDC_ECS'
      wait_for_xhr
    end

    it 'shows the temporal extent of collections whose data collection ended in the past' 

  end
  context 'When collections have ongoing data collection' do
    before :all do
      fill_in 'keywords', with: 'C204690560-LAADS'
      wait_for_xhr
    end

    it 'indicates if a collection\'s data collection is ongoing' 

  end

  context 'When collections have stored thumbnails' do
    before :all do
      fill_in 'keywords', with: 'C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it 'displays thumbnails for collections which have stored thumbnail URLs' 


    it 'does not display the no image available placeholder' 

  end

  context 'When collections have browse images' do
    before :all do
      fill_in 'keywords', with: 'C1443538967-NSIDC_ECS'
      wait_for_xhr
    end

    it 'displays thumbnails for collections that have browse images in collection metadata' 


    it 'does not display the no image available placeholder' 

  end

  context 'When collections have no thumbnail images' do
    before :all do
      fill_in 'keywords', with: 'C204690560-LAADS'
      wait_for_xhr
    end

    it 'displays a placeholder image' 

  end
end

