require File.dirname(__FILE__) + '/spec_helper'
# require File.dirname(__FILE__) + '/../lib/ratatosk/name_providers'

######## Shared Example Groups ##############################################

describe "a name provider", :shared => true do

  it "should have a #find method" 


  it "should have a #get_lineage_for method" 


  it "should have a #get_phylum_for method" 


  it "should not return more than 10 results by default for #find" 


  it "should include a TaxonName that EXACTLY matches the query for #find" 

  it "should include a TaxonName that has the correct lexicon" 


  it "should get 'Chordata' as the phylum for 'Homo sapiens'" 


  it "should get 'Magnoliophyta' as the phylum for 'Quercus agrifolia'" 


  it "should get 'Mollusca' as the phylum for 'Paua'" 



  # Some more specific tests. These might seem extraneous, but I find they
  # help find unexpected bugs
  it "should return the parent of 'Paua' as 'Haliotis'" 


  it "should graft 'Cabbage tree' to a lineage including Spermatophyta" 


  it "should graft 'roaches' to a lineage including Insecta" 

end
describe "a Taxon adapter", :shared => true do

  it "should have a name" 


  it "should return a rank" 


  it "should have a source" 


  it "should have a source identifier" 


  it "should have a source URL" 


  it "should save like a Taxon" 


  it "should have the same name before and after saving" 


  it "should have a working #to_json method" 


  it "should only have one scientific name after saving" 


  it "should have a unique name after saving" 

end
######## Class Specs ########################################################

describe "a TaxonName adapter", :shared => true do

  it "should return a name" 


  it "should be valid (like all common names)" 


  it "should set the lexicon for 'Cabbage tree' to 'english'" 


  it "should set the lexicon for a scientific name" 


  it "should have a source" 


  it "should have a source identifier" 


  it "should have a source URL" 


  it "should set a taxon" 


  it "should have a name_provider set to '#{@np.class.name.split('::').last}" 


  it "should save like a TaxonName" 


  it "should be the same before and after saving" 


  # Note that this can depend on the name provider. For instance, Hyla
  # crucifer would NOT pass this test from uBio as of 2008-06-26
  it "should correctly fill in the is_valid field" 


  it "should always set is_valid to true for single sci names" 


  it "should have a working #to_json method" 


end
describe Ratatosk::NameProviders::NZORTaxonNameAdapter do
  fixtures :sources
  it_should_behave_like "a TaxonName adapter"

  before(:all) do
    @np = Ratatosk::NameProviders::NZORNameProvider.new
    @hxml = NewZealandOrganismsRegister.new.search(:query => 'Cabbage Tree').at('Results')
  end

  before(:each) do
    # make absolutely sure the db is empty
    [TaxonName.find_by_name('Cabbage Tree')].flatten.compact.each do |tn|
      tn.destroy
      tn.taxon.destroy if tn.taxon
    end

    @adapter = Ratatosk::NameProviders::NZORTaxonNameAdapter.new(@hxml)
  end
=begin
  #TODO do these
  it "should set the taxon of a valid sciname to have the same name" 


  it "should set the lexicon correctly for 'i'iwi" 

=end
end
describe Ratatosk::NameProviders::NZORNameProvider do
  it_should_behave_like "a name provider"

  before(:all) do
    @np = Ratatosk::NameProviders::NZORNameProvider.new
  end
end
describe Ratatosk::NameProviders::NZORTaxonAdapter do
  fixtures :sources
  it_should_behave_like "a Taxon adapter"

  before(:all) do
    @hxml = NewZealandOrganismsRegister.new.search(:query => 'Homo sapiens')
  end

  before(:each) do
    # make absolutely sure the db is empty
    [TaxonName.find(:all, :conditions => "name like 'Homo sapiens%'")].flatten.compact.each do |tn|
      # tn.taxon.destroy
      tn.destroy
    end

    [Taxon.find(:all, :conditions => "name like 'Homo sapiens%'")].flatten.compact.each do |t|
      t.destroy
    end

    @adapter = Ratatosk::NameProviders::NZORTaxonAdapter.new(@hxml)
  end
end

