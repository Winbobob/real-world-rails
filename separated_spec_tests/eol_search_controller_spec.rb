require "spec_helper"

describe SearchController do

  render_views

  describe 'index' do
    before(:all) do
      truncate_all_tables
      Language.create_english
    end
  end

  it "should find no results on an empty search" 


  describe "taxon autocomplete" do
    before(:all) do
      Vetted.create_enumerated
      Visibility.create_enumerated
      DataType.create_enumerated
      SynonymRelation.gen_if_not_exists(label: "synonym")
      SynonymRelation.gen_if_not_exists(label: "common name")
      SynonymRelation.gen_if_not_exists(label: "genbank common name")
      Language.gen_if_not_exists(label: 'Unknown', iso_639_1: '', source_form: 'Unknown')
      Language.gen_if_not_exists(label: 'Scientific Name', iso_639_1: '', source_form: 'Scientific Name')
      synonym = Synonym.gen
      name = Name.find(synonym.name_id)
      name.update_attributes(string: "cat")
      EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
    end

    it "should return suggestions when user misspell taxon name" 

  end
  
  describe "filter keyword" do
    before(:all) do
      Vetted.create_enumerated
      Visibility.create_enumerated
      DataType.create_enumerated
      SynonymRelation.gen_if_not_exists(label: "synonym")
      SynonymRelation.gen_if_not_exists(label: "common name")
      SynonymRelation.gen_if_not_exists(label: "genbank common name")
      Language.gen_if_not_exists(label: 'Unknown', iso_639_1: '', source_form: 'Unknown')
      Language.gen_if_not_exists(label: 'Scientific Name', iso_639_1: '', source_form: 'Scientific Name')
      synonym = Synonym.gen
      name = Name.find(synonym.name_id)
      name.update_attributes(string: "cat")
      he = HierarchyEntry.gen(hierarchy: Hierarchy.gen(), parent_id: 0, identifier: '', depth: 0, rank_id: 0, vetted_id: Vetted.trusted_ids,
                                taxon_concept: TaxonConcept.gen, name: name)            
      Collection.gen      
      EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
    end

    it "should return the appropriate type elements" 

  end

end

