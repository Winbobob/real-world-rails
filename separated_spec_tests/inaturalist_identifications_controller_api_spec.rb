require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "an IdentificationsController" do
  let(:user) { User.make! }
  let(:observation) { Observation.make! }

  describe "create" do
    it "should work" 


    it "should mark the observation as captive if requested" 


    it "should not mark the observation as wild if there's an existing contradictory quality metric" 


    it "should include the observation in the response" 


    it "should not include observation private coordinates" 


    it "should include the observation iconic_taxon_name" 


    it "should set vision attribute" 

  end

  describe "update" do
    let(:identification) { Identification.make!( user: user ) }
    it "should work" 

    
    it "should return json" 


    it "should mark other identifications as not current if restoring" 

  end

  describe "destroy" do
    before(:all) do
      # some identification deletion callbacks need to happen after the transaction is complete
      DatabaseCleaner.strategy = :truncation
    end

    after(:all) do
      DatabaseCleaner.strategy = :transaction
    end

    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }

    let(:identification) { Identification.make!(:user => user) }

    # it "should work" do
    #   delete :destroy, :format => :json, :id => identification.id
    #   expect(Identification.find_by_id(identification.id)).to be_blank
    # end

    it "should not destroy the identification" 

    
    it "should mark the identification as not current" 


    it "should remove the observation taxon if there are no current identifications" 


    # it "should work if there's a pre-existing ident" do
    #   i = Identification.make!( user: user, observation: identification.observation )
    #   expect( i ).to be_current
    #   identification.reload
    #   expect( identification ).not_to be_current
    #   delete :destroy, id: i.id
    #   i.reload
    #   expect( i ).not_to be_current
    #   identification.reload
    #   expect( identification ).to be_current
    # end

    it "should not leave multiple current IDs when deleting a middle ID" 

  end

  describe "by_login" do
    before(:all) { load_test_taxa }
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should return identifications by the selected user" 

    it "should not return identifications not by the selected user" 

    describe "response should include the" do
      let(:ident) { Identification.make!( user: user, observation: make_research_grade_observation( taxon: @Calypte_anna ) ) }
      let(:json_ident) do
        expect( ident ).not_to be_blank
        get :by_login, format: :json, login: user.login
        json = JSON.parse( response.body )
        json.detect{|i| i["id"] == ident.id }
      end
      it "taxon" 

      it "observation" 

      it "observation's taxon" 

      it "observation photo URL" 

      it "observation iconic_taxon_name" 

    end
    it "should include locale-specific taxon name" 

    it "should include place-specific taxon name" 

    it "should include locale-specific observation taxon name" 

  end
end

describe IdentificationsController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "an IdentificationsController"
end

describe IdentificationsController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "an IdentificationsController"
end

