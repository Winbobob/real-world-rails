require 'spec_helper'

feature %q{
    As a consumer
    I want to see a list of producers
    So that I can shop at hubs distributing their products
}, js: true do
  include WebHelper
  include UIComponentHelper

  let!(:producer1) { create(:supplier_enterprise) }
  let!(:producer2) { create(:supplier_enterprise) }
  let!(:invisible_producer) { create(:supplier_enterprise, visible: false) }

  let(:taxon_fruit) { create(:taxon, name: 'Fruit') }
  let(:taxon_veg) { create(:taxon, name: 'Vegetables') }

  let!(:product1) { create(:simple_product, supplier: producer1, taxons: [taxon_fruit]) }
  let!(:product2) { create(:simple_product, supplier: producer2, taxons: [taxon_veg]) }

  let(:shop) { create(:distributor_enterprise) }
  let!(:er) { create(:enterprise_relationship, parent: shop, child: producer1) }

  before do
    product1.set_property 'Organic', 'NASAA 12345'
    product2.set_property 'Biodynamic', 'ABC123'

    producer1.set_producer_property 'Local', 'Victoria'
    producer2.set_producer_property 'Fair Trade', 'FT123'
  end


  it "searches by URL" 


  context "on the producers page" do
    before do
      visit producers_path
    end

    it "filters by taxon" 


    describe "filtering by product property" do
      it "filters" 

    end

    it "shows all producers with expandable details" 


    it "doesn't show invisible producers" 


    it "links to places to buy produce" 

  end
end

