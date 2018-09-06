require "spec_helper"

def create_curator_for_taxon_concept(tc)
  curator = build_curator(tc)
  return curator
end

describe 'Curation' do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    # Curators are not recognized if transactions are being used, thanks to a lovely
    # cross-database join.  You can't rollback, because of the EolScenario stuff.  [sigh]
    EOL::Db.all_connections.each do |conn|
      conn.commit_db_transaction
      conn.begin_db_transaction if conn.open_transactions > 0
    end
    @common_names_toc_id = TocItem.common_names.id
    @parent_hierarchy_entry = HierarchyEntry.gen(hierarchy_id: Hierarchy.default.id)
    @taxon_concept   = build_taxon_concept(parent_hierarchy_entry_id: @parent_hierarchy_entry.id,
                                           comments: [], bhl: [], toc: [], sounds: [], youtube: [], flash: [], images: [])
    @common_name     = 'boring name'
    @unreviewed_name = Faker::Eol.common_name.firstcap
    @untrusted_name  = Faker::Eol.common_name.firstcap
    @agents_cname    = Faker::Eol.common_name.firstcap
    agent = Agent.find(@taxon_concept.acting_curators.first.agent_id)
    @cn_curator = create_curator_for_taxon_concept(@taxon_concept)
    @common_syn = @taxon_concept.add_common_name_synonym(@common_name, agent: agent,
                                                         language: Language.english,
                                                         vetted: Vetted.unknown, preferred: false)
    @unreviewed_syn = @taxon_concept.add_common_name_synonym(@unreviewed_name, agent: agent,
                                                             language: Language.english,
                                                             vetted: Vetted.unknown, preferred: false)
    @untrusted_syn = @taxon_concept.add_common_name_synonym(@untrusted_name, agent: agent,
                                                            language: Language.english,
                                                            vetted: Vetted.untrusted, preferred: false)
    @agents_syn = @taxon_concept.add_common_name_synonym(@agents_cname, agent: @cn_curator,
                                                         language: Language.english,
                                                         vetted: Vetted.trusted, preferred: false)
    @first_curator = create_curator_for_taxon_concept(@taxon_concept)
    @default_num_curators = @taxon_concept.acting_curators.length
    EOL::Data.make_all_nested_sets
    EOL::Data.flatten_hierarchies

    visit("/pages/#{@taxon_concept.id}")
    @default_page  = source
    visit("/pages/#{@taxon_concept.id}/names/common_names")
    @non_curator_cname_page = source
    @new_name   = 'habrish lammer'
    @taxon_concept.add_common_name_synonym @new_name, agent: Agent.find(@cn_curator.agent_id),
      preferred: false, language: Language.english
  end

  after(:each) do
    visit logout_url
  end

  it 'should show a curator the ability to add a new common name' 


  it 'should show common name sources for curators' 

  
  # Note that this is essentially the same test as in taxa_page_spec... but we're a curator, now... and it uses a separate
  # view, so it needs to be tested.
  it 'should show all common names trust levels' 

  
  it 'should show vetting drop-down for common names either NOT added by this curator or added by a CP' 

  
  it 'should show delete link for common names added by this curator' 

  
  it 'should not show editing common name environment if curator is not logged in' 


end

