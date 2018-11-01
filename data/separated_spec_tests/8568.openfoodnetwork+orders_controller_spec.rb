require 'spec_helper'

describe Spree::OrdersController, type: :controller do
  let(:distributor) { double(:distributor) }
  let(:order) { create(:order) }
  let(:order_cycle) { create(:simple_order_cycle) }

  describe "viewing an order" do
    let(:customer) { create(:customer) }
    let(:order) { create(:order_with_credit_payment, customer: customer, distributor: customer.enterprise) }

    before do
      allow(controller).to receive(:spree_current_user) { current_user }
    end

    context "after checking out as an anonymous guest" do
      let(:customer) { create(:customer, user: nil) }
      let(:current_user) { nil }

      it "loads page" 


      it "stores order token in session as 'access_token'" 

    end

    context "when returning to order page after checking out as an anonymous guest" do
      let(:customer) { create(:customer, user: nil) }
      let(:current_user) { nil }

      before do
        session[:access_token] = order.token
      end

      it "loads page" 

    end

    context "when logged in as the customer" do
      let(:current_user) { order.user }

      it "loads page" 

    end

    context "when logged in as another customer" do
      let(:current_user) { create(:user) }

      it "redirects to unauthorized" 

    end

    context "when neither checked out as an anonymous guest nor logged in" do
      let(:current_user) { nil }

      before do
        request.env["PATH_INFO"] = spree.order_path(order)
      end

      it "redirects to unauthorized" 

    end
  end

  describe "viewing cart" do
    it "redirects home when no distributor is selected" 


    it "redirects to shop when order is empty" 


    it "redirects to the shop when no order cycle is selected" 


    it "redirects home with message if hub is not ready for checkout" 


    describe "when an item has insufficient stock" do
      let(:order) { subject.current_order(true) }
      let(:oc) { create(:simple_order_cycle, distributors: [d], variants: [variant]) }
      let(:d) { create(:distributor_enterprise, shipping_methods: [create(:shipping_method)], payment_methods: [create(:payment_method)]) }
      let(:variant) { create(:variant, on_demand: false, on_hand: 5) }
      let(:line_item) { order.line_items.last }

      before do
        order.set_distribution! d, oc
        order.add_variant variant, 5
        variant.update_attributes! on_hand: 3
      end

      it "displays a flash message when we view the cart" 

    end
  end

  describe "removing line items from cart" do
    describe "when I pass params that includes a line item no longer in our cart" do
      it "should silently ignore the missing line item" 

    end

    it "filters line items that are missing from params" 

  end

  describe "removing items from a completed order" do
    context "with shipping and transaction fees" do
      let(:distributor) { create(:distributor_enterprise, charges_sales_tax: true, allow_order_changes: true) }
      let(:order) { create(:completed_order_with_fees, distributor: distributor, shipping_fee: shipping_fee, payment_fee: payment_fee) }
      let(:line_item1) { order.line_items.first }
      let(:line_item2) { order.line_items.second }
      let(:shipping_fee) { 3 }
      let(:payment_fee) { 5 }
      let(:item_num) { order.line_items.length }
      let(:expected_fees) { item_num * (shipping_fee + payment_fee) }
      let(:params) { { order: { line_items_attributes: {
        "0" => {id: line_item1.id, quantity: 1},
        "1" => {id: line_item2.id, quantity: 0}
      } } } }

      before do
        Spree::Config.shipment_inc_vat = true
        Spree::Config.shipping_tax_rate = 0.25

        # Sanity check the fees
        expect(order.adjustments.length).to eq 2
        expect(item_num).to eq 2
        expect(order.adjustment_total).to eq expected_fees
        expect(order.shipment.adjustment.included_tax).to eq 1.2

        allow(subject).to receive(:spree_current_user) { order.user }
        allow(subject).to receive(:order_to_update) { order }
      end

      it "updates the fees" 

    end

    context "with enterprise fees" do
      let(:user) { create(:user) }
      let(:variant) { create(:variant) }
      let(:distributor) { create(:distributor_enterprise, allow_order_changes: true) }
      let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor]) }
      let(:enterprise_fee) { create(:enterprise_fee, calculator: build(:calculator_per_item) ) }
      let!(:exchange) { create(:exchange, incoming: true, sender: variant.product.supplier, receiver: order_cycle.coordinator, variants: [variant], enterprise_fees: [enterprise_fee]) }
      let!(:order) do
        order = create(:completed_order_with_totals, user: user, distributor: distributor, order_cycle: order_cycle)
        order.reload.line_items.first.update_attributes(variant_id: variant.id)
        while !order.completed? do break unless order.next! end
        order.update_distribution_charge!
        order
      end
      let(:params) { { order: { line_items_attributes: {
        "0" => { id: order.line_items.first.id, quantity: 2 }
      } } } }

      before do
        allow(subject).to receive(:spree_current_user) { order.user }
        allow(subject).to receive(:order_to_update) { order }
      end

      it "updates the fees" 

    end
  end

  describe "removing items from a completed order" do
    let(:order) { create(:completed_order_with_totals) }
    let!(:line_item) { order.reload.line_items.first }
    let(:params) { { order: {} } }

    before { allow(subject).to receive(:order_to_update) { order } }

    context "when more than one item remains" do
      before do
        params[:order][:line_items_attributes] = { "0" => {quantity: "1", id: line_item.id} }
      end

      it "removes the item" 

    end

    context "when only one item remains" do
      before do
        params[:order][:line_items_attributes] = { "0" => {quantity: "0", id: line_item.id} }
      end

      it "does not remove the item, flash suggests cancellation" 

    end
  end

  describe "#order_to_update" do
    let!(:current_order) { double(:current_order) }
    let(:params) { { } }

    before do
      allow(controller).to receive(:current_order) { current_order }
      allow(controller).to receive(:params) { params }
    end

    context "when no order id is given in params" do
      it "returns the current_order" 

    end

    context "when an order_id is given in params" do
      before do
        params.merge!({id: order.number})
      end

      context "and the order is not complete" do
        let!(:order) { create(:order) }

        it "returns nil" 

      end

      context "and the order is complete" do
        let!(:order) { create(:completed_order_with_totals) }

        context "and the user doesn't have permisson to 'update' the order" do
          before { allow(controller).to receive(:can?).with(:update, order) { false } }

          it "returns nil" 

        end

        context "and the user has permission to 'update' the order" do
          before { allow(controller).to receive(:can?).with(:update, order) { true } }

          context "and the order is not editable" do

            it "returns nil" 

          end

          context "and the order is editable" do
            let(:distributor) { create(:enterprise, allow_order_changes: true) }
            let(:order_cycle) do
              create(
                :simple_order_cycle,
                distributors: [distributor],
                variants: order.line_item_variants
              )
            end

            before do
              order.update_attributes!(order_cycle_id: order_cycle.id, distributor_id: distributor.id)
            end

            it "returns the order" 

          end
        end
      end
    end
  end

  describe "cancelling an order" do
    let(:user) { create(:user) }
    let(:order) { create(:order, user: user) }
    let(:params) { { id: order.number } }

    context "when the user does not have permission to cancel the order" do
      it "responds with unauthorized" 

    end

    context "when the user has permission to cancel the order" do
      before { allow(controller).to receive(:spree_current_user) { user } }

      context "when the order is not yet complete" do
        it "responds with forbidden" 

      end

      context "when the order is complete" do
        let(:order) { create(:completed_order_with_totals, user: user) }

        before do
          Spree::MailMethod.create!(
            environment: Rails.env,
            preferred_mails_from: 'spree@example.com'
          )
        end

        it "responds with success" 

      end
    end
  end


  private

  def num_items_in_cart
    Spree::Order.last.andand.line_items.andand.count || 0
  end
end

