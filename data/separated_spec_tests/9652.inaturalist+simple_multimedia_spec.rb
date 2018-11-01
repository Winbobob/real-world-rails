require "spec_helper"

describe DarwinCore::SimpleMultimedia do
  before(:each) { enable_elastic_indexing( Observation, Taxon ) }
  after(:each) { disable_elastic_indexing( Observation, Taxon ) }
  let(:o) { make_research_grade_observation }
  let(:p) { 
    photo = o.photos.first
    photo.update_attributes(license: Photo::CC_BY)
    DarwinCore::SimpleMultimedia.adapt(photo, observation: o)
  }
  it "should return StillImage for dwc_type" 

  it "should return MIME type for format" 

  it "should return original_url for identifier if available" 

  it "should return the medium_url if that's the best available" 

  it "should return photo page URL for references" 

  # it "should return EXIF date_time_original for created"
  it "should return user name for creator" 

  it "should return user login for creator if name blank" 

  it "should return iNaturalist for publisher of LocalPhoto" 

  
  # getting these to work would require more stubbing than I'm up for right now
  it "should return Flickr for publisher of FlickrPhoto"
  it "should return Facebook for publisher of FacebookPhoto"
  it "should return Picasa for publisher of PicasaPhoto"

  it "should return CC license URI for dwc_license" 

  it "should return user name for rightsHolder" 

  it "should return user login for rightsHolder if name blank" 

  it "should return photo ID as the catalogNumber" 

end

