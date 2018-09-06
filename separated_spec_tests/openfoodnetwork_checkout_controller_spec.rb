require 'spec_helper'

describe CheckoutController, type: :controller do
  let(:distributor) { double(:distributor) }
  let(:order_cycle) { create(:simple_order_cycle) }
  let(:order) { create(:order) }
  let(:reset_order_service) { double(ResetOrderService) }

  before do
    order.stub(:checkout_allowed?).and_return true
    controller.stub(:check_authorization).and_return true
  end

  it "redirects home when no distributor is selected" 


  it "redirects to the shop when no order cycle is selected" 


  it "redirects home with message if hub is not ready for checkout" 


  it "redirects to the cart when some items are out of stock" 


  it "renders when both distributor and order cycle is selected" 


  describe "building the order" do
    before do
      controller.stub(:current_distributor).and_return(distributor)
      controller.stub(:current_order_cycle).and_return(order_cycle)
      controller.stub(:current_order).and_return(order)
    end

    it "does not clone the ship address from distributor when shipping method requires address" 


    it "clears the ship address when re-rendering edit" 


    it "clears the ship address when the order state cannot be advanced" 


    it "only clears the ship address with a pickup shipping method" 


    context 'when completing the order' do
      before do
        order.state = 'complete'
        allow(order).to receive(:update_attributes).and_return(true)
        allow(order).to receive(:next).and_return(true)
        allow(order).to receive(:set_distributor!).and_return(true)
      end

      it "sets the new order's token to the same as the old order" 


      it 'expires the current order' 


      it 'sets the access_token of the session' 

    end
  end

  describe '#expire_current_order' do
    it 'empties the order_id of the session' 


    it 'resets the @current_order ivar' 

  end

  context "via xhr" do
    before do
      controller.stub(:current_distributor).and_return(distributor)

      controller.stub(:current_order_cycle).and_return(order_cycle)
      controller.stub(:current_order).and_return(order)
    end

    it "returns errors" 


    it "returns flash" 


    it "returns order confirmation url on success" 


    describe "stale object handling" do
      it "retries when a stale object error is encountered" 


      it "tries a maximum of 3 times before giving up and returning an error" 

    end
  end

  describe "Paypal routing" do
    let(:payment_method) { create(:payment_method, type: "Spree::Gateway::PayPalExpress") }
    before do
      allow(controller).to receive(:current_distributor) { distributor }
      allow(controller).to receive(:current_order_cycle) { order_cycle }
      allow(controller).to receive(:current_order) { order }
      allow(controller).to receive(:restart_checkout)
    end

    it "should check the payment method for Paypalness if we've selected one" 

  end

  describe "#update_failed" do
    before do
      controller.instance_variable_set(:@order, order)
    end

    it "clears the shipping address and restarts the checkout" 

  end

  describe "#restart_checkout" do
    let!(:shipment_pending) { create(:shipment, order: order, state: 'pending') }
    let!(:payment_checkout) { create(:payment, order: order, state: 'checkout') }
    let!(:payment_failed) { create(:payment, order: order, state: 'failed') }

    before do
      order.update_attribute(:shipping_method_id, shipment_pending.shipping_method_id)
      controller.instance_variable_set(:@order, order.reload)
    end

    context "when the order is already in the 'cart' state" do
      it "does nothing" 

    end

    context "when the order is in a subsequent state" do
      before do
        order.update_attribute(:state, "payment")
      end

      # NOTE: at the time of writing, it was not possible to create a shipment with a state other than
      # 'pending' when the order has not been completed, so this is not a case that requires testing.
      it "resets the order state, and clears incomplete shipments and payments" 

    end
  end
end

