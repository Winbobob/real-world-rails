describe OrderSyncer do
  describe "updating the shipping method" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:order) { subscription.proxy_orders.first.initialise_order! }
    let(:shipping_method) { subscription.shipping_method }
    let(:new_shipping_method) { create(:shipping_method, distributors: [subscription.shop]) }
    let(:syncer) { OrderSyncer.new(subscription) }

    context "when the shipping method on an order is the same as the subscription" do
      let(:params) { { shipping_method_id: new_shipping_method.id } }

      it "updates the shipping_method on the order and on shipments" 

    end

    context "when the shipping method on a shipment is not the same as the original shipping method on the subscription" do
      let(:params) { { shipping_method_id: new_shipping_method.id } }

      context "when the shipping method on a shipment is the same as the new shipping method on the subscription" do
        before do
          # Updating the shipping method on a shipment updates the shipping method on the order,
          # and vice-versa via logic in Spree's shipments controller. So updating both here mimics that
          # behaviour.
          order.shipments.first.update_attributes(shipping_method_id: new_shipping_method.id)
          order.update_attributes(shipping_method_id: new_shipping_method.id)
          subscription.assign_attributes(params)
          expect(syncer.sync!).to be true
        end

        it "does not update the shipping_method on the subscription or on the pre-altered shipment" 

      end

      context "when the shipping method on a shipment is not the same as the new shipping method on the subscription" do
        let(:changed_shipping_method) { create(:shipping_method) }

        before do
          # Updating the shipping method on a shipment updates the shipping method on the order,
          # and vice-versa via logic in Spree's shipments controller. So updating both here mimics that
          # behaviour.
          order.shipments.first.update_attributes(shipping_method_id: changed_shipping_method.id)
          order.update_attributes(shipping_method_id: changed_shipping_method.id)
          subscription.assign_attributes(params)
          expect(syncer.sync!).to be true
        end

        it "does not update the shipping_method on the subscription or on the pre-altered shipment" 

      end
    end
  end

  describe "changing the payment method" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:order) { subscription.proxy_orders.first.initialise_order! }
    let(:payment_method) { subscription.payment_method }
    let(:new_payment_method) { create(:payment_method, distributors: [subscription.shop]) }
    let(:invalid_payment_method) { create(:payment_method, distributors: [create(:enterprise)]) }
    let(:bogus_payment_method) { create(:bogus_payment_method, distributors: [subscription.shop]) }
    let(:syncer) { OrderSyncer.new(subscription) }

    context "when the payment method on an order is the same as the subscription" do
      let(:params) { { payment_method_id: new_payment_method.id } }

      it "voids existing payments and creates a new payment with the relevant payment method" 

    end

    context "when the payment method on a payment is not the same as the subscription" do
      let(:params) { { payment_method_id: new_payment_method.id } }

      context "when the payment method on a payment is the same as the original payment method on the subscription" do
        before do
          order.payments.first.update_attribute(:payment_method_id, new_payment_method.id)
          subscription.assign_attributes(params)
          expect(syncer.sync!).to be true
        end

        it "keeps pre-altered payments and doesn't add an issue to order_update_issues" 

      end

      context "when the payment method on a shipment is not the same as the original payment method on the subscription" do
        let(:changed_payment_method) { create(:payment_method) }

        before do
          order.payments.first.update_attribute(:payment_method_id, changed_payment_method.id)
          subscription.assign_attributes(params)
          expect(syncer.sync!).to be true
        end

        it "keeps pre-altered payments and adds an issue to order_update_issues" 

      end
    end
  end

  describe "changing the billing address" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:shipping_method) { subscription.shipping_method }
    let!(:order) { subscription.proxy_orders.first.initialise_order! }
    let!(:bill_address_attrs) { subscription.bill_address.attributes }
    let!(:ship_address_attrs) { subscription.ship_address.attributes }
    let(:params) { { bill_address_attributes: { id: bill_address_attrs["id"], firstname: "Bill", address1: "123 abc st", phone: "1123581321" } } }
    let(:syncer) { OrderSyncer.new(subscription) }

    context "when a ship address is not required" do
      before { shipping_method.update_attributes(require_ship_address: false) }

      context "when the bill_address on the order matches that on the subscription" do
        it "updates all bill_address attrs and ship_address names + phone" 

      end

      context "when the bill_address on the order doesn't match that on the subscription" do
        before { order.bill_address.update_attributes(firstname: "Jane") }
        it "does not update bill_address or ship_address on the order" 

      end
    end

    context "when a ship address is required" do
      before { shipping_method.update_attributes(require_ship_address: true) }

      context "when the bill_address on the order matches that on the subscription" do
        it "only updates bill_address attrs" 

      end

      context "when the bill_address on the order doesn't match that on the subscription" do
        before { order.bill_address.update_attributes(firstname: "Jane") }

        it "does not update bill_address or ship_address on the order" 

      end
    end
  end

  describe "changing the ship address" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:shipping_method) { subscription.shipping_method }
    let!(:order) { subscription.proxy_orders.first.initialise_order! }
    let!(:bill_address_attrs) { subscription.bill_address.attributes }
    let!(:ship_address_attrs) { subscription.ship_address.attributes }
    let(:params) { { ship_address_attributes: { id: ship_address_attrs["id"], firstname: "Ship", address1: "123 abc st", phone: "1123581321" } } }
    let(:syncer) { OrderSyncer.new(subscription) }

    context "when a ship address is not required" do
      before { shipping_method.update_attributes(require_ship_address: false) }

      it "does not change the ship address" 


      context "but the shipping method is being changed to one that requires a ship_address" do
        let(:new_shipping_method) { create(:shipping_method, require_ship_address: true) }
        before { params.merge!(shipping_method_id: new_shipping_method.id) }

        it "updates ship_address attrs" 

      end
    end

    context "when a ship address is required" do
      before { shipping_method.update_attributes(require_ship_address: true) }

      context "when the ship address on the order matches that on the subscription" do
        it "updates ship_address attrs" 

      end

      context "when the ship address on the order doesn't match that on the subscription" do
        before { order.ship_address.update_attributes(firstname: "Jane") }
        it "does not update ship_address on the order" 

      end
    end
  end

  describe "changing the quantity of a line item" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:order) { subscription.proxy_orders.first.initialise_order! }
    let(:sli) { subscription.subscription_line_items.first }
    let(:variant) { sli.variant }

    before { variant.update_attribute(:count_on_hand, 2) }

    context "when quantity is within available stock" do
      let(:params) { { subscription_line_items_attributes: [{ id: sli.id, quantity: 2}] } }
      let(:syncer) { OrderSyncer.new(subscription) }

      it "updates the line_item quantities and totals on all orders" 

    end

    context "when quantity is greater than available stock" do
      let(:params) { { subscription_line_items_attributes: [{ id: sli.id, quantity: 3}] } }
      let(:syncer) { OrderSyncer.new(subscription) }

      it "updates the line_item quantities and totals on all orders" 

    end

    context "where the quantity of the item on an initialised order has already been changed" do
      let(:params) { { subscription_line_items_attributes: [{ id: sli.id, quantity: 3}] } }
      let(:syncer) { OrderSyncer.new(subscription) }
      let(:changed_line_item) { order.line_items.find_by_variant_id(sli.variant_id) }

      before { variant.update_attribute(:count_on_hand, 3) }

      context "when the changed line_item quantity matches the new quantity on the subscription line item" do
        before { changed_line_item.update_attributes(quantity: 3) }

        it "does not change the quantity, and doesn't add the order to order_update_issues" 

      end

      context "when the changed line_item quantity doesn't match the new quantity on the subscription line item" do
        before { changed_line_item.update_attributes(quantity: 2) }

        it "does not change the quantity, and adds the order to order_update_issues" 

      end
    end
  end

  describe "adding a new line item" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:order) { subscription.proxy_orders.first.initialise_order! }
    let(:variant) { create(:variant) }
    let(:params) { { subscription_line_items_attributes: [{ id: nil, variant_id: variant.id, quantity: 1}] } }
    let(:syncer) { OrderSyncer.new(subscription) }

    it "adds the line item and updates the total on all orders" 

  end

  describe "removing an existing line item" do
    let(:subscription) { create(:subscription, with_items: true, with_proxy_orders: true) }
    let(:order) { subscription.proxy_orders.first.initialise_order! }
    let(:sli) { subscription.subscription_line_items.first }
    let(:variant) { sli.variant }
    let(:params) { { subscription_line_items_attributes: [{ id: sli.id, _destroy: true }] } }
    let(:syncer) { OrderSyncer.new(subscription) }

    it "removes the line item and updates totals on all orders" 

  end
end

