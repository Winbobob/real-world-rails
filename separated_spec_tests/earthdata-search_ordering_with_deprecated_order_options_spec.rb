require 'spec_helper'

describe 'Ordering with deprecated order options', reset: false do
  orderable_collection_id = 'C179003030-ORNL_DAAC'
  granule_id = 'G179111301-ORNL_DAAC'

  before :all do
    Capybara.reset_sessions!
    load_page :search, overlay: false
    login
    load_page 'data/configure', {project: [orderable_collection_id],
                                 granule_id: [granule_id]}
    wait_for_xhr
  end

  it "displays a radio button 'Stage for Delivery'" 


  it "hides deprecated order options" 


  context "and proceeding to the retrieval page" do
    before :all do
      Delayed::Worker.delay_jobs = true

      choose "Stage for Delivery"
      click_on 'Continue'
      click_on 'Submit'
      wait_for_xhr

      expect(page).to have_text('Creating')
    end

    after :all do
      Delayed::Worker.delay_jobs = false
    end

    it "completes the order without dropping any granules" 

  end
end

