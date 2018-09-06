require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:synonyms' do
  before(:all) do
    load_foundation_cache
    hierarchy_entry = HierarchyEntry.gen
    name = Name.create(string: 'Some critter')
    relation = SynonymRelation.gen_if_not_exists(label: 'common name')
    language = Language.gen_if_not_exists(label: 'english', iso_639_1: 'en')
    @common_name1 = Synonym.gen(hierarchy_entry: hierarchy_entry, name: name, synonym_relation: relation, language: language)

    canonical_form = CanonicalForm.create(string: 'Dus bus')
    name = Name.create(canonical_form: @canonical_form, string: 'Dus bus Linnaeus 1776')
    relation = SynonymRelation.gen_if_not_exists(label: 'not common name')
    @synonym = Synonym.gen(hierarchy_entry: hierarchy_entry, name: name, synonym_relation: relation)
  end

  # not logging API anymore!
  # it 'should create an API log including API key' do
    # user = User.gen(api_key: User.generate_key)
    # check_api_key("/api/synonyms/#{@synonym.id}?key=#{user.api_key}", user)
  # end

  it 'synonyms should show all information for synonyms in TCS format' 


  it 'synonyms should show all information for common names in TCS format' 

end

