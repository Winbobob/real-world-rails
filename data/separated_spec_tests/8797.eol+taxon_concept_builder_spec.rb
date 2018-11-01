require "spec_helper"

describe 'build_taxon_concept (spec helper method)' do

  before(:all) do
    load_foundation_cache
    @event           = HarvestEvent.gen
    @scientific_name = 'Something cool'
    @hierarchy       = Hierarchy.gen
    @taxon_concept   = build_taxon_concept(comments: [], toc: [], bhl: [], images: [], sounds: [], youtube: [], flash: [])
    @taxon_concept_with_args = build_taxon_concept(
      :hierarchy       => @hierarchy,
      :event           => @event,
      scientific_name: @scientific_name,
      comments: [],
      toc: [],
      bhl: [],
      images: [],
      sounds: [],
      youtube: [],
      flash: []
    )
    @taxon_concept_naked = build_taxon_concept(
      images: [], toc: [], flash: [], youtube: [], comments: [], bhl: []
    )
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end

  it 'should not have a common name by defaut' 


  it 'should put all new hierarchy_entries under the default hierarchy if none supplied'  do
    @taxon_concept.hierarchy_entries.each do |he|
      he.hierarchy.should == Hierarchy.default
    end
  end

  it 'should put all new hierarchy_entries under the hierarchy supplied' 


  it 'should use default HarvestEvent if no alternative provided' 


  it 'should use the supplied HarvestEvent to create all data objects' 


  it 'should create a scientific name' 


  it 'should create a scientific name when specified' 


end

