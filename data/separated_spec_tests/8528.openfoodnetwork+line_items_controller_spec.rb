require 'spec_helper'

describe LineItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:distributor) { create(:distributor_enterprise) }
  let(:order_cycle) { create(:simple_order_cycle) }

  context "listing bought items" do
    let!(:completed_order) do
      order = create(:completed_order_with_totals, user: user, distributor: distributor, order_cycle: order_cycle)
      while !order.completed? do break unless order.next! end
      order
    end

    before do
      controller.stub spree_current_user: user
      controller.stub current_order_cycle: order_cycle
      controller.stub current_distributor: distributor
    end

    it "lists items bought by the user from the same shop in the same order_cycle" 

  end

  describe "destroying a line item" do
    context "on a completed order" do
      let(:item) do
        order = create(:completed_order_with_totals)
        item = create(:line_item, order: order)
        while !order.completed? do break unless order.next! end
        item
      end

      let(:order) { item.order }
      let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], variants: [order.line_item_variants]) }

      before { controller.stub spree_current_user: item.order.user }

      context "without a line item id" do
        it "fails and raises an error" 

      end

      context "with a line item id" do
        let(:params) { { format: :json, id: item } }

        context "where the item's order is not associated with the user" do
          it "denies deletion" 

        end

        context "where the item's order is associated with the current user" do
          before { order.update_attributes!(user_id: user.id) }

          context "without an order cycle or distributor" do
            it "denies deletion" 

          end

          context "with an order cycle and distributor" do
            before { order.update_attributes!(order_cycle_id: order_cycle.id, distributor_id: distributor.id) }

            context "where changes are not allowed" do
              it "denies deletion" 

            end

            context "where changes are allowed" do
              before { distributor.update_attributes!(allow_order_changes: true) }

              it "deletes the line item" 

            end
          end
        end
      end
    end

    context "on a completed order with shipping and payment fees" do
      let(:distributor) { create(:distributor_enterprise, charges_sales_tax: true, allow_order_changes: true) }
      let(:shipping_fee) { 3 }
      let(:payment_fee) { 5 }
      let(:order) { create(:completed_order_with_fees, distributor: distributor, shipping_fee: shipping_fee, payment_fee: payment_fee) }

      before do
        Spree::Config.shipment_inc_vat = true
        Spree::Config.shipping_tax_rate = 0.25
      end

      it "updates the fees" 

    end

    context "on a completed order with enterprise fees" do
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
      let(:params) { { format: :json, id: order.line_items.first } }

      it "updates the fees" 

    end
  end
end

