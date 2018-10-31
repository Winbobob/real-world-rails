require "spec_helper"

def overviews_do_show
  get :show, :id => @testy[:taxon_concept].id.to_i
end

describe Taxa::OverviewController do

  before(:all) do
    load_foundation_cache
    @testy = {}
    @testy[:user] = User.gen
    @testy[:taxon_concept] =  build_taxon_concept(images: [], toc: [], sname: [], comments: [],
                              flash: [], sounds: [], bhl: [], biomedical_terms: nil)
    @testy[:unpublished_taxon_concept] = TaxonConcept.gen(:published => 0, :supercedure_id => 0)
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end

  describe 'GET overview' do
    it "should NOT be accessible if taxon concept id is not found" 

    it "should NOT be accessible if taxon concept is unpublished" 

    it 'should be accessible if taxon concept is published' 

    it 'should instantiate the taxon concept and page' 

    it 'should instantiate an assistive header' 

    # Note: I removed the map test, since this is now tested in TaxonPage.

  end

  # This seems slightly misplaced, but, in fact, we need a controller spec to test this...
  describe "TaxonPage links" do

    before(:all) do
      @taxon_concept = TaxonConcept.gen # Doesn't need to be anything fancy, here.
      @entry = HierarchyEntry.gen
      @user = User.gen
      @taxon_page = TaxonPage.new(@taxon_concept, @user)
      @taxon_page_with_entry = TaxonPage.new(@taxon_concept, @user, @entry)
    end

    it 'should link to the overview just like the taxon_concept' 


    it 'should link to the selected hierarchy entry view just like the taxon_concept' 


    # I don't want to test every single link, just the common one (overview) and something more complicated:
    it 'should link to the common names just like the taxon_concept' 


    # I don't want to test every single link, just the common one (overview) and something more complicated:
    it 'should link to the selected hierarhcy entry view of common names just like the taxon_concept' 


  end

end

