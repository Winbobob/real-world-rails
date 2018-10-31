require File.dirname(__FILE__) + '/spec_helper'

describe Ratatosk::Ratatosk do
  before(:each) do
    @ratatosk = Ratatosk::Ratatosk.new
  end
  
  it "should have a find method" 

  
  it "should have an array of name providers" 

end

describe Ratatosk::Ratatosk, "creation" do
  it "should accept an array of name providers as a param" 


  it "shold accept an array of name provider prefixes as a param" 

end

describe Ratatosk, "searching" do
  before(:each) do
    @ratatosk = Ratatosk
  end
  
  it "should return an array" 

  
  it "should return TaxonName-like objects that have Taxon-like objects" 

  
  it "should return valid names by default" 

  
  it "should return valid names that STAY valid" 

  
  it "should return homonyms in different phyla" 

  
  it "should not return homonyms in the same phylum" 

  
  it "should find 'horseshoe crab'" 

  
  it "should return a taxon with a unique name for Holodiscus discolor" 


  it "should add names to existing taxa" 

end

describe Ratatosk, "grafting" do
  
  before do
    load_test_taxa
  end
  
  before(:each) do
    @ratatosk = Ratatosk::Ratatosk.new
  end
  
  it "should set the parent of Homo sapiens to Homo" 

  
  it "should set the parent of a species to genus" 

  
  it "should set the parent of a subspecies to an existing species" 

  
  it "should not set the parent of a subspecies to a genus" 

  
  it "should not graft homonyms in different phyla to the same parent"
  
  it "should return [] for taxon that is already in the tree" 

  
  it "should graft everything to 'Life'" 

  
  it "should set the parent of a kingdom to 'Life'" 

  
  it "should result in taxa that all have scientific names" 

  
  # Specific tests
  it "should goddamn work for Cuthona divae" 

  
  describe "to a locked subtree" do
    it "should fail" 


    it "should be idempotent" 


    it "should flag taxa that could not be grafted" 

  end
  
  describe "to a complete subtree" do
    it "should fail" 


    it "should flag taxa that could not be grafted" 

    
    it "should not fail if taxon is below complete_rank" 


    it "should not flag if taxon is below complete_rank" 

  end
  

  it "should look up import a polynom parent" 

end

describe Ratatosk, "get_graft_point_for" do
  before :all do
    load_test_taxa
  end
  
  before(:each) do
    @ratatosk = Ratatosk::Ratatosk.new
  end
  
  it "should get the graft point for a lineage" 

  
end

def load_test_taxa
  Taxon.delete_all
  TaxonName.delete_all
  Rails.logger.debug "\n\n\n[DEBUG] loading test taxa"
  @Life = Taxon.make!(:name => 'Life')

  @Animalia = Taxon.make!(:name => 'Animalia', :rank => 'kingdom', :is_iconic => true)
  @Animalia.update_attributes(:parent => @Life)

  @Chordata = Taxon.make!(:name => 'Chordata', :rank => "phylum")
  @Chordata.update_attributes(:parent => @Animalia)

  @Amphibia = Taxon.make!(:name => 'Amphibia', :rank => "class", :is_iconic => true)
  @Amphibia.update_attributes(:parent => @Chordata)

  @Hylidae = Taxon.make!(:name => 'Hylidae', :rank => "order")
  @Hylidae.update_attributes(:parent => @Amphibia)

  @Pseudacris = Taxon.make!(:name => 'Pseudacris', :rank => "genus")
  @Pseudacris.update_attributes(:parent => @Hylidae)

  @Pseudacris_regilla = Taxon.make!(:name => 'Pseudacris regilla', :rank => "species")
  @Pseudacris_regilla.update_attributes(:parent => @Pseudacris)
  
  @Caudata = Taxon.make!(:name => 'Caudata', :rank => "order")
  @Caudata.update_attributes(:parent => @Amphibia)
  
  @Ensatina = Taxon.make!(:name => 'Ensatina', :rank => "genus")
  @Ensatina.update_attributes(:parent => @Caudata)

  @Ensatina_eschscholtzii = Taxon.make!(:name => 'Ensatina eschscholtzii', :rank => "species")
  @Ensatina_eschscholtzii.update_attributes(:parent => @Ensatina)
  
  @Aves = Taxon.make!(:name => "Aves", :rank => "class", :is_iconic => true)
  @Aves.update_attributes(:parent => @Chordata)
  
  @Apodiformes = Taxon.make!(:name => "Apodiformes", :rank => "order")
  @Apodiformes.update_attributes(:parent => @Aves)
  
  @Trochilidae = Taxon.make!(:name => "Trochilidae", :rank => "family")
  @Trochilidae.update_attributes(:parent => @Apodiformes)
  
  @Calypte = Taxon.make!(:name => "Calypte", :rank => "genus")
  @Calypte.update_attributes(:parent => @Trochilidae)
  
  @Calypte_anna = Taxon.make!(:name => "Calypte anna", :rank => "species")
  @Calypte_anna.update_attributes(:parent => @Calypte)
  
  @Calypte_anna.taxon_names << TaxonName.make!(:name => "Anna's Hummingbird", 
    :taxon => @Calypte_anna, 
    :lexicon => TaxonName::LEXICONS[:ENGLISH])
    
  @Arthropoda = Taxon.make!(:name => 'Arthropoda', :rank => "phylum")
  @Arthropoda.update_attributes(:parent => @Animalia)

  @Insecta = Taxon.make!(:name => 'Insecta', :rank => "class", :is_iconic => true)
  @Insecta.update_attributes(:parent => @Arthropoda)

  Rails.logger.debug "[DEBUG] DONE loading test taxa\n\n\n"
end

