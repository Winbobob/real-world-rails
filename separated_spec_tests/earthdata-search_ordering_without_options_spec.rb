require 'spec_helper'

describe 'Ordering without order options', reset: false do
  orderable_collection_id = 'C4543622-LARC_ASDC'
  orderable_collection_title = 'CER_SSF_Terra-FM1-MODIS_Edition3A'

  before :all do
    Capybara.reset_sessions!
    load_page :search, overlay: false
    login
    load_page 'data/configure', {project: [orderable_collection_id],
                                 temporal: ['2014-10-01T00:00:00Z', '2014-10-02T00:00:01Z']}
    wait_for_xhr

    choose 'Stage for Delivery'
    click_on 'Continue'
    click_on 'Submit'
  end

  it "displays a link to return to search results" 


  it "displays information on obtaining data asynchronously" 


  it "indicates current order status" 


  it "provides a link to cancel the order" 


end

