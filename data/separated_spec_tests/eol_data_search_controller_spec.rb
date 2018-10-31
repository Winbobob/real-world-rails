require "spec_helper"

describe DataSearchController do

  before(:all) do
    load_foundation_cache
    drop_all_virtuoso_graphs
    @user = User.gen
    @user.grant_permission(:see_data)
    @taxon_concept = build_taxon_concept(:comments => [], :bhl => [], :toc => [], :images => [], :sounds => [], :youtube => [], :flash => [])
    @resource = Resource.gen
    @default_data_options = { subject: @taxon_concept, resource: @resource }
  end

  before(:each) do
    session[:user_id] = @user.id
    DataSearchLog.destroy_all
  end

  describe 'Logging' do

    it 'should generate data search logs when there is an attribute specified' 

 
    it 'should log when the specifed clade was searchable' 


    it 'should log when the specifed clade was not searchable' 



    it 'should generate data search logs when there is an attribute specified' 


    it 'should list the number of results' 

    
    describe "equivalent attributes and values" do
      before :all do
        Language.create_english
        #attributes
        k1 = KnownUri.gen
        k1.update_attributes(uri: 'http://eol.org/eye_color') 
        TranslatedKnownUri.create(known_uri_id: k1.id, name: "eye color", language_id: Language.first.id)
        k2 = KnownUri.gen
        @k2_id = k2.id
        k2.update_attributes(uri: 'http://eol.org/color')
        TranslatedKnownUri.create(known_uri_id: k2.id, name: "color", language_id: Language.first.id)
        KnownUriRelationship.create(from_known_uri_id: k1.id,to_known_uri_id: k2.id, relationship_uri: 'http://www.w3.org/2002/07/owl#equivalentProperty')
        #values
        v1 = KnownUri.gen
        v1.update_attributes(uri: 'http://eol.org/violet')
        TranslatedKnownUri.create(known_uri_id: v1.id, name: "violet", language_id: Language.first.id)
        v2 = KnownUri.gen
        @v2_id = v2.id
        v2.update_attributes(uri: 'http://eol.org/purple')
        TranslatedKnownUri.create(known_uri_id: v2.id, name: "purple", language_id: Language.first.id)
        KnownUriRelationship.create(from_known_uri_id: v1.id,to_known_uri_id: v2.id, relationship_uri: 'http://www.w3.org/2002/07/owl#equivalentProperty')
        DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/eye_color', object: 'http://eol.org/purple')).update_triplestore
        DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/eye_color', object: 'http://eol.org/violet')).update_triplestore
        DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/color', object: 'http://eol.org/violet')).update_triplestore
      end
      
      it 'should search with equivalent attributes' 

      
      it 'should search with equivalent values' 

    end
    



    describe "taxon autocomplete" do

      before(:all) do
        @taxon_name = TaxonConceptName.first
        @name = Name.find(@taxon_name.name_id)
        @taxon = TaxonConcept.find(@taxon_name.taxon_concept_id)
        KnownUri.gen_if_not_exists(uri: "http://eol.org/weight")
        @size_uri = KnownUri.gen_if_not_exists(uri: "http://eol.org/size")
        EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
        DataMeasurement.new(subject: @taxon, resource: @resource, predicate: 'http://eol.org/weight', object: '32').update_triplestore
        DataMeasurement.new(subject: @taxon, resource: @resource, predicate: 'http://eol.org/length', object: '40').update_triplestore
      end

     
      it "should select the first taxon if there is many results for taxon name" 

      

      describe "TraitBank search options" do

        it "should not display diused uris in traitbank search options" do # disused attributes
          get :index
          expect(response.body).not_to have_selector('option', value: "http://eol.org/size")
        end

        it "should not display uris that are not in known uris in traitbank search options" do  # attributes are not in known uris
          get :index
          expect(response.body).not_to have_selector('option', value: "http://eol.org/length")
        end

      end
    end

  end

  describe "search" do
    before :all do
      DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/mass', object: '10')).update_triplestore
      DataMeasurement.new(@default_data_options.merge(predicate: 'http://eol.org/mass', object: '100')).update_triplestore
    end
     it 'should search with min and max values' 
    it 'should fix min and max' 


  end
end

