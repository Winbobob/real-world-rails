require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/name_provider_example_groups'

describe Ratatosk::NameProviders::EolNameProvider do
  it_should_behave_like "a name provider"

  before(:all) do
    load_test_taxa
    @np = Ratatosk::NameProviders::EolNameProvider.new
  end

  it "should set the source_identifier of Epimartyria pardella to 965114" 


  it "should find invalid names" 


  it "should attach invalid names to a valid taxon" 


  it "should find taxa by common name" 


  it "should return a taxon name for common names" 


  it "should graft" 


  it "should find a bunch of names" 


end

