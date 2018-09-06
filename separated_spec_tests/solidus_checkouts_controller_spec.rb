# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::CheckoutsController, type: :request do
    before(:each) do
      stub_authentication!
      Spree::Config[:track_inventory_levels] = false
      country_zone = create(:zone, name: 'CountryZone')
      @state = create(:state)
      @country = @state.country
      country_zone.members.create(zoneable: @country)
      create(:stock_location)

      @shipping_method = create(:shipping_method, zones: [country_zone])
      @payment_method = create(:credit_card_payment_method)
    end

    after do
      Spree::Config[:track_inventory_levels] = true
    end

    context "PUT 'update'" do
      let(:order) do
        order = create(:order_with_line_items)
        # Order should be in a pristine state
        # Without doing this, the order may transition from 'cart' straight to 'delivery'
        order.shipments.delete_all
        order
      end

      before(:each) do
        allow_any_instance_of(Order).to receive_messages(payment_required?: true)
      end

      it "should transition a recently created order from cart to address" 


      it "should transition a recently created order from cart to address with order token in header" 


      it "can take line_items_attributes as a parameter" 


      it "can take line_items as a parameter" 


      it "will return an error if the order cannot transition" 


      context "transitioning to delivery" do
        before do
          order.update_column(:state, "address")
        end

        let(:address) do
          {
            firstname:  'John',
            lastname:   'Doe',
            address1:   '7735 Old Georgetown Road',
            city:       'Bethesda',
            phone:      '3014445002',
            zipcode:    '20814',
            state_id:   @state.id,
            country_id: @country.id
          }
        end

        it "can update addresses and transition from address to delivery" 


        # Regression Spec for https://github.com/spree/spree/issues/5389 and https://github.com/spree/spree/issues/5880
        it "can update addresses but not transition to delivery w/o shipping setup" 


        # Regression test for https://github.com/spree/spree/issues/4498
        it "does not contain duplicate variant data in delivery return" 

      end

      it "can update shipping method and transition from delivery to payment" 


      it "can update payment method and transition from payment to confirm" 


      context "with disallowed payment method" do
        it "returns not found" 

      end

      it "returns errors when source is required and missing" 


      describe 'setting the payment amount' do
        let(:params) do
          {
            order_token: order.guest_token,
            order: {
              payments_attributes: [
                {
                  payment_method_id: @payment_method.id.to_s,
                  source_attributes: attributes_for(:credit_card)
                }
              ]
            }
          }
        end

        it 'sets the payment amount to the order total' 

      end

      describe 'payment method with source and transition from payment to confirm' do
        before do
          order.update_column(:state, "payment")
        end

        let(:params) do
          {
            order_token: order.guest_token,
            order: {
              payments_attributes: [
                {
                  payment_method_id: @payment_method.id.to_s,
                  source_attributes: attributes_for(:credit_card)
                }
              ]
            }
          }
        end

        it 'succeeds' 

      end

      context 'when source is missing attributes' do
        before do
          order.update_column(:state, "payment")
        end

        let(:params) do
          {
            order_token: order.guest_token,
            order: {
              payments_attributes: [
                {
                  payment_method_id: @payment_method.id.to_s,
                  source_attributes: { name: "Spree" }
                }
              ]
            }
          }
        end

        it 'returns errors' 

      end

      context 'reusing a credit card' do
        before do
          order.update_column(:state, "payment")
        end

        let(:params) do
          {
            order_token: order.guest_token,
            order: {
              payments_attributes: [
                {
                  source_attributes: {
                    wallet_payment_source_id: wallet_payment_source.id.to_param,
                    verification_value: '456'
                  }
                }
              ]
            }
          }
        end

        let!(:wallet_payment_source) do
          order.user.wallet.add(credit_card)
        end

        let(:credit_card) do
          create(:credit_card, user_id: order.user_id, payment_method_id: @payment_method.id)
        end

        it 'succeeds' 


        context 'with deprecated existing_card_id param' do
          let(:params) do
            {
              order_token: order.guest_token,
              order: {
                payments_attributes: [
                  {
                    source_attributes: {
                      existing_card_id: credit_card.id.to_param,
                      verification_value: '456'
                    }
                  }
                ]
              }
            }
          end

          it 'succeeds' 

        end
      end

      it "returns the order if the order is already complete" 


      # Regression test for https://github.com/spree/spree/issues/3784
      it "can update the special instructions for an order" 


      context "as an admin" do
        sign_in_as_admin!
        it "can assign a user to the order" 

      end

      it "can assign an email to the order" 


      it "can apply a coupon code to an order" 


      it "renders error failing to apply coupon" 

    end

    context "PUT 'next'" do
      let!(:order) { create(:order_with_line_items) }
      it "cannot transition to address without a line item" 


      it "can transition an order to the next state" 


      it "cannot transition if order email is blank" 

    end

    context "complete" do
      context "with order in confirm state" do
        subject do
          put spree.complete_api_checkout_path(order), params: params
        end

        let(:params) { { order_token: order.guest_token } }
        let(:order) { create(:order_with_line_items) }

        before do
          order.update_column(:state, "confirm")
        end

        it "can transition from confirm to complete" 


        it "returns a sensible error when no payment method is specified" 


        context "with mismatched expected_total" do
          let(:params) { super().merge(expected_total: order.total + 1) }

          it "returns an error if expected_total is present and does not match actual total" 

        end
      end
    end

    context "PUT 'advance'" do
      let!(:order) { create(:order_with_line_items) }

      it 'continues to advance an order while it can move forward' 


      it 'returns the order' 

    end
  end
end

