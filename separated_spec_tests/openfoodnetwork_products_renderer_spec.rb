require 'spec_helper'
require 'open_food_network/products_renderer'

module OpenFoodNetwork
  describe ProductsRenderer do
    let(:distributor) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor]) }
    let(:exchange) { order_cycle.exchanges.to_enterprises(distributor).outgoing.first }
    let(:pr) { ProductsRenderer.new(distributor, order_cycle) }

    describe "sorting" do
      let(:t1) { create(:taxon) }
      let(:t2) { create(:taxon) }
      let!(:p1) { create(:product, name: "abc", primary_taxon_id: t2.id) }
      let!(:p2) { create(:product, name: "def", primary_taxon_id: t1.id) }
      let!(:p3) { create(:product, name: "ghi", primary_taxon_id: t2.id) }
      let!(:p4) { create(:product, name: "jkl", primary_taxon_id: t1.id) }

      before do
        exchange.variants << p1.variants.first
        exchange.variants << p2.variants.first
        exchange.variants << p3.variants.first
        exchange.variants << p4.variants.first
      end

      it "sorts products by the distributor's preferred taxon list" 


      it "alphabetizes products by name when taxon list is not set" 

    end

    context "JSON tests" do
      let(:product) { create(:product) }
      let(:variant) { product.variants.first }

      before do
        exchange.variants << variant
      end

      it "only returns products for the current order cycle" 


      it "doesn't return products not in stock" 


      it "strips html from description" 


      it "returns price including fees" 


      it "includes the primary taxon" 


      it "loads tag_list for variants" 

    end

    describe "loading variants" do
      let(:hub) { create(:distributor_enterprise) }
      let(:oc) { create(:simple_order_cycle, distributors: [hub], variants: [v1, v3, v4]) }
      let(:p) { create(:simple_product) }
      let!(:v1) { create(:variant, product: p, unit_value: 3) } # In exchange, not in inventory (ie. not_hidden)
      let!(:v2) { create(:variant, product: p, unit_value: 5) } # Not in exchange
      let!(:v3) { create(:variant, product: p, unit_value: 7, inventory_items: [create(:inventory_item, enterprise: hub, visible: true)]) }
      let!(:v4) { create(:variant, product: p, unit_value: 9, inventory_items: [create(:inventory_item, enterprise: hub, visible: false)]) }
      let(:pr) { ProductsRenderer.new(hub, oc) }
      let(:variants) { pr.send(:variants_for_shop_by_id) }

      it "scopes variants to distribution" 


      it "does not render variants that have been hidden by the hub" 


      context "when hub opts to only see variants in its inventory" do
        before do
          allow(hub).to receive(:prefers_product_selection_from_inventory_only?) { true }
        end

        it "does not render variants that have not been explicitly added to the inventory for the hub" 

      end
    end
  end
end

