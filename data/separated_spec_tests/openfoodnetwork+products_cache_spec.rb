require 'open_food_network/products_cache'

module OpenFoodNetwork
  describe ProductsCache do
    describe "when a variant changes" do
      let(:variant) { create(:variant) }
      let(:variant_undistributed) { create(:variant) }
      let(:supplier) { create(:supplier_enterprise) }
      let(:coordinator) { create(:distributor_enterprise) }
      let(:distributor) { create(:distributor_enterprise) }
      let(:oc_undated) { create(:undated_order_cycle, distributors: [distributor], variants: [variant]) }
      let(:oc_upcoming) { create(:upcoming_order_cycle, suppliers: [supplier], coordinator: coordinator, distributors: [distributor], variants: [variant]) }
      let(:oc_open) { create(:open_order_cycle, distributors: [distributor], variants: [variant]) }
      let(:oc_closed) { create(:closed_order_cycle, distributors: [distributor], variants: [variant]) }

      it "refreshes distributions with upcoming order cycles" 


      it "refreshes distributions with open order cycles" 


      it "does not refresh distributions with undated order cycles" 


      it "does not refresh distributions with closed order cycles" 


      it "limits refresh to outgoing exchanges" 


      it "does not refresh distributions where the variant does not appear" 

    end

    describe "when a variant is destroyed" do
      let(:variant) { create(:variant) }
      let(:distributor) { create(:distributor_enterprise) }
      let!(:oc) { create(:open_order_cycle, distributors: [distributor], variants: [variant]) }

      it "refreshes the cache based on exchanges the variant was in before destruction" 


      it "performs the cache refresh after the variant has been destroyed" 

    end

    describe "when a product changes" do
      let(:product) { create(:simple_product) }
      let(:v1) { create(:variant, product: product) }
      let(:v2) { create(:variant, product: product) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let(:oc) { create(:open_order_cycle) }
      let!(:ex1) { create(:exchange, order_cycle: oc, sender: oc.coordinator, receiver: d1, variants: [v1]) }
      let!(:ex2) { create(:exchange, order_cycle: oc, sender: oc.coordinator, receiver: d2, variants: [v1, v2]) }

      before { product.reload }

      it "refreshes the distribution each variant appears in, once each" 

    end

    describe "when a product is deleted" do
      let(:product) { create(:simple_product) }
      let(:variant) { create(:variant, product: product) }
      let(:distributor) { create(:distributor_enterprise) }
      let!(:oc) { create(:open_order_cycle, distributors: [distributor], variants: [variant]) }

      it "refreshes the cache based on exchanges the variant was in before destruction" 


      it "performs the cache refresh after the product has been removed from the order cycle" 

    end

    describe "when a variant override changes" do
      let(:variant) { create(:variant) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let!(:vo) { create(:variant_override, variant: variant, hub: d1) }
      let!(:oc) { create(:open_order_cycle, distributors: [d1, d2], variants: [variant]) }

      it "refreshes the distributions that the variant override affects" 


      it "does not refresh other distributors of the variant" 

    end


    describe "when a variant override is destroyed" do
      let(:vo) { double(:variant_override) }

      it "performs the same refresh as a variant override change" 

    end


    describe "when a producer property is changed" do
      let(:s) { create(:supplier_enterprise) }
      let(:pp) { s.producer_properties.last }
      let(:product) { create(:simple_product, supplier: s) }
      let(:v1) { create(:variant, product: product) }
      let(:v2) { create(:variant, product: product) }
      let(:v_deleted) { create(:variant, product: product, deleted_at: Time.now) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let(:d3) { create(:distributor_enterprise) }
      let(:oc) { create(:open_order_cycle) }
      let!(:ex1) { create(:exchange, order_cycle: oc, sender: oc.coordinator, receiver: d1, variants: [v1]) }
      let!(:ex2) { create(:exchange, order_cycle: oc, sender: oc.coordinator, receiver: d2, variants: [v1, v2]) }
      let!(:ex3) { create(:exchange, order_cycle: oc, sender: oc.coordinator, receiver: d3, variants: [product.master, v_deleted]) }

      before do
        s.set_producer_property :organic, 'NASAA 12345'
      end

      it "refreshes the distributions the supplied variants appear in" 


      it "doesn't respond to master or deleted variants" 

    end


    describe "when a producer property is destroyed" do
      let(:producer_property) { double(:producer_property) }

      it "triggers the same update as a change to the producer property" 

    end


    describe "when an order cycle is changed" do
      let(:variant) { create(:variant) }
      let(:s) { create(:supplier_enterprise) }
      let(:c) { create(:distributor_enterprise) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let!(:oc_open) { create(:open_order_cycle, suppliers: [s], coordinator: c, distributors: [d1, d2], variants: [variant]) }
      let!(:oc_upcoming) { create(:upcoming_order_cycle, suppliers: [s], coordinator: c, distributors: [d1, d2], variants: [variant]) }

      before do
        oc_open.reload
        oc_upcoming.reload
      end

      it "updates each outgoing distribution in an upcoming order cycle" 


      it "updates each outgoing distribution in an open order cycle" 


      it "does nothing when the order cycle has been made undated" 


      it "does nothing when the order cycle has been closed" 


      it "does not update incoming exchanges" 

    end


    describe "when an exchange is changed" do
      let(:s) { create(:supplier_enterprise) }
      let(:c) { create(:distributor_enterprise) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let(:v) { create(:variant) }
      let(:oc) { create(:open_order_cycle, coordinator: c) }

      describe "incoming exchanges" do
        let!(:ex1) { create(:exchange, order_cycle: oc, sender: s, receiver: c, incoming: true, variants: [v]) }
        let!(:ex2) { create(:exchange, order_cycle: oc, sender: c, receiver: d1, incoming: false, variants: [v]) }
        let!(:ex3) { create(:exchange, order_cycle: oc, sender: c, receiver: d2, incoming: false, variants: []) }

        before { oc.reload }

        it "updates distributions that include one of the supplier's variants" 


        it "doesn't update distributions that don't include any of the supplier's variants" 

      end

      describe "outgoing exchanges" do
        let!(:ex) { create(:exchange, order_cycle: oc, sender: c, receiver: d1, incoming: false) }

        it "does not update for undated order cycles" 


        it "updates for upcoming order cycles" 


        it "updates for open order cycles" 


        it "does not update for closed order cycles" 

      end
    end


    describe "when an exchange is destroyed" do
      let(:exchange) { double(:exchange) }

      it "triggers the same update as a change to the exchange" 

    end


    describe "when an enterprise fee is changed" do
      let(:s) { create(:supplier_enterprise) }
      let(:c) { create(:distributor_enterprise) }
      let(:d1) { create(:distributor_enterprise) }
      let(:d2) { create(:distributor_enterprise) }
      let(:ef) { create(:enterprise_fee) }
      let(:ef_coord) { create(:enterprise_fee, order_cycles: [oc]) }
      let(:oc) { create(:open_order_cycle, coordinator: c) }


      describe "updating exchanges when it's a supplier fee" do
        let(:v) { create(:variant) }
        let!(:ex1) { create(:exchange, order_cycle: oc, sender: s, receiver: c, incoming: true, variants: [v], enterprise_fees: [ef]) }
        let!(:ex2) { create(:exchange, order_cycle: oc, sender: c, receiver: d1, incoming: false, variants: [v]) }
        let!(:ex3) { create(:exchange, order_cycle: oc, sender: c, receiver: d2, incoming: false, variants: []) }

        before { ef.reload }

        describe "updating distributions that include one of the supplier's variants" do
          it "does not update undated order cycles" 


          it "updates upcoming order cycles" 


          it "updates open order cycles" 


          it "does not update closed order cycles" 

        end

        it "doesn't update distributions that don't include any of the supplier's variants" 

      end


      it "updates order cycles when it's a coordinator fee" 



      describe "updating exchanges when it's a distributor fee" do
        let(:ex0) { create(:exchange, order_cycle: oc, sender: s, receiver: c, incoming: true, enterprise_fees: [ef]) }
        let(:ex1) { create(:exchange, order_cycle: oc, sender: c, receiver: d1, incoming: false, enterprise_fees: [ef]) }
        let(:ex2) { create(:exchange, order_cycle: oc, sender: c, receiver: d2, incoming: false, enterprise_fees: []) }

        describe "updating distributions that include the fee" do
          it "does not update undated order cycles" 


          it "updates upcoming order cycles" 


          it "updates open order cycles" 


          it "does not update closed order cycles" 

        end

        it "doesn't update exchanges that don't include the fee" 


        it "doesn't update incoming exchanges" 

      end
    end

    describe "when a distributor enterprise is changed" do
      let(:d) { create(:distributor_enterprise) }
      let(:oc) { create(:open_order_cycle, distributors: [d]) }

      it "updates each distribution the enterprise is active in" 

    end

    describe "when an inventory item is changed" do
      let!(:d) { create(:distributor_enterprise) }
      let!(:v) { create(:variant) }
      let!(:oc1) { create(:open_order_cycle, distributors: [d], variants: [v]) }
      let(:oc2) { create(:open_order_cycle, distributors: [d], variants: []) }
      let!(:ii) { create(:inventory_item, enterprise: d, variant: v) }

      it "updates each distribution for that enterprise+variant" 


      it "doesn't update distributions that don't feature the variant" 

    end

    describe "refreshing the cache" do
      let(:distributor) { double(:distributor) }
      let(:order_cycle) { double(:order_cycle) }

      it "notifies ProductsCacheRefreshment" 

    end
  end
end

