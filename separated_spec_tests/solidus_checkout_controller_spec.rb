# frozen_string_literal: true

require 'spec_helper'

describe Spree::CheckoutController, type: :controller do
  let(:token) { 'some_token' }
  let(:user) { create(:user) }
  let(:order) { FactoryBot.create(:order_with_totals) }

  let(:address_params) do
    address = FactoryBot.build(:address)
    address.attributes.except("created_at", "updated_at")
  end

  before do
    allow(controller).to receive_messages try_spree_current_user: user
    allow(controller).to receive_messages spree_current_user: user
    allow(controller).to receive_messages current_order: order
  end

  context "#edit" do
    it 'should check if the user is authorized for :edit' 


    it "should redirect to the cart path unless checkout_allowed?" 


    it "should redirect to the cart path if current_order is nil" 


    it "should redirect to cart if order is completed" 


    # Regression test for https://github.com/spree/spree/issues/2280
    it "should redirect to current step trying to access a future step" 


    context "when entering the checkout" do
      before do
        # The first step for checkout controller is address
        # Transitioning into this state first is required
        order.update_column(:state, "address")
      end

      it "should associate the order with a user" 

    end
  end

  context "#update" do
    it 'should check if the user is authorized for :edit' 


    context "save successful" do
      def post_address
        post :update, params: {
          state: "address",
          order: {
            bill_address_attributes: address_params,
            use_billing: true
          }
        }
      end

      let!(:payment_method) { create(:payment_method) }
      before do
        # Must have *a* shipping method and a payment method so updating from address works
        allow(order).to receive_messages ensure_available_shipping_rates: true
        order.line_items << FactoryBot.create(:line_item)
      end

      context "with the order in the cart state" do
        before do
          order.update_attributes! user: user
          order.update_column(:state, "cart")
        end

        it "should assign order" 


        it "should advance the state" 


        it "should redirect the next state" 


        context "current_user respond to save address method" do
          it "calls persist order address on user" 

        end

        context "current_user doesnt respond to persist_order_address" do
          it "doesnt raise any error" 

        end
      end

      context "with the order in the address state" do
        before do
          order.update_attributes! user: user
          order.update_columns(ship_address_id: create(:address).id, state: "address")
        end

        context 'landing to address page' do
          it "tries to associate user addresses to order" 

        end

        context "with a billing and shipping address" do
          subject do
            post :update, params: {
              state: "address",
              order: {
                bill_address_attributes: order.bill_address.attributes.except("created_at", "updated_at").compact,
                ship_address_attributes: order.ship_address.attributes.except("created_at", "updated_at").compact,
                use_billing: false
              }
            }
          end

          it "doesn't change bill address" 


          it "doesn't change ship address" 

        end
      end

      # This is the only time that we need the 'set_payment_parameters_amount'
      # controller code, because otherwise the transition to 'confirm' will
      # trigger the 'add_store_credit_payments' transition code which will do
      # the same thing here.
      # Perhaps we can just remove 'set_payment_parameters_amount' entirely at
      # some point?
      context "when there is a checkout step between payment and confirm" do
        before do
          @old_checkout_flow = Spree::Order.checkout_flow
          Spree::Order.class_eval do
            insert_checkout_step :new_step, after: :payment
          end
        end

        after do
          Spree::Order.checkout_flow(&@old_checkout_flow)
        end

        let(:order) { create(:order_with_line_items) }
        let(:payment_method) { create(:credit_card_payment_method) }

        let(:params) do
          {
            state: 'payment',
            order: {
              payments_attributes: [
                {
                  payment_method_id: payment_method.id.to_s,
                  source_attributes: attributes_for(:credit_card)
                }
              ]
            }
          }
        end

        before do
          order.update_attributes! user: user
          3.times { order.next! } # should put us in the payment state
        end

        it 'sets the payment amount' 

      end

      context "when in the payment state" do
        let(:order) { create(:order_with_line_items) }
        let(:payment_method) { create(:credit_card_payment_method) }

        let(:params) do
          {
            state: 'payment',
            order: {
              payments_attributes: [
                {
                  payment_method_id: payment_method.id.to_s,
                  source_attributes: attributes_for(:credit_card)
                }
              ]
            }
          }
        end

        before do
          order.update_attributes! user: user
          3.times { order.next! } # should put us in the payment state
        end

        context 'with a permitted payment method' do
          it 'sets the payment amount' 

        end

        context 'with an unpermitted payment method' do
          before { payment_method.update!(available_to_users: false) }

          it 'sets the payment amount' 

        end
      end

      context "when in the confirm state" do
        before do
          order.update_attributes! user: user
          order.update_column(:state, "confirm")
          # An order requires a payment to reach the complete state
          # This is because payment_required? is true on the order
          create(:payment, amount: order.total, order: order)
          order.create_proposed_shipments
          order.payments.reload
        end

        # This inadvertently is a regression test for https://github.com/spree/spree/issues/2694
        it "should redirect to the order view" 


        it "should populate the flash message" 


        it "should remove completed order from current_order" 

      end
    end

    context "save unsuccessful" do
      before do
        order.update_attributes! user: user
        allow(order).to receive_messages valid?: false
      end

      it "should not assign order" 


      it "should not change the order state" 


      it "should render the edit template" 

    end

    context "when current_order is nil" do
      before { allow(controller).to receive_messages current_order: nil }

      it "should not change the state if order is completed" 


      it "should redirect to the cart_path" 

    end

    context "Spree::Core::GatewayError" do
      before do
        order.update_attributes! user: user
        allow(order).to receive(:next).and_raise(Spree::Core::GatewayError.new("Invalid something or other."))
        post :update, params: { state: "address" }
      end

      it "should render the edit template and display exception message" 

    end

    context "fails to transition from address" do
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

      context "when the order is invalid" do
        before do
          allow(order).to receive_messages valid?: true, next: nil
          order.errors.add :base, 'Base error'
          order.errors.add :adjustments, 'error'
        end

        it "due to the order having errors" 

      end

      context "when the country is not a shippable country" do
        let(:foreign_address) { create(:address, country_iso_code: "CA") }

        before do
          order.update(shipping_address: foreign_address)
        end

        it "due to no available shipping rates for any of the shipments" 

      end
    end

    context "when GatewayError is raised" do
      let(:order) do
        FactoryBot.create(:order_with_line_items).tap do |order|
          until order.state == 'payment'
            order.next!
          end
          # So that the confirmation step is skipped and we get straight to the action.
          payment_method = FactoryBot.create(:simple_credit_card_payment_method)
          payment = FactoryBot.create(:payment, payment_method: payment_method, amount: order.total)
          order.payments << payment
          order.next!
        end
      end

      before do
        allow(controller).to receive_messages current_order: order
        allow(controller).to receive_messages check_authorization: true
      end

      it "fails to transition from payment to complete" 

    end
  end

  context "When last inventory item has been purchased" do
    let(:product) { mock_model(Spree::Product, name: "Amazing Object") }
    let(:variant) { mock_model(Spree::Variant) }
    let(:line_item) { mock_model Spree::LineItem, insufficient_stock?: true, amount: 0, name: "Amazing Item" }
    let(:order) { create(:order) }

    before do
      allow(order).to receive_messages(line_items: [line_item], state: "payment")

      configure_spree_preferences do |config|
        config.track_inventory_levels = true
      end
    end

    context "and back orders are not allowed" do
      before do
        post :update, params: { state: "payment" }
      end

      it "should redirect to cart" 


      it "should set flash message for no inventory" 

    end
  end

  context "order doesn't have a delivery step" do
    before do
      allow(order).to receive_messages(checkout_steps: ["cart", "address", "payment"])
      allow(order).to receive_messages state: "address"
      allow(controller).to receive_messages check_authorization: true
    end

    it "doesn't set shipping address on the order" 


    it "doesn't remove unshippable items before payment" 

  end

  it "does remove unshippable items before payment" 

end

