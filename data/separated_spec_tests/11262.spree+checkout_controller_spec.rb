require 'spec_helper'

describe Spree::CheckoutController, type: :controller do
  let(:token) { 'some_token' }
  let(:user) { stub_model(Spree::LegacyUser) }
  let(:order) { FactoryBot.create(:order_with_totals) }

  let(:address_params) do
    address = FactoryBot.build(:address)
    address.attributes.except('created_at', 'updated_at')
  end

  before do
    allow(controller).to receive_messages try_spree_current_user: user
    allow(controller).to receive_messages spree_current_user: user
    allow(controller).to receive_messages current_order: order
  end

  context '#edit' do
    it 'checks if the user is authorized for :edit' 


    it 'redirects to the cart path unless checkout_allowed?' 


    it 'redirects to the cart path if current_order is nil' 


    it 'redirects to cart if order is completed' 


    # Regression test for #2280
    it 'redirects to current step trying to access a future step' 


    context 'when entering the checkout' do
      before do
        # The first step for checkout controller is address
        # Transitioning into this state first is required
        order.update_column(:state, 'address')
      end

      it 'associates the order with a user' 

    end
  end

  context '#update' do
    it 'checks if the user is authorized for :edit' 


    context 'save successful' do
      def spree_post_address
        spree_post :update,
                   state: 'address',
                   order: {
                     bill_address_attributes: address_params,
                     use_billing: true
                   }
      end

      before do
        # Must have *a* shipping method and a payment method so updating from address works
        allow(order).to receive(:available_shipping_methods).
          and_return [stub_model(Spree::ShippingMethod)]
        allow(order).to receive(:available_payment_methods).
          and_return [stub_model(Spree::PaymentMethod)]
        allow(order).to receive(:ensure_available_shipping_rates).
          and_return true
        order.line_items << FactoryBot.create(:line_item)
      end

      context 'with the order in the cart state' do
        before do
          order.update_column(:state, 'cart')
          allow(order).to receive_messages user: user
        end

        it 'assigns order' 


        it 'advances the state' 


        it 'redirects the next state' 


        context 'current_user respond to save address method' do
          it 'calls persist order address on user' 

        end

        context 'current_user doesnt respond to persist_order_address' do
          it 'doesnt raise any error' 

        end
      end

      context 'with the order in the address state' do
        before do
          order.update_columns(ship_address_id: create(:address).id, state: 'address')
          allow(order).to receive_messages user: user
        end

        context 'with a billing and shipping address' do
          let(:bill_address_params) do
            order.bill_address.attributes.except('created_at', 'updated_at')
          end
          let(:ship_address_params) do
            order.ship_address.attributes.except('created_at', 'updated_at')
          end
          let(:update_params) do
            {
              state: 'address',
              order: {
                bill_address_attributes: bill_address_params,
                ship_address_attributes: ship_address_params,
                use_billing: false
              }
            }
          end

          before do
            @expected_bill_address_id = order.bill_address.id
            @expected_ship_address_id = order.ship_address.id

            spree_post :update, update_params
            order.reload
          end

          it 'updates the same billing and shipping address' 

        end
      end

      context 'when in the confirm state' do
        before do
          allow(order).to receive_messages confirmation_required?: true
          order.update_column(:state, 'confirm')
          allow(order).to receive_messages user: user
          # An order requires a payment to reach the complete state
          # This is because payment_required? is true on the order
          create(:payment, amount: order.total, order: order)
          order.payments.reload
        end

        # This inadvertently is a regression test for #2694
        it 'redirects to the order view' 


        it 'populates the flash message' 


        it 'removes completed order from current_order' 

      end

      # Regression test for #4190
      context 'state_lock_version' do
        let(:post_params) do
          {
            state: 'address',
            order: {
              bill_address_attributes: order.bill_address.attributes.except('created_at', 'updated_at'),
              state_lock_version: 0,
              use_billing: true
            }
          }
        end

        context 'correct' do
          it 'properly updates and increment version' 

        end

        context 'incorrect' do
          before do
            order.update_columns(state_lock_version: 1, state: 'address')
          end

          it 'order should receieve ensure_valid_order_version callback' 


          it 'order should receieve with_lock message' 


          it 'redirects back to current state' 

        end
      end
    end

    context 'save unsuccessful' do
      before do
        allow(order).to receive_messages user: user
        allow(order).to receive_messages update_attributes: false
      end

      it 'does not assign order' 


      it 'does not change the order state' 


      it 'renders the edit template' 


      it 'renders order in payment state when payment fails' 

    end

    context 'when current_order is nil' do
      before { allow(controller).to receive_messages current_order: nil }

      it 'does not change the state if order is completed' 


      it 'redirects to the cart_path' 

    end

    context 'Spree::Core::GatewayError' do
      before do
        allow(order).to receive_messages user: user
        allow(order).to receive(:update_attributes).and_raise(Spree::Core::GatewayError.new('Invalid something or other.'))
        spree_post :update, state: 'address'
      end

      it 'renders the edit template and display exception message' 

    end

    context 'fails to transition from address' do
      let(:order) do
        FactoryBot.create(:order_with_line_items).tap do |order|
          order.next!
          expect(order.state).to eq('address')
        end
      end

      before do
        allow(controller).to receive_messages current_order: order
        allow(controller).to receive_messages check_authorization: true
      end

      context 'when the country is not a shippable country' do
        before do
          order.ship_address.tap do |address|
            # A different country which is not included in the list of shippable countries
            address.country = FactoryBot.create(:country, name: 'Australia')
            address.state_name = 'Victoria'
            address.save
          end
        end

        it 'due to no available shipping rates for any of the shipments' 

      end

      context 'when the order is invalid' do
        before do
          allow(order).to receive_messages(update_from_params: true, next: nil)
          order.errors.add(:base, 'Base error')
          order.errors.add(:adjustments, 'error')
        end

        it 'due to the order having errors' 

      end
    end

    context 'fails to transition from payment to complete' do
      let(:order) do
        FactoryBot.create(:order_with_line_items).tap do |order|
          order.next! until order.state == 'payment'
          # So that the confirmation step is skipped and we get straight to the action.
          payment_method = FactoryBot.create(:simple_credit_card_payment_method)
          payment = FactoryBot.create(:payment, payment_method: payment_method)
          order.payments << payment
        end
      end

      before do
        allow(controller).to receive_messages current_order: order
        allow(controller).to receive_messages check_authorization: true
      end

      it 'when GatewayError is raised' 

    end
  end

  context 'When last inventory item has been purchased' do
    let(:product) { mock_model(Spree::Product, name: 'Amazing Object') }
    let(:variant) { mock_model(Spree::Variant) }
    let(:line_item) { mock_model Spree::LineItem, insufficient_stock?: true, amount: 0 }
    let(:order) { create(:order_with_line_items) }

    before do
      allow(order).to receive_messages(insufficient_stock_lines: [line_item], state: 'payment')

      configure_spree_preferences do |config|
        config.track_inventory_levels = true
      end
    end

    context 'and back orders are not allowed' do
      before do
        spree_post :update, state: 'payment'
      end

      it 'redirects to cart' 


      it 'sets flash message for no inventory' 

    end
  end

  context "order doesn't have a delivery step" do
    before do
      allow(order).to receive_messages(checkout_steps: ['cart', 'address', 'payment'])
      allow(order).to receive_messages state: 'address'
      allow(controller).to receive_messages check_authorization: true
    end

    it "doesn't set shipping address on the order" 


    it "doesn't remove unshippable items before payment" 

  end

  it 'does remove unshippable items before payment' 


  context 'in the payment step' do
    let(:order) { OrderWalkthrough.up_to(:payment) }
    let(:payment_method_id) { Spree::PaymentMethod.first.id }

    before do
      expect(order.state).to eq 'payment'
      allow(order).to receive_messages user: user
      allow(order).to receive_messages confirmation_required?: true
    end

    it 'does not advance the order extra even when called twice' 


    context 'with store credits payment' do
      let(:user) { create(:user) }
      let(:credit_amount) { order.total + 1.00 }
      let(:put_attrs) do
        {
          state: 'payment',
          apply_store_credit: 'Apply Store Credit',
          order: {
            payments_attributes: [{ payment_method_id: payment_method_id }]
          }
        }
      end

      before do
        create(:store_credit_payment_method)
        create(:store_credit, user: user, amount: credit_amount)
      end

      def expect_one_store_credit_payment(order, amount)
        expect(order.payments.count).to eq 1
        expect(order.payments.first.source).to be_a Spree::StoreCredit
        expect(order.payments.first.amount).to eq amount
      end

      it 'can fully pay with store credits while removing other payment attributes' 


      it 'can fully pay with store credits while removing an existing card' 


      context 'partial payment' do
        let(:credit_amount) { order.total - 1.00 }

        it 'returns to payment for partial store credit' 

      end
    end

    context 'remove store credits payment' do
      let(:user) { create(:user) }
      let(:credit_amount) { order.total - 1.00 }
      let(:put_attrs) do
        {
          state: 'payment',
          remove_store_credit: 'Remove Store Credit',
          order: {
            payments_attributes: [{ payment_method_id: payment_method_id }]
          }
        }
      end

      before do
        create(:store_credit_payment_method)
        create(:store_credit, user: user, amount: credit_amount)
        order.add_store_credit_payments
      end

      def expect_invalid_store_credit_payment(order)
        expect(order.payments.store_credits.with_state(:invalid).count).to eq 1
        expect(order.payments.store_credits.with_state(:invalid).first.source).to be_a Spree::StoreCredit
      end

      it 'can fully pay with store credits while removing other payment attributes' 

    end
  end
end

