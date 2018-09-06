require File.dirname(__FILE__) + '/../spec_helper'

describe ListedTaxaController, "create" do
  render_views
  let(:user) { User.make! }
  let(:list) { List.make!(:user => user) }
  before(:each) { enable_elastic_indexing([ Observation, Taxon, Place ]) }
  after(:each) { disable_elastic_indexing([ Observation, Taxon, Place ]) }
  before do
    http_login(user)
  end

  it "should work" 


  describe "establishment means propagation" do
    let(:parent) { Place.make! }
    let(:place) { Place.make!(:parent => parent) }
    let(:child) { Place.make!(:parent => place) }
    let(:taxon) { Taxon.make! }
    let(:parent_listed_taxon) { parent.check_list.add_taxon(taxon) }
    let(:place_listed_taxon) { place.check_list.add_taxon(taxon) }
    let(:child_listed_taxon) { child.check_list.add_taxon(taxon) }
    it "should allow force_trickle_down_establishment_means for curators" 

    it "should not allow force_trickle_down_establishment_means for non-curators" 

  end
end

describe ListedTaxaController, "update" do
  describe "establishment means propagation" do
    let(:parent) { Place.make! }
    let(:place) { Place.make!(:parent => parent) }
    let(:child) { Place.make!(:parent => place) }
    let(:taxon) { Taxon.make! }
    let(:parent_listed_taxon) { parent.check_list.add_taxon(taxon) }
    let(:place_listed_taxon) { place.check_list.add_taxon(taxon) }
    let(:child_listed_taxon) { child.check_list.add_taxon(taxon) }
    it "should allow force_trickle_down_establishment_means for curators" 

    it "should not allow force_trickle_down_establishment_means for non-curators" 

  end
end

describe ListedTaxaController, "destroy" do
  it "should destroy" 

  it "should log listed_taxon_alterations if listed_taxa has_atlas_or_complete_set? on destroy" 

end

