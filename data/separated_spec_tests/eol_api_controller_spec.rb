require "spec_helper"

describe ApiController do
  before(:all) do
    load_foundation_cache
    # create some entry in the default hierarchy with an identifier - needed to render some API docs
    build_hierarchy_entry(0, TaxonConcept.gen, Name.gen, :identifier => 12345, :hierarchy => Hierarchy.default)
    begin
      @taxon_concept = build_taxon_concept(:comments => [], :images => [], :flash => [], :youtube => [], :sounds => [], :bhl => [])
    rescue ActiveRecord::RecordInvalid => invalid
      puts invalid.record.errors
      puts "So, not sure what causes that; can you look into it?"
    end
  end

  it 'there should be at least 9 API methods' 


  it 'should load the class corresponding to each API method' 


  it 'should set cache headers' 


  it 'should only cache responses when requested' 


  it 'should not add cache headers when there is an error' 


  it 'should generate 404 errors for missing or unpublished records' 

end

