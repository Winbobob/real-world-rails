require File.dirname(__FILE__) + '/spec_helper'

describe Ratatosk::NameProviders::BugGuideNameProvider do
  let(:np) { Ratatosk::NameProviders::BugGuideNameProvider.new }
  it "should find a taxon" 


  it "should get a lineage including Insecta" 


  it "should set the phylum for everything to Arthropoda" 


  describe "get_lineage_for" do
    let(:t) { np.find('Apis mellifera').first.taxon }
    it "should have the target taxon as the first in the lineage" 

    it "should contain taxa that increase in rank_level" 

  end

  it "should graft" 


end

