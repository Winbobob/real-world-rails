require 'spec_helper'

describe CartController, type: :controller do
  let(:order) { create(:order) }

  describe "returning stock levels in JSON on success" do
    let(:product) { create(:simple_product) }

    it "returns stock levels as JSON" 


    describe "generating stock levels" do
      let!(:order) { create(:order) }
      let!(:li) { create(:line_item, order: order, variant: v, quantity: 2, max_quantity: 3) }
      let!(:v) { create(:variant, count_on_hand: 4) }
      let!(:v2) { create(:variant, count_on_hand: 2) }

      before do
        order.reload
        allow(controller).to receive(:current_order) { order }
      end

      it "returns a hash with variant id, quantity, max_quantity and stock on hand" 


      it "includes all line items, even when the variant_id is not specified" 


      it "includes an empty quantity entry for variants that aren't in the order" 


      describe "encoding Infinity" do
        let!(:v) { create(:variant, on_demand: true, count_on_hand: 0) }

        it "encodes Infinity as a large, finite integer" 

      end
    end

    it "extracts variant ids from the cart service" 

  end

  context "adding a group buy product to the cart" do
    it "sets a variant attribute for the max quantity" 


    it "returns HTTP success when successful" 


    it "returns failure when unsuccessful" 


    it "tells cart_service to overwrite" 

  end
end


