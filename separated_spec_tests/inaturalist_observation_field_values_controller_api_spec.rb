require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "an ObservationFieldValuesController" do
  let(:user) { User.make! }
  let(:observation) { Observation.make!(:user => user) }
  let(:observation_field) { ObservationField.make! }

  describe "index" do
    it "should filter by type" 


    it "should filter by quality grade" 


    describe "taxon in response" do
      let(:t) { Taxon.make!(source: Source.make!, source_identifier: 12345) }
      let(:tst) { TaxonSchemeTaxon.make!(taxon: t, source_identifier: 12345) }
      let(:of) { ObservationField.make!(datatype: ObservationField::TAXON) }
      let(:ofv) { ObservationFieldValue.make!(observation_field: of, value: t.id) }

      before do
        expect( tst ).to be_valid
        expect( ofv ).to be_valid
      end

      it "should be there in the response for a taxon field" 

      it "the taxon should have source" 

      it "the taxon should have source identifier" 

      it "the taxon should have taxon scheme taxa" 

    end
  end

  describe "create" do
    it "should work" 


    it "should provie an appropriate response for blank observation id" 

    
    it "should allow blank values if coming from an iNat mobile app" 


    it "should ignore ID of zero" 

  end

  it "should update" 


  it "should destroy" 


  it "should destroy values on others observations" 

end

describe ObservationFieldValuesController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "an ObservationFieldValuesController"
end

describe ObservationFieldValuesController, "devise authentication" do
  before do
    http_login user
  end
  it_behaves_like "an ObservationFieldValuesController"
end

