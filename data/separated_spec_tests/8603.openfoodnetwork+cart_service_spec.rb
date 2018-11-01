require 'spec_helper'

describe CartService do
  let(:order) { double(:order, id: 123) }
  let(:currency) { double(:currency) }
  let(:params) { {} }
  let(:distributor) { double(:distributor) }
  let(:order_cycle) { double(:order_cycle) }
  let(:cart_service) { CartService.new(order) }

  before do
    allow(order).to receive(:currency).and_return( currency )
  end

  context "end-to-end" do
    let(:order) { create(:order, distributor: distributor, order_cycle: order_cycle) }
    let(:distributor) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], variants: [v]) }
    let(:cart_service) { CartService.new(order) }
    let(:v) { create(:variant) }

    describe "populate" do
      it "adds a variant" 


      it "updates a variant's quantity, max quantity and final_weight_volume" 


      it "removes a variant" 

    end
  end

  describe "populate" do
    before do
      expect(cart_service).to receive(:distributor_and_order_cycle).
        and_return([distributor, order_cycle])
    end

    it "checks that distribution can supply all products in the cart" 


    it "locks the order" 


    it "attempts cart add with max_quantity" 

  end

  describe "varies_from_cart" do
    let(:variant) { double(:variant, id: 123) }

    it "returns true when item is not in cart and a quantity is specified" 


    it "returns true when item is not in cart and a max_quantity is specified" 


    it "returns false when item is not in cart and no quantity or max_quantity are specified" 


    it "returns true when quantity varies" 


    it "returns true when max_quantity varies" 


    it "returns false when max_quantity varies only in nil vs 0" 


    it "returns false when both are specified and neither varies" 

  end

  describe "variants_removed" do
    it "returns the variant ids when one is in the cart but not in those given" 


    it "returns nothing when all items in the cart are provided" 


    it "returns nothing when items are added to cart" 


    it "does not return duplicates" 

  end

  describe "attempt_cart_add" do
    let(:variant) { double(:variant, on_hand: 250) }
    let(:quantity) { 123 }

    before do
      allow(Spree::Variant).to receive(:find).and_return(variant)
      allow(VariantOverride).to receive(:for).and_return(nil)
    end

    it "performs additional validations" 


    it "filters quantities through #quantities_to_add" 


    it "removes variants which have become out of stock" 

  end

  describe "quantities_to_add" do
    let(:v) { double(:variant, on_hand: 10) }

    context "when backorders are not allowed" do
      context "when max_quantity is not provided" do
        it "returns full amount when available" 


        it "returns a limited amount when not entirely available" 

      end

      context "when max_quantity is provided" do
        it "returns full amount when available" 


        it "also returns the full amount when not entirely available" 

      end
    end

    context "when backorders are allowed" do
      before do
        Spree::Config.allow_backorders = true
      end

      it "does not limit quantity" 


      it "does not limit max_quantity" 

    end
  end

  describe "validations" do
    describe "determining if distributor can supply products in cart" do
      it "delegates to DistributionChangeValidator" 

    end

    describe "checking order cycle is provided for a variant, OR is not needed" do
      let(:variant) { double(:variant) }

      it "returns false and errors when order cycle is not provided and is required" 

      it "returns true when order cycle is provided" 

      it "returns true when order cycle is not required" 

    end

    describe "checking variant is available under the distributor" do
      let(:product) { double(:product) }
      let(:variant) { double(:variant, product: product) }

      it "delegates to DistributionChangeValidator, returning true when available" 


      it "delegates to DistributionChangeValidator, returning false and erroring otherwise" 

    end
  end


  describe "support" do
    describe "checking if order cycle is required for a variant" do
      it "requires an order cycle when the product has no product distributions" 


      it "does not require an order cycle when the product has product distributions" 

    end

    it "provides the distributor and order cycle for the order" 

  end
end

