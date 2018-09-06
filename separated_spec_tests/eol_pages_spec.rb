# encoding: utf-8
require File.dirname(__FILE__) + '/../../spec_helper'

# TODO - this is really awful setup.  :|

describe 'API:pages' do
  before(:all) do
    load_foundation_cache # TODO -try removing this. I think we can go faster with just create_defaults as needed.
    Capybara.reset_sessions!
    @user = User.gen(api_key: User.generate_key)

    # DataObjects
    @overview      = TocItem.overview
    @toc_item_2    = TocItem.find(TocItem.possible_overview_ids.last) # This used to be distribution
    @toc_item_3    = TocItem.find(TocItem.possible_overview_ids.second) # This used to be description
    @overview_text = 'This is a test Overview, in all its glory'
    @toc_label_2   = @toc_item_2.label
    @toc_label_3   = @toc_item_3.label
    @desc_2        = "This is a test #{@toc_label_2}"
    @desc_3        = "This is a test #{@toc_label_3}, in all its glory"
    @image_1       = FactoryGirl.generate(:image)
    @image_2       = FactoryGirl.generate(:image)
    @image_3       = FactoryGirl.generate(:image)
    @video_1_text  = 'First Test Video'
    @video_2_text  = 'Second Test Video'
    @video_3_text  = 'YouTube Test Video'

    # The API actually takes INFO ITEMS, not toc items, so let's make those if they aren't there:
    @toc_item_2.info_items << TranslatedInfoItem.gen(label: @toc_label_2).info_item unless @toc_item_2.info_items.map(&:label).include?(@toc_label_2)
    @toc_item_3.info_items << TranslatedInfoItem.gen(label: @toc_label_3).info_item unless @toc_item_3.info_items.map(&:label).include?(@toc_label_3)

    @taxon_concept   = build_taxon_concept(
       comments: [],
       bhl: [],
       sounds: [],
       flash:           [{description: @video_1_text}, {description: @video_2_text}],
       youtube:         [{description: @video_3_text}],
       images:          [{object_cache_url: @image_1}, {object_cache_url: @image_2},
                          {object_cache_url: @image_3}],
       toc:             [{toc_item: @overview, description: @overview_text, license: License.by_nc, rights_holder: "Someone"},
                          {toc_item: @toc_item_2, description: @desc_2, license: License.cc, rights_holder: "Someone"},
                          {toc_item: @toc_item_3, description: @desc_3, license: License.public_domain, rights_holder: ""},
                          {toc_item: @toc_item_3, description: 'test uknown', vetted: Vetted.unknown, license: License.by_nc, rights_holder: "Someone"},
                          {toc_item: @toc_item_3, description: 'test untrusted', vetted: Vetted.untrusted, license: License.cc, rights_holder: "Someone"}])
    @preferred_common_name_synonym = @taxon_concept.add_common_name_synonym(Faker::Eol.common_name.firstcap, agent: Agent.last, language: Language.english)
    @taxon_concept.add_common_name_synonym(Faker::Eol.common_name.firstcap, agent: Agent.last, language: Language.english)

    d = DataObject.last
    d.license = License.by_nc
    d.save!
    @object = DataObject.create(
      guid:                   '803e5930803396d4f00e9205b6b2bf21',
      identifier:             'doid',
      data_type:              DataType.text,
      mime_type:              MimeType.gen_if_not_exists(label: 'text/html'),
      object_title:           'default title',
      language:               Language.find_or_create_by_iso_639_1('en'),
      license:                License.by_nc,
      rights_statement:       'default rights © statement',
      rights_holder:          'default rights holder',
      bibliographic_citation: 'default citation',
      source_url:             'http://example.com/12345',
      description:            'default description <a href="http://www.eol.org">with some html</a>',
      object_url:             '',
      thumbnail_url:          '',
      location:               'default location',
      latitude:               1.234,
      longitude:              12.34,
      altitude:               123.4,
      published:              1,
      curated:                0)
    @object.toc_items << @toc_item_2
    @object.save!

    AgentsDataObject.create(data_object_id: @object.id,
                            agent_id: Agent.gen(full_name: 'agent one', homepage: 'http://homepage.com/?agent=one&profile=1').id,
                            agent_role: AgentRole.writer,
                            view_order: 1)
    AgentsDataObject.create(data_object_id: @object.id,
                            agent: Agent.gen(full_name: 'agent two'),
                            agent_role: AgentRole.editor,
                            view_order: 2)
    @object.refs << Ref.gen(full_reference: 'first reference')
    @object.refs << Ref.gen(full_reference: 'second reference')
    @taxon_concept.add_data_object(@object)

    EOL::Data.make_all_nested_sets
    EOL::Data.flatten_hierarchies

    EOL::Solr::SiteSearchCoreRebuilder.begin_rebuild
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild

    @default_pages_body = source
  end

  context 'batch mode' do
    before :all do
      @taxon_concept1 = build_taxon_concept(
         comments: [],
         bhl: [],
         sounds: [],
         flash:           [{description: @video_1_text}],
         youtube:         [{description: @video_3_text}],
         images:          [{object_cache_url: @image_1}],
         toc:             [{toc_item: @overview, description: @overview_text, license: License.by_nc, rights_holder: "Someone"}])
    end
    
    context 'JSON response format' do
      it 'should return array of length 1 for one id' 

      
      it 'should return array of length 2 for three ids' 

    end
    
    context 'XML response format' do
      it 'should have taxonConcepts element' 

      
      it 'should return array of length 2 for three ids' 

    end
  end

  # not logging API anymore!
  # it 'pages should take api key and save it to the log' do
    # check_api_key("/api/pages/#{@taxon_concept.id}.json?key=#{@user.api_key}", @user)
  # end

  it 'pages should return only published concepts' 


  it 'pages should show one data object per category' 


  it 'pages should be able to limit number of media returned' 


  it 'pages should be able to limit number of text returned' 


  # TODO - these tests are slightly silly because they actually specify the correct number of text items to return...
  # Might be better if it simply checked that the list of data Objects either had the expected subjects or included the expected
  # items. ...But that's a but more work for me that I'm not keen on doing right now.
  it 'pages should be able to take a | delimited list of subjects' 


  it 'pages should be able to return ALL subjects' 


  it 'pages should be able to take a | delimited list of licenses' 


  it 'pages should be able to return ALL licenses' 


  it 'pages should be able to get more details on data objects' 


  it 'pages should not filter vetted objects by default' 


  it 'pages should filter out all non-trusted objects' 


  it 'pages should filter out untrusted objects' 

  it "pages should filter out trusted and untrusted objects" 

  it "pages should filter out trusted and untrusted objects in xml" 

  it "pages should filter out trusted and unknown objects" 

  it "pages should filter out trusted and unknown objects in xml" 

  it 'pages should be able to toggle common names' 


  it 'pages should show which common names are preferred' 


  it 'pages should show data object vetted status and rating by default' 


  it 'pages should be able to toggle synonyms' 


  describe "synonyms" do
    before(:all) do
      @taxon = TaxonConcept.gen(published: 1, supercedure_id: 0)
      hierarchy = Hierarchy.gen(label: 'my hierarchy', browsable: 1)
      @resource = Resource.gen(title: "resource_title", hierarchy_id: hierarchy.id)
      hierarchy_entry = HierarchyEntry.gen(hierarchy: hierarchy, taxon_concept: @taxon, rank: Rank.gen_if_not_exists(label: 'species'))
      name = Name.gen(string: 'my synonym 1')
      relation = SynonymRelation.gen_if_not_exists(label: 'not common name')
      synonym = Synonym.gen(hierarchy_entry: hierarchy_entry, name: name, synonym_relation: relation)
    end
    it "displays resource_name in json format" 


    it "displays resource_name in xml format" 

  end

  it 'pages should be able to render a JSON response' 


  it 'pages should return exemplar images first' 


  it 'pages should return exemplar articles' 


  it 'pages should return preferred common names, no matter their order in the DB' 


  it 'excludes the empty attributes from the response' do 
    taxon_concept = TaxonConcept.gen
    response = get_as_xml("/api/data_objects/#{taxon_concept.id}")
    expect(response["references"]).to be_nil
    expect(response["agents"]).to be_nil
    response = get_as_json("/api/data_objects/#{taxon_concept.id}.json")
    expect(response["references"]).to be_nil
    expect(response["agents"]).to be_nil
  end

  it 'adds the crop info in the page only when the details is true' 

end

