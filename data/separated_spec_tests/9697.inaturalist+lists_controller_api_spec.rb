require File.dirname(__FILE__) + '/../spec_helper'

describe ListsController, "show" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }
  let(:lt) { ListedTaxon.make! }
  it "should include a list" 


  it "should filter by taxon" 


  it "should default to ordering by observations_count desc" 


  it "should allow sort by name" 


  it "per_page should work" 

end

