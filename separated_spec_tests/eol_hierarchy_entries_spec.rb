require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:hierarchy_entries' do
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
  end

  # not logging API anymore!
  # it 'should create an API log including API key' do
    # user = User.gen(api_key: User.generate_key)
    # check_api_key("/api/hierarchy_entries/#{@hierarchy_entry.id}?key=#{user.api_key}", user)
  # end

  it 'hierarchy_entries should show all information for hierarchy entries in DWC format' 


  it 'hierarchy_entries should be able to filter out common names' 


  it 'hierarchy_entries should be able to filter out synonyms' 


  it 'hierarchy_entries should show all information for hierarchy entries in TCS format' 

end

