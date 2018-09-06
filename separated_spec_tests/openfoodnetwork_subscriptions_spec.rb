require 'spec_helper'

feature 'Subscriptions' do
  include AuthenticationWorkflow
  include WebHelper

  context "as an enterprise user", js: true do
    let!(:user) { create_enterprise_user(enterprise_limit: 10) }
    let!(:shop) { create(:distributor_enterprise, owner: user, enable_subscriptions: true) }
    let!(:shop2) { create(:distributor_enterprise, owner: user, enable_subscriptions: true) }
    let!(:shop_unmanaged) { create(:distributor_enterprise, enable_subscriptions: true) }

    before { quick_login_as user }

    context 'listing subscriptions' do
      let!(:subscription) { create(:subscription, shop: shop, with_items: true, with_proxy_orders: true) }
      let!(:subscription2) { create(:subscription, shop: shop2, with_items: true, with_proxy_orders: true) }
      let!(:subscription_unmanaged) { create(:subscription, shop: shop_unmanaged, with_items: true, with_proxy_orders: true) }

      it "passes the smoke test" 

    end

    context 'creating a new subscription' do
      let(:address) { create(:address) }
      let!(:customer_user) { create(:user) }
      let!(:credit_card1) { create(:credit_card, user: customer_user, cc_type: 'visa', last_digits: 1111, month: 10, year: 2030) }
      let!(:credit_card2) { create(:credit_card, user: customer_user, cc_type: 'master', last_digits: 9999, month: 2, year: 2044) }
      let!(:credit_card3) { create(:credit_card, cc_type: 'visa', last_digits: 5555, month: 6, year: 2066) }
      let!(:customer) { create(:customer, enterprise: shop, bill_address: address, user: customer_user) }
      let!(:product1) { create(:product, supplier: shop) }
      let!(:product2) { create(:product, supplier: shop) }
      let!(:variant1) { create(:variant, product: product1, unit_value: '100', price: 12.00, option_values: []) }
      let!(:variant2) { create(:variant, product: product2, unit_value: '1000', price: 6.00, option_values: []) }
      let!(:enterprise_fee) { create(:enterprise_fee, amount: 1.75) }
      let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 2.days.from_now, orders_close_at: 7.days.from_now) }
      let!(:outgoing_exchange) { order_cycle.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant2], enterprise_fees: [enterprise_fee]) }
      let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
      let!(:payment_method) { create(:stripe_payment_method, name: 'Credit Card', distributors: [shop], preferred_enterprise_id: shop.id) }
      let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }

      it "passes the smoke test" 


      context 'editing an existing subscription' do
        let!(:customer) { create(:customer, enterprise: shop) }
        let!(:product1) { create(:product, supplier: shop) }
        let!(:product2) { create(:product, supplier: shop) }
        let!(:product3) { create(:product, supplier: shop) }
        let!(:variant1) { create(:variant, product: product1, unit_value: '100', price: 12.00, option_values: []) }
        let!(:variant2) { create(:variant, product: product2, unit_value: '1000', price: 6.00, option_values: []) }
        let!(:variant3) { create(:variant, product: product3, unit_value: '10000', price: 22.00, option_values: []) }
        let!(:enterprise_fee) { create(:enterprise_fee, amount: 1.75) }
        let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 2.days.from_now, orders_close_at: 7.days.from_now) }
        let!(:outgoing_exchange) { order_cycle.exchanges.create(sender: shop, receiver: shop, variants: [variant1, variant2], enterprise_fees: [enterprise_fee]) }
        let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
        let!(:variant3_oc) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 2.days.from_now, orders_close_at: 7.days.from_now) }
        let!(:variant3_ex) { variant3_oc.exchanges.create(sender: shop, receiver: shop, variants: [variant3]) }
        let!(:payment_method) { create(:payment_method, distributors: [shop]) }
        let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }
        let!(:subscription) {
          create(:subscription,
                 shop: shop,
                 customer: customer,
                 schedule: schedule,
                 payment_method: payment_method,
                 shipping_method: shipping_method,
                 subscription_line_items: [create(:subscription_line_item, variant: variant1, quantity: 2, price_estimate: 13.75)],
                 with_proxy_orders: true)
        }

        it "passes the smoke test" 


        context "with initialised order that has been changed" do
          let(:proxy_order) { subscription.proxy_orders.first }
          let(:order) { proxy_order.initialise_order! }
          let(:line_item) { order.line_items.first }

          before { line_item.update_attributes(quantity: 3) }

          it "reports issues encountered during the update" 

        end
      end
    end
  end
end

