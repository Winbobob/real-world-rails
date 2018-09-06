require "spec_helper"

describe DarwinCore::ObservationFields do
  before(:each) { enable_elastic_indexing( Observation, Taxon ) }
  after(:each) { disable_elastic_indexing( Observation, Taxon ) }
  let(:o) { make_research_grade_observation }
  let(:of) { ObservationField.make! }
  let(:ofv) {
    DarwinCore::ObservationFields.adapt( ObservationFieldValue.make!( observation: o ), observation: o )
  }

  before do
    expect( ofv.observation ).to eq o
  end

  it "should set fieldName to the name of the observation field" 

  
  it "should set fieldID to the URI of the observation field" 

end

