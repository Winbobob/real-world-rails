require 'spec_helper'

describe EnterprisesController, type: :controller do
  describe "shopping for a distributor" do
    let(:order) { controller.current_order(true) }


    let!(:current_distributor) { create(:distributor_enterprise, with_payment_and_shipping: true) }
    let!(:distributor) { create(:distributor_enterprise, with_payment_and_shipping: true) }
    let!(:order_cycle1) { create(:simple_order_cycle, distributors: [distributor], orders_open_at: 2.days.ago, orders_close_at: 3.days.from_now ) }
    let!(:order_cycle2) { create(:simple_order_cycle, distributors: [distributor], orders_open_at: 3.days.ago, orders_close_at: 4.days.from_now ) }

    before do
      order.set_distributor! current_distributor
    end

    it "sets the shop as the distributor on the order when shopping for the distributor" 


    it "sorts order cycles by the distributor's preferred ordering attr" 


    context "using FilterOrderCycles tag rules" do
      let(:user) { create(:user) }
      let!(:order_cycle3) { create(:simple_order_cycle, distributors: [distributor], orders_open_at: 3.days.ago, orders_close_at: 4.days.from_now) }
      let!(:oc3_exchange) { order_cycle3.exchanges.outgoing.to_enterprise(distributor).first }
      let(:customer) { create(:customer, user: user, enterprise: distributor) }

      it "shows order cycles allowed by the rules" 

    end

    it "empties an order that was set for a previous distributor, when shopping at a new distributor" 


    it "should not empty an order if returning to the same distributor" 


    describe "when an out of stock item is in the cart" do
      let(:variant) { create(:variant, on_demand: false, on_hand: 10) }
      let(:line_item) { create(:line_item, variant: variant) }
      let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], variants: [variant]) }

      before do
        order.set_distribution! current_distributor, order_cycle
        order.line_items << line_item

        variant.on_hand = 0
        variant.save!
      end

      it "redirects to the cart" 

    end

    it "sets order cycle if only one is available at the chosen distributor" 

  end

  context "checking permalink availability" do
    # let(:enterprise) { create(:enterprise, permalink: 'enterprise_permalink') }

    it "responds with status of 200 when the route does not exist" 


    it "responds with status of 409 when the permalink matches an existing route" 

  end
end

