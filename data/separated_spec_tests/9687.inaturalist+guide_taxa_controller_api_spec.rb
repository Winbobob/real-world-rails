require File.dirname(__FILE__) + '/../spec_helper'

describe GuideTaxaController, "index" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }
  
  before do
    @guide_photo = GuidePhoto.make!
    @guide_taxon = @guide_photo.guide_taxon
    @guide = @guide_photo.guide
  end

  it "should include guide photos" 

end

describe GuideTaxaController, "show" do
  render_views
  let(:guide) { make_published_guide }
  let(:guide_taxon) { guide.guide_taxa.first }
  it "should include an absolute path to a stylesheet" 

end

