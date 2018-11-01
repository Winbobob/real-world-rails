describe SubscriptionForm do
  describe "creating a new subscription" do
    let!(:shop) { create(:distributor_enterprise) }
    let!(:customer) { create(:customer, enterprise: shop) }
    let!(:product1) { create(:product, supplier: shop) }
    let!(:product2) { create(:product, supplier: shop) }
    let!(:product3) { create(:product, supplier: shop) }
    let!(:variant1) { create(:variant, product: product1, unit_value: '100', price: 12.00, option_values: []) }
    let!(:variant2) { create(:variant, product: product2, unit_value: '1000', price: 6.00, option_values: []) }
    let!(:variant3) { create(:variant, product: product2, unit_value: '1000', price: 2.50, option_values: [], count_on_hand: 1) }
    let!(:enterprise_fee) { create(:enterprise_fee, amount: 1.75) }
    let!(:order_cycle1) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 9.days.ago, orders_close_at: 2.days.ago) }
    let!(:order_cycle2) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 2.days.ago, orders_close_at: 5.days.from_now) }
    let!(:order_cycle3) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 5.days.from_now, orders_close_at: 12.days.from_now) }
    let!(:order_cycle4) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 12.days.from_now, orders_close_at: 19.days.from_now) }
    let!(:outgoing_exchange1) { order_cycle1.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant2, variant3], enterprise_fees: [enterprise_fee]) }
    let!(:outgoing_exchange2) { order_cycle2.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant2, variant3], enterprise_fees: [enterprise_fee]) }
    let!(:outgoing_exchange3) { order_cycle3.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant3], enterprise_fees: []) }
    let!(:outgoing_exchange4) { order_cycle4.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant2, variant3], enterprise_fees: [enterprise_fee]) }
    let!(:schedule) { create(:schedule, order_cycles: [order_cycle1, order_cycle2, order_cycle3, order_cycle4]) }
    let!(:payment_method) { create(:payment_method, distributors: [shop]) }
    let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }
    let!(:address) { create(:address) }
    let(:subscription) { Subscription.new }

    let!(:params) {
      {
        shop_id: shop.id,
        customer_id: customer.id,
        schedule_id: schedule.id,
        bill_address_attributes: address.clone.attributes,
        ship_address_attributes: address.clone.attributes,
        payment_method_id: payment_method.id,
        shipping_method_id: shipping_method.id,
        begins_at: 4.days.ago,
        ends_at: 14.days.from_now,
        subscription_line_items_attributes: [
          {variant_id: variant1.id, quantity: 1, price_estimate: 7.0},
          {variant_id: variant2.id, quantity: 2, price_estimate: 8.0},
          {variant_id: variant3.id, quantity: 3, price_estimate: 9.0}
        ]
      } }

    let(:form) { SubscriptionForm.new(subscription, params) }

    it "creates orders for each order cycle in the schedule" 

  end
end

