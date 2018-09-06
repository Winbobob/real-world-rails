require "spec_helper"

def test_xml(xml, node, data)
  result = xml.xpath("/add/doc/field[@name='#{node}']").map {|n| n.content }
  result.sort.should == data.sort
end

describe 'Solr API' do  
  
  describe ': DataObjects' do
    before(:all) do
      load_foundation_cache
      @solr = SolrAPI.new($SOLR_SERVER, $SOLR_DATA_OBJECTS_CORE)
      @solr.delete_all_documents
    end
  
    it 'should create the data object index' 

  end
  
  describe ': SiteSearch' do
    before(:all) do
      load_foundation_cache
      TaxonConcept.delete_all
      HierarchyEntry.delete_all
      Synonym.delete_all
      ContentPage.delete_all
      @scientific_name = "Something unique"
      @common_name = "Name not yet used"
      @test_taxon_concept = build_taxon_concept(scientific_name: @scientific_name, common_names: [@common_name], comments: [],
                                                bhl: [])
      TaxonConcept.connection.execute("commit")
      TranslatedContentPage.gen(title: "Test Content Page", main_content: "Main Content Page", left_content: "Left Content Page")
      @solr = SolrAPI.new($SOLR_SERVER, $SOLR_SITE_SEARCH_CORE)
      @solr.delete_all_documents
    end
    
    it 'should start with an empty core' 

    
    # NOTE - these numbers are based on the foundation scenario.  If these two specs are failing, and you changed
    # that scenaio file, it is OKAY (and recommended) to update these tests to the correct numbers.
    it 'should rebuild the core' 

    
    it 'should reindex given model' 

    
  end
  
  describe ': BHL' do
    before(:all) do
      load_foundation_cache
      PublicationTitle.delete_all
      TitleItem.delete_all
      ItemPage.delete_all
      PageName.delete_all
      @solr = SolrAPI.new($SOLR_SERVER, $SOLR_BHL_CORE)
      @solr.delete_all_documents
      @test_taxon_concept = build_taxon_concept(bhl: [], comments: [], toc: [], images: [], sounds: [], youtube: [], flash: [])
      
      @publication = PublicationTitle.gen(title: "Series publication title", details: "publisher info",
        start_year: 1700, end_year: 2011)
      @title_item = TitleItem.gen(publication_title: @publication, volume_info: "v2. 1776")
      @item_page = ItemPage.gen(title_item: @title_item, year: 1776, volume: 2, issue: 4, prefix: "Page",
        number: 98)
      PageName.gen(item_page: @item_page, name: @test_taxon_concept.entry.name)
    end
    
    it 'should start with an empty core' 

    
    it 'should rebuild the core' 

  end
  
end


