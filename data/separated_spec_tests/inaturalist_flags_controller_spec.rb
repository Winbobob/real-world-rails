require File.dirname(__FILE__) + '/../spec_helper'

describe FlagsController do

  # These are crazy simple tests, but we do rely on the values of these
  # constants elsewhere, so I figured some tests couldn't hurt
  it "should have the right FLAG_MODELS" 


  it "should have the right FLAG_MODELS_ID" 


  describe "update" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }

    let(:curator) { make_curator }
    let(:user) { make_curator }
    let(:flag) { Flag.make!(flaggable: Photo.make!, user: user) }

    it "allows curators to update" 


    it "allows the flag creator to update" 


    it "does not allow other users to update" 

  end

  describe "destroy" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    
    let(:curator) { make_curator }
    let(:user) { make_curator }
    let(:flag) { Flag.make!(flaggable: Photo.make!, user: user) }

    it "allows curators to update" 


    it "allows the flag creator to update" 


    it "does not allow other users to update" 

  end

end

