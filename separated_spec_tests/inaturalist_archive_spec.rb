require "spec_helper"

describe DarwinCore::Archive, "make_metadata" do
  it "should include an archive license if specified" 


  it "should include a contact from the default config" 

end

describe DarwinCore::Archive, "make_descriptor" do
  it "should include the Simple Multimedia extension" 

  it "should include the ObservationFields extension" 

  it "should include the ProjectObservations extension" 

  it "should include multiple extensions" 

end

describe DarwinCore::Archive, "make_simple_multimedia_data" do
  before(:each) { enable_elastic_indexing( Observation, Taxon ) }
  after(:each) { disable_elastic_indexing( Observation, Taxon ) }

  let(:o) { make_research_grade_observation }
  let(:p) { 
    photo = o.photos.first
    without_delay { photo.update_attributes(license: Photo::CC_BY) }
    DarwinCore::SimpleMultimedia.adapt(photo, observation: o)
  }

  it "should not choke if a taxon was specified" 

  
  it "should set the license to a URI" 


  it "should set the core ID in the first column to the observation ID by default" 


  it "should set the core ID in the first column to the taxon ID if the core is taxon" 


  it "should include CC0-licensed photos by default" 


  it "should not include unlicensed photos by default" 


  describe "with photo_license is ignore" do
    it "should include CC_BY images" 

    it "should include unlicensed images" 

  end
end

describe DarwinCore::Archive, "make_observation_fields_data" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  let(:o) { make_research_grade_observation }
  let(:of) { ObservationField.make! }
  let(:ofv) {
    ofv = ObservationFieldValue.make!( observation: o )
    DarwinCore::ObservationFields.adapt( ofv, observation: o )
  }

  before do
    expect( ofv.observation ).to eq o
  end

  it "should add rows to the file" 


  it "should set the first column to the observation_id" 


  it "should only export observation field values for observations matching the params" 

end

describe DarwinCore::Archive, "make_project_observations_data" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  let(:o) { make_research_grade_observation }
  let(:po) {
    po = ProjectObservation.make!( observation: o )
    DarwinCore::ProjectObservations.adapt( po, observation: o )
  }

  before do
    expect( po ).to be_valid
    expect( po.observation ).to eq o
  end

  it "should add rows to the file" 


  it "should set the first column to the observation_id" 


  it "should only export observation field values for observations matching the params" 

end

describe DarwinCore::Archive, "make_occurrence_data" do
  before(:each) { enable_elastic_indexing( Observation, Project, Taxon ) }
  after(:each) { disable_elastic_indexing( Observation, Project, Taxon ) }

  it "should filter by taxon" 


  it "should filter by place" 


  it "should filter by license" 


  it "should filter by multiple licenses" 


  it "should include unlicensed observations when licenses is ignore" 


  it "should filter by project" 


  it "should set the license to a URI" 


  it "should set CC license URI using the current version" 


  it "should set CC0 license URI using the current version" 


  it "should only include research grade observations by default" 


  it "should only include licensed observations by default" 


  it "should not include duplicates" 


  it "should not include private coordinates by default" 


  it "should optionally include private coordinates" 


  it "should report coordinateUncertaintyInMeters as the longest diagonal across the uncertainty cell" 


  it "should filter by site_id" 


  it "should include countryCode" 

end

