require "spec_helper"

describe 'Admin Pages' do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    @user = User.gen(username: 'ourtestadmin')
    @user.grant_admin

    @agent = Agent.gen(full_name: 'HierarchyAgent')
    @hierarchy = Hierarchy.gen(label: 'TreeofLife', description: 'contains all life', agent: @agent)
    @hierarchy_entry = HierarchyEntry.gen(hierarchy: @hierarchy)

    last_month = Time.now - 1.month
    @report_year = last_month.year.to_s
    @report_month = last_month.month.to_s
    @year_month   = @report_year + "_" + "%02d" % @report_month.to_i
    @resource_user = User.gen(agent: @agent)
    @content_partner = ContentPartner.gen(user: @resource_user)
    @resource = Resource.gen(title: "FishBase Resource", content_partner: @content_partner)
    @harvest_event = HarvestEvent.gen(resource_id: @resource.id, published_at: last_month)

    @data_object = build_data_object("Text", "This is a description", published: 1, vetted: Vetted.trusted)
    @data_objects_harvest_event = DataObjectsHarvestEvent.gen(data_object_id: @data_object.id, harvest_event_id: @harvest_event.id)

    @taxon_concept = TaxonConcept.gen(published: 1, supercedure_id: 0)
    @data_objects_taxon_concept = DataObjectsTaxonConcept.gen(data_object_id: @data_object.id, taxon_concept_id: @taxon_concept.id)

    @toc_item = TocItem.gen_if_not_exists(label: "sample label")
    @info_item = InfoItem.gen(toc_id: @toc_item.id)
  end

  after :each do
    visit('/logout')
  end

  it 'should load the admin homepage' 


  it 'should show the list of hierarchies' 


  it 'should load an empty harvesting logs page' 


  it 'should show harvesting_logs' 


  it "should show table of contents breakdown page" 



end

