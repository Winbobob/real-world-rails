# NOTE: Really, this should be a request spec.
describe "Collections API V1" do

  before(:all) do
    @key = "1234123"
    @user = User.gen(api_key: @key)
    DataType.create_enumerated
    License.create_enumerated
  end

  def encode(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  let(:json) { JSON.parse(response.body) }

  describe "GET /wapi/collections" do
    before(:all) do
      @collection = Collection.gen
      50.times do
        @collection.collection_items << CollectionItem.gen
      end
    end

    before do
      # http://stackoverflow.com/questions/12041091/ror-testing-an-action-that-uses-http-token-authentication
      get '/wapi/collections', {}, { "HTTP_AUTHORIZATION" => encode(@key) }
    end

    it "returns the collections" 

    
    it "should return 30 collections per page" 

    
    it "should return less than 30 per page if requested by user" 

    
    it "should return less than 30 in second page" 

    
    it "should return less than 20 in last page where the user specufy 20 per page" 

    
    it 'should not return CORs when not provided in request' 

    
    it 'should return CORs headers' 

  end

  describe "Create new collection"do
    describe "POST with no name" do
      before do
        Collection.delete_all
        post '/wapi/collections',
          {},
          { "HTTP_AUTHORIZATION" => encode(@key) }
      end
      it "FAILS" 

      it "does not create a collection" 

    end
  
    describe "POST with name" do
      before do
        Collection.delete_all
        post '/wapi/collections',
          { collection: { name: "something important"} },
          { "HTTP_AUTHORIZATION" => encode(@key) }
      end
      it "creates a collection" 

      it "sets the owner" 

      
      it "should not return CORs headers for nonpreflight request" 

    end
  
    describe "POST with full example" do
      let(:taxon) { TaxonConcept.gen }
      let(:data_object) { DataObject.gen }
      before do
        Collection.delete_all
        $FOO = true
        post '/wapi/collections',
          { collection: {
            name: "Something cool",
            description: "lots of important stuff here",
            collection_items: [
              {"annotation" => "Something interesting",
               "collected_item_id" => taxon.id,
               "collected_item_type" => "TaxonConcept",
               "sort_field" => "12"
              },
              {"annotation" => "Something else",
               "collected_item_id" => data_object.id,
               "collected_item_type" => "DataObject"
              }
            ]
          } },
          { "HTTP_AUTHORIZATION" => encode(@key), 
            "HTTP_ORIGIN" => Rails.configuration.site_domain}
      end
  
      it "should return CORs headers for preflight request" 

      
      # Using many assertions in one #it block because it's expensive to run.
      it "creates the exepected collection" 

    end

    describe "creating failures" do

      it "does not create a collection with invalid collection item's type" do 
         post '/wapi/collections',
          { collection: {
            name: "any name",
            description: "any description",
            collection_items: [
               { "collected_item_id" => 1,
               "collected_item_type" => "InvalidType",
              }] } },
          { "HTTP_AUTHORIZATION" => encode(@key) }
          expect(response.body).to include I18n.t(
          :cannot_create_collection_items_from_invalid_types, types: "InvalidType")
      end

      it "does not accept missing non-optional attributes " do 
        post '/wapi/collections',
          { collection: {
            name: "any name",
              description: "any description",
              collection_items: [ collected_item_type: "TaxonConcept",
              annotation: " an item without type & id" ] } },
          { "HTTP_AUTHORIZATION" => encode(@key) }
          expect(response.body).to include I18n.t(:collection_create_failure)
      end
    end
  end
  
  describe "Update collection" do
    before :all do
      @taxon = TaxonConcept.gen
      @data_object = DataObject.gen
      Collection.delete_all
      post '/wapi/collections',
        {collection: {
          name: "name",
          collection_items: [
            {"annotation" => "item1",
             "collected_item_id" => @taxon.id,
             "collected_item_type" => "TaxonConcept",
             "sort_field" => "12"
            },
            {"annotation" => "item2",
             "collected_item_id" => @data_object.id,
             "collected_item_type" => "DataObject"
            }
          ]
        }},
        { "HTTP_AUTHORIZATION" => encode(@key) }
        @collection = Collection.last
    end
    
    it "should deny access to unauthorized users" 

    
    it "should deny access to wrong token user" 

    
    it "should update the collection name" 

    
    it "gives a message if the collection does not exist" do 
      non_existing_id = Collection.last.id+1
      put "/wapi/collections/#{non_existing_id}", {collection: {name: "another_name"}}, {"HTTP_AUTHORIZATION" => encode(@key)}
      expect(response.body).to include(I18n.t("collection_not_existing", collection: non_existing_id))
    end
end 
  
  describe "Delete collection" do
    before :all do
      taxon =  TaxonConcept.gen
      Collection.delete_all
      $FOO = true
      post '/wapi/collections',
        {collection: {
          name: "name",
          collection_items: [
            {"annotation" => "item1",
             "collected_item_id" => taxon.id,
             "collected_item_type" => "TaxonConcept",
             "sort_field" => "12"
            }
          ]
        }},
        { "HTTP_AUTHORIZATION" => encode(@key) }
        @collection = Collection.last
    end
    
    it "should deny access to unauthorized user" 

    
    it "should deny access to wrong token user" 

    
    it "should delete the list and returns success" 


    it "gives a message if the collection does not exist" do 
      delete "/wapi/collections/0", {collection: {name: "another_name"}},
      {"HTTP_AUTHORIZATION" => encode(@key)}
      expect(response.body).to include(I18n.t("collection_not_existing", collection: 0))
    end
  end
end

