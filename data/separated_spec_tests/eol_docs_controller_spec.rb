require File.dirname(__FILE__) + '/../../spec_helper'

describe Api::DocsController do
  before(:all) do
    load_foundation_cache
    # create some entry in the default hierarchy with an identifier - needed to render some API docs
    build_hierarchy_entry(0, TaxonConcept.gen, Name.gen, :identifier => 12345, :hierarchy => Hierarchy.default)
  end

  it 'there should be at least 9 API methods' 


  it "should load the class corresponding to each API method" 


  it "should have documentation for each version of the method" 

end

