# encoding: utf-8
require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:Docs' do
  before(:all) do
    load_foundation_cache
    # create some entry in the default hierarchy with an identifier - needed to render some API docs
    build_hierarchy_entry(0, TaxonConcept.gen, Name.gen, identifier: 12345, hierarchy: Hierarchy.default)
  end

  it 'there should be at least 9 API methods' 


  it 'should render an index page' 


  it 'should render a page for each method, showing the parameters' 


  it 'should have a form with each parameter as a field' 

end

