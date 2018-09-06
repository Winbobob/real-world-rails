require 'spec_helper'

module Spree
  describe Api::V1::CheckoutsController, type: :controller do
    render_views

    shared_examples_for 'action which loads order using load_order_with_lock' do
      before do
        allow(controller).to receive(:load_order).with(true).and_return(true)
      end

      it 'invokes load_order_with_lock' 


      it 'invokes load_order' 


      context 'ensure no double_render_error' do
        before do
          def controller.load_order(*)
            respond_with(@order, default_template: 'spree/api/v1/orders/show', status: 200)
          end
        end

        it 'does not generate double_render_error' 

      end

      after do
        send_request
      end
    end

    before do
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

      before do
        allow_any_instance_of(Order).to receive_messages(confirmation_required?: true)
        allow_any_instance_of(Order).to receive_messages(payment_required?: true)
      end

      it 'transitions a recently created order from cart to address' 


      it 'transitions a recently created order from cart to address with order token in header' 


      it 'can take line_items_attributes as a parameter' 


      it 'can take line_items as a parameter' 


      it 'will return an error if the order cannot transition' 


      context 'transitioning to delivery' do
        before do
          order.update_column(:state, 'address')
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

        it 'can update addresses and transition from address to delivery' 


        # Regression Spec for #5389 & #5880
        it 'can update addresses but not transition to delivery w/o shipping setup' 


        # Regression test for #4498
        it 'does not contain duplicate variant data in delivery return' 

      end

      it 'can update shipping method and transition from delivery to payment' 


      it 'can update payment method and transition from payment to confirm' 


      it 'can update payment method with source and transition from payment to confirm' 


      it 'returns errors when source is missing attributes' 


      it 'allow users to reuse a credit card' 


      it 'can transition from confirm to complete' 


      it 'prevent normal user from updating completed order' 


      # Regression test for #3784
      it 'can update the special instructions for an order' 


      context 'as an admin' do
        sign_in_as_admin!
        it 'can assign a user to the order' 

      end

      it 'can assign an email to the order' 


      it 'can apply a coupon code to an order' 


      def send_request
        api_put :update, id: order.to_param, order_token: order.guest_token
      end

      it_behaves_like 'action which loads order using load_order_with_lock'
    end

    context "PUT 'next'" do
      let!(:order) { create(:order_with_line_items) }

      it 'cannot transition to address without a line item' 


      it 'can transition an order to the next state' 


      it 'cannot transition if order email is blank' 


      it 'cannot transition if any line_item becomes unavailable' 


      it 'doesnt advance payment state if order has no payment' 


      def send_request
        api_put :next, id: order.to_param, order_token: order.guest_token
      end

      it_behaves_like 'action which loads order using load_order_with_lock'
    end

    context "PUT 'advance'" do
      let!(:order) { create(:order_with_line_items) }

      it 'continues to advance advances an order while it can move forward' 


      it 'returns the order' 


      def send_request
        api_put :advance, id: order.to_param, order_token: order.guest_token
      end

      it_behaves_like 'action which loads order using load_order_with_lock'
    end
  end
end

