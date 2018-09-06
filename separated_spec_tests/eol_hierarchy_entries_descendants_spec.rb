require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:hierarchy_entries_descendants' do
  before(:all) do
    load_foundation_cache
    @canonical_form = CanonicalForm.create(string: 'Aus bus')
    @name = Name.create(canonical_form: @canonical_form, string: 'Aus bus Linnaeus 1776')
    @hierarchy = Hierarchy.gen(label: 'Test Hierarchy', browsable: 1, outlink_uri: "outlink")
    @rank = Rank.gen_if_not_exists(label: 'species')
    @hierarchy_entry = HierarchyEntry.gen(identifier: '123abc', hierarchy: @hierarchy, name: @name, published: 1, rank: @rank)

    common_name = SynonymRelation.gen_if_not_exists(label: 'common name')
    @common_name1 = Synonym.gen(hierarchy_entry: @hierarchy_entry, synonym_relation: common_name, language: Language.english)
    @common_name2 = Synonym.gen(hierarchy_entry: @hierarchy_entry, synonym_relation: common_name, language: Language.english)

    not_common_name = SynonymRelation.gen_if_not_exists(label: 'not common name')
    @synonym = Synonym.gen(hierarchy_entry: @hierarchy_entry, synonym_relation: not_common_name)

    @rank_of_descentant_hierarchy_entry = Rank.gen_if_not_exists(label: 'subspecies')
    canonical_form_of_descentant_hierarchy_entry = CanonicalForm.create(string: 'test ')
    @name_of_descentant_hierarchy_entry = Name.create(canonical_form: canonical_form_of_descentant_hierarchy_entry,
                                                     string: 'test string')
    @descentant_hierarchy_entry = HierarchyEntry.gen(identifier: '123abb', hierarchy: @hierarchy,
                                                    name: @name_of_descentant_hierarchy_entry, published: 1,
                                                    rank: @rank_of_descentant_hierarchy_entry)
    FlatEntry.create(hierarchy_entry_id: @descentant_hierarchy_entry.id , ancestor_id: @hierarchy_entry.id, hierarchy_id: @hierarchy.id)
  end


  it 'Should show all information for descendants of hierarchy entries in DWC format' 


  it 'Should show all information for descendants of hierarchy entries in TCS format' 


  it 'Should show all information for descendants of hierarchy entries in JSON format' 

end

