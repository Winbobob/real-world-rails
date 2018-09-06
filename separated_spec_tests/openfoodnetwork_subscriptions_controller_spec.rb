require 'spec_helper'

describe Admin::SubscriptionsController, type: :controller do
  include AuthenticationWorkflow

  describe 'index' do
    let!(:user) { create(:user, enterprise_limit: 10) }
    let!(:shop) { create(:distributor_enterprise, enable_subscriptions: true) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    context 'html' do
      let(:params) { { format: :html } }

      context 'as a regular user' do
        it 'redirects to unauthorized' 

      end

      context 'as an enterprise user' do
        before { shop.update_attributes(owner: user) }
        let!(:not_enabled_shop) { create(:distributor_enterprise, owner: user) }

        context "where I manage a shop that is set up for subscriptions" do
          let!(:subscription) { create(:subscription, shop: shop) }

          it 'renders the index page with appropriate data' 

        end

        context "where I don't manage a shop that is set up for subscriptions" do
          it 'renders the setup_explanation page' 

        end
      end
    end

    context 'json' do
      let(:params) { { format: :json } }
      let!(:subscription) { create(:subscription, shop: shop) }

      context 'as a regular user' do
        it 'redirects to unauthorized' 

      end

      context 'as an enterprise user' do
        before { shop.update_attributes(owner: user) }
        let!(:shop2) { create(:distributor_enterprise, owner: user) }
        let!(:subscription2) { create(:subscription, shop: shop2) }

        it 'renders the collection as json' 


        context "when ransack predicates are submitted" do
          before { params.merge!(q: { shop_id_eq: shop2.id }) }

          it "restricts the list of subscriptions" 

        end
      end
    end
  end

  describe 'new' do
    let!(:user) { create(:user) }
    let!(:shop) { create(:distributor_enterprise, owner: user) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    it 'loads the preloads the necessary data' 

  end

  describe 'create' do
    let!(:user) { create(:user) }
    let!(:shop) { create(:distributor_enterprise, owner: user) }
    let!(:customer) { create(:customer, enterprise: shop) }
    let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop) }
    let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
    let!(:payment_method) { create(:payment_method, distributors: [shop]) }
    let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }
    let(:params) { { format: :json, subscription: { shop_id: shop.id } } }

    context 'as an non-manager of the specified shop' do
      before do
        allow(controller).to receive(:spree_current_user) { create(:user, enterprises: [create(:enterprise)]) }
      end

      it 'redirects to unauthorized' 

    end

    context 'as a manager of the specified shop' do
      before do
        allow(controller).to receive(:spree_current_user) { user }
      end

      context 'when I submit insufficient params' do
        it 'returns errors' 

      end

      context 'when I submit params containing ids of inaccessible objects' do
        # As 'user' I shouldnt be able to associate a subscription with any of these.
        let(:unmanaged_enterprise) { create(:enterprise) }
        let(:unmanaged_schedule) { create(:schedule, order_cycles: [create(:simple_order_cycle, coordinator: unmanaged_enterprise)]) }
        let(:unmanaged_customer) { create(:customer, enterprise: unmanaged_enterprise) }
        let(:unmanaged_payment_method) { create(:payment_method, distributors: [unmanaged_enterprise]) }
        let(:unmanaged_shipping_method) { create(:shipping_method, distributors: [unmanaged_enterprise]) }

        before do
          params[:subscription].merge!(
            schedule_id: unmanaged_schedule.id,
            customer_id: unmanaged_customer.id,
            payment_method_id: unmanaged_payment_method.id,
            shipping_method_id: unmanaged_shipping_method.id,
            begins_at: 2.days.ago,
            ends_at: 3.weeks.ago
          )
        end

        it 'returns errors' 

      end

      context 'when I submit complete params with references to accessible objects' do
        let!(:address) { create(:address) }
        let(:variant) { create(:variant) }

        before do
          params[:subscription].merge!(
            schedule_id: schedule.id,
            customer_id: customer.id,
            payment_method_id: payment_method.id,
            shipping_method_id: shipping_method.id,
            begins_at: 2.days.ago,
            ends_at: 3.months.from_now
          )
          params.merge!(
            bill_address: address.attributes.except('id'),
            ship_address: address.attributes.except('id'),
            subscription_line_items: [{ quantity: 2, variant_id: variant.id}]
          )
        end

        context 'where the specified variants are not available from the shop' do
          it 'returns an error' 

        end

        context 'where the specified variants are available from the shop' do
          let!(:exchange) { create(:exchange, order_cycle: order_cycle, incoming: false, receiver: shop, variants: [variant]) }

          it 'creates subscription line items for the subscription' 

        end
      end
    end
  end

  describe 'edit' do
    let!(:user) { create(:user) }
    let!(:shop) { create(:distributor_enterprise, owner: user) }
    let!(:customer1) { create(:customer, enterprise: shop) }
    let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop) }
    let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
    let!(:payment_method) { create(:payment_method, distributors: [shop]) }
    let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }
    let!(:subscription) {
      create(:subscription,
             shop: shop,
             customer: customer1,
             schedule: schedule,
             payment_method: payment_method,
             shipping_method: shipping_method)
    }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    it 'loads the preloads the necessary data' 

  end

  describe 'update' do
    let!(:user) { create(:user) }
    let!(:shop) { create(:distributor_enterprise, owner: user) }
    let!(:customer) { create(:customer, enterprise: shop) }
    let!(:product1) { create(:product, supplier: shop) }
    let!(:variant1) { create(:variant, product: product1, unit_value: '100', price: 12.00, option_values: []) }
    let!(:enterprise_fee) { create(:enterprise_fee, amount: 1.75) }
    let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 2.days.from_now, orders_close_at: 7.days.from_now) }
    let!(:outgoing_exchange) { order_cycle.exchanges.create(sender: shop, receiver: shop, variants: [variant1], enterprise_fees: [enterprise_fee]) }
    let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
    let!(:payment_method) { create(:payment_method, distributors: [shop]) }
    let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }
    let!(:subscription) {
      create(:subscription,
             shop: shop,
             customer: customer,
             schedule: schedule,
             payment_method: payment_method,
             shipping_method: shipping_method,
             subscription_line_items: [create(:subscription_line_item, variant: variant1, quantity: 2)])
    }
    let(:subscription_line_item1) { subscription.subscription_line_items.first }
    let(:params) { { format: :json, id: subscription.id, subscription: {} } }

    context 'as an non-manager of the subscription shop' do
      before do
        allow(controller).to receive(:spree_current_user) { create(:user, enterprises: [create(:enterprise)]) }
      end

      it 'redirects to unauthorized' 

    end

    context 'as a manager of the subscription shop' do
      before do
        allow(controller).to receive(:spree_current_user) { user }
      end

      context 'when I submit params containing a new customer or schedule id' do
        let!(:new_customer) { create(:customer, enterprise: shop) }
        let!(:new_schedule) { create(:schedule, order_cycles: [order_cycle]) }

        before do
          params[:subscription].merge!(schedule_id: new_schedule.id, customer_id: new_customer.id)
        end

        it 'does not alter customer_id or schedule_id' 

      end

      context 'when I submit params containing ids of inaccessible objects' do
        # As 'user' I shouldnt be able to associate a subscription with any of these.
        let(:unmanaged_enterprise) { create(:enterprise) }
        let(:unmanaged_payment_method) { create(:payment_method, distributors: [unmanaged_enterprise]) }
        let(:unmanaged_shipping_method) { create(:shipping_method, distributors: [unmanaged_enterprise]) }

        before do
          params[:subscription].merge!(
            payment_method_id: unmanaged_payment_method.id,
            shipping_method_id: unmanaged_shipping_method.id
          )
        end

        it 'returns errors' 

      end

      context 'when I submit valid params' do
        let!(:new_payment_method) { create(:payment_method, distributors: [shop]) }
        let!(:new_shipping_method) { create(:shipping_method, distributors: [shop]) }

        before do
          params[:subscription].merge!(
            payment_method_id: new_payment_method.id,
            shipping_method_id: new_shipping_method.id
          )
        end

        it 'updates the subscription' 


        context 'with subscription_line_items params' do
          let!(:product2) { create(:product, supplier: shop) }
          let!(:variant2) { create(:variant, product: product2, unit_value: '1000', price: 6.00, option_values: []) }

          before do
            params[:subscription_line_items] = [{id: subscription_line_item1.id, quantity: 1, variant_id: variant1.id}, { quantity: 2, variant_id: variant2.id}]
          end

          context 'where the specified variants are not available from the shop' do
            it 'returns an error' 

          end

          context 'where the specified variants are available from the shop' do
            before { outgoing_exchange.update_attributes(variants: [variant1, variant2]) }

            it 'creates subscription line items for the subscription' 

          end
        end
      end
    end
  end

  describe 'cancel' do
    let!(:user) { create(:user, enterprise_limit: 10) }
    let!(:shop) { create(:distributor_enterprise) }
    let!(:order_cycle) { create(:simple_order_cycle, orders_close_at: 1.day.from_now) }
    let!(:subscription) { create(:subscription, shop: shop, with_items: true) }
    let!(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    context 'json' do
      let(:params) { { format: :json, id: subscription.id } }

      context 'as a regular user' do
        it 'redirects to unauthorized' 

      end

      context 'as an enterprise user' do
        context "without authorisation" do
          let!(:shop2) { create(:distributor_enterprise) }
          before { shop2.update_attributes(owner: user) }

          it 'redirects to unauthorized' 

        end

        context "with authorisation" do
          before { shop.update_attributes(owner: user) }

          context "when at least one associated order is still 'open'" do
            let(:order_cycle) { subscription.order_cycles.first }
            let(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle) }
            let!(:order) { proxy_order.initialise_order! }

            before { while !order.completed? do break unless order.next! end }

            context "when no 'open_orders' directive has been provided" do
              it "renders an error, asking what to do" 

            end

            context "when 'keep' has been provided as the 'open_orders' directive" do
              before { params.merge!(open_orders: 'keep') }

              it 'renders the cancelled subscription as json, and does not cancel the open order' 

            end

            context "when 'cancel' has been provided as the 'open_orders' directive" do
              let(:mail_mock) { double(:mail) }

              before do
                params[:open_orders] = 'cancel'
                allow(Spree::OrderMailer).to receive(:cancel_email) { mail_mock }
                allow(mail_mock).to receive(:deliver)
              end

              it 'renders the cancelled subscription as json, and cancels the open order' 

            end
          end

          context "when no associated orders are still 'open'" do
            it 'renders the cancelled subscription as json' 

          end
        end
      end
    end
  end

  describe 'pause' do
    let!(:user) { create(:user, enterprise_limit: 10) }
    let!(:shop) { create(:distributor_enterprise) }
    let!(:subscription) { create(:subscription, shop: shop, with_items: true) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    context 'json' do
      let(:params) { { format: :json, id: subscription.id } }

      context 'as a regular user' do
        it 'redirects to unauthorized' 

      end

      context 'as an enterprise user' do
        context "without authorisation" do
          let!(:shop2) { create(:distributor_enterprise) }
          before { shop2.update_attributes(owner: user) }

          it 'redirects to unauthorized' 

        end

        context "with authorisation" do
          before { shop.update_attributes(owner: user) }

          context "when at least one associated order is still 'open'" do
            let(:order_cycle) { subscription.order_cycles.first }
            let(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle) }
            let!(:order) { proxy_order.initialise_order! }

            before { while !order.completed? do break unless order.next! end }

            context "when no 'open_orders' directive has been provided" do
              it "renders an error, asking what to do" 

            end

            context "when 'keep' has been provided as the 'open_orders' directive" do
              before { params.merge!(open_orders: 'keep') }

              it 'renders the paused subscription as json, and does not cancel the open order' 

            end

            context "when 'cancel' has been provided as the 'open_orders' directive" do
              let(:mail_mock) { double(:mail) }

              before do
                params[:open_orders] = 'cancel'
                allow(Spree::OrderMailer).to receive(:cancel_email) { mail_mock }
                allow(mail_mock).to receive(:deliver)
              end

              it 'renders the paused subscription as json, and cancels the open order' 

            end
          end

          context "when no associated orders are still 'open'" do
            it 'renders the paused subscription as json' 

          end
        end
      end
    end
  end

  describe 'unpause' do
    let!(:user) { create(:user, enterprise_limit: 10) }
    let!(:shop) { create(:distributor_enterprise) }
    let!(:subscription) { create(:subscription, shop: shop, paused_at: Time.zone.now, with_items: true) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
    end

    context 'json' do
      let(:params) { { format: :json, id: subscription.id } }

      context 'as a regular user' do
        it 'redirects to unauthorized' 

      end

      context 'as an enterprise user' do
        context "without authorisation" do
          let!(:shop2) { create(:distributor_enterprise) }
          before { shop2.update_attributes(owner: user) }

          it 'redirects to unauthorized' 

        end

        context "with authorisation" do
          before { shop.update_attributes(owner: user) }

          context "when at least one order in an open order cycle is 'complete'" do
            let(:order_cycle) { subscription.order_cycles.first }
            let(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle) }
            let!(:order) { proxy_order.initialise_order! }

            before { while !order.completed? do break unless order.next! end }

            context "when no associated orders are 'canceled'" do
              it 'renders the unpaused subscription as json, leaves the order untouched' 

            end

            context "when at least one associate orders is 'canceled'" do
              before do
                Spree::MailMethod.create!(
                  environment: Rails.env,
                  preferred_mails_from: 'spree@example.com'
                )
                proxy_order.cancel
              end

              context "when no 'canceled_orders' directive has been provided" do
                it "renders a message, informing the user that canceled order can be resumed" 

              end

              context "when 'notified' has been provided as the 'canceled_orders' directive" do
                before { params.merge!(canceled_orders: 'notified') }

                it 'renders the unpaused subscription as json, leaves the order untouched' 

              end
            end
          end

          context "when no associated orders are 'complete'" do
            it 'renders the unpaused subscription as json' 

          end
        end
      end
    end
  end

  describe "#load_form_data" do
    let!(:user) { create(:user) }
    let!(:shop) { create(:distributor_enterprise, owner: user) }
    let!(:customer1) { create(:customer, enterprise: shop) }
    let!(:customer2) { create(:customer, enterprise: shop) }
    let!(:order_cycle) { create(:simple_order_cycle, coordinator: shop) }
    let!(:schedule) { create(:schedule, order_cycles: [order_cycle]) }
    let!(:payment_method) { create(:payment_method, distributors: [shop]) }
    let!(:shipping_method) { create(:shipping_method, distributors: [shop]) }

    before do
      allow(controller).to receive(:spree_current_user) { user }
      controller.instance_variable_set(:@subscription, Subscription.new(shop: shop))
    end

    it "assigns data to instance variables" 


    context "when other payment methods exist" do
      let!(:stripe) { create(:stripe_payment_method, distributors: [shop], preferred_enterprise_id: shop.id) }
      let!(:paypal) { Spree::Gateway::PayPalExpress.create!(name: "PayPalExpress", distributor_ids: [shop.id]) }
      let!(:bogus) { create(:bogus_payment_method, distributors: [shop]) }

      it "only loads Stripe and Cash payment methods" 

    end
  end
end

