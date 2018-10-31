require File.dirname(__FILE__) + '/../spec_helper'

describe TaxonChangesController, "commit_records" do
  let(:tc) { make_taxon_swap }
  let(:u) { User.make! }
  before do
    sign_in u
  end
  before(:each) { enable_elastic_indexing( Observation, Identification ) }
  after(:each) { disable_elastic_indexing( Observation, Identification ) }

  it "should work for multuple records" 


  it "should update identifications" 

end

