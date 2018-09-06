require "spec_helper"

describe 'Feeds' do

  def verify_entry_for_object(xpath_object)
    xpath_object.xpath("xmlns:id").inner_text.should == data_object_url(@data_object)
    xpath_object.xpath("xmlns:link[@rel='alternate']/@href").inner_text.should == data_object_url(@data_object)
    xpath_object.xpath("xmlns:title").inner_text.should == @data_object.first_hierarchy_entry.name.string
  end

  before(:all) do
    load_foundation_cache
    @user = User.gen(curator_level: CuratorLevel.full, credentials: 'whatever', curator_scope: 'fun')
    # creating bits we need for the content partner/resource/harvest
    @agent = Agent.gen(full_name: 'HierarchyAgent')
    @hierarchy = Hierarchy.gen(label: 'TreeofLife', description: 'contains all life', agent: @agent)
    @hierarchy_entry = HierarchyEntry.gen(hierarchy: @hierarchy)
    @resource_user = User.gen(agent: @agent)
    @content_partner = ContentPartner.gen(user: @resource_user)
    @resource = Resource.gen(title: "FishBase Resource", content_partner: @content_partner)
    @harvest_event = HarvestEvent.gen(resource_id: @resource.id, published_at: Time.now)
    @taxon_concept = TaxonConcept.gen(published: 1, supercedure_id: 0)
    @hierarchy_entry = HierarchyEntry.gen(taxon_concept_id: @taxon_concept.id)
    HarvestEventsHierarchyEntry.gen(hierarchy_entry_id: @hierarchy_entry.id, harvest_event_id: @harvest_event.id)
    @misidentified = UntrustReason.misidentified
    @user_regex = "by.*#{user_url(@user)}.*#{@user.full_name}.*last [0-9].*at [0-9]{2}:"
  end

  before(:each) do
    CuratorActivityLog.destroy_all
    @data_object = build_data_object("Text", "This is a description", published: 1, vetted: Vetted.trusted)
    DataObjectsHarvestEvent.gen(data_object_id: @data_object.id, harvest_event_id: @harvest_event.id, guid: @data_object.guid)
    DataObjectsHierarchyEntry.delete_all(data_object_id: @data_object.id, hierarchy_entry_id: @hierarchy_entry.id)
    @dohe = DataObjectsHierarchyEntry.create(data_object: @data_object, hierarchy_entry: @hierarchy_entry,
                                                    visibility: Visibility.visible, vetted: Vetted.trusted)
    @association = DataObjectTaxon.new(@dohe)
  end

  it 'should start with an empty feed' 


  it 'should list untrusting actions' 


  it 'should list trusting actions' 


end

