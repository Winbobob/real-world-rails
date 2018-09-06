# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe "When sending track alerts" do

  before do
    # TODO: required to make sure xapian index can find files for raw emails
    # associated with fixtures - can be removed when fixtures no longer
    # automatically loaded for all specs
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should send alerts" 


  it "should send localised alerts" 

end


