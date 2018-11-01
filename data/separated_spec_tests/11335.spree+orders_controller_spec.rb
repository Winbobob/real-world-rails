require 'spec_helper'
require 'spree/testing_support/bar_ability'

module Spree
  describe Api::V1::OrdersController, type: :controller do
    render_views

    let!(:order)    { create(:order) }
    let(:variant)   { create(:variant) }
    let(:line_item) { create(:line_item) }

    let(:attributes) do
      [:number, :item_total, :display_total, :total, :state, :adjustment_total, :user_id,
       :created_at, :updated_at, :completed_at, :payment_total, :shipment_state, :payment_state,
       :email, :special_instructions, :total_quantity, :display_item_total, :currency, :considered_risky]
    end

    let(:address_params) { { country_id: Country.first.id, state_id: State.first.id } }

    let(:current_api_user) do
      user = Spree.user_class.new(email: 'spree@example.com')
      user.generate_spree_api_key!
      user
    end

    before do
      stub_authentication!
    end

    it 'cannot view all orders' 


    context 'the current api user is not persisted' do
      let(:current_api_user) { Spree.user_class.new }

      it 'returns a 401' 

    end

    context 'the current api user is authenticated' do
      let(:current_api_user) { order.user }
      let(:order)            { create(:order, line_items: [line_item]) }

      it 'can view all of their own orders' 


      it 'can filter the returned results' 


      it 'returns orders in reverse chronological order by completed_at' 

    end

    describe 'current' do
      subject do
        api_get :current, format: 'json'
      end

      let(:current_api_user) { order.user }
      let!(:order) { create(:order, line_items: [line_item]) }

      context 'an incomplete order exists' do
        it 'returns that order' 

      end

      context 'multiple incomplete orders exist' do
        it 'returns the latest incomplete order' 

      end

      context 'an incomplete order does not exist' do
        before do
          order.update_attribute(:state, order_state)
          order.update_attribute(:completed_at, 5.minutes.ago)
        end

        ['complete', 'returned', 'awaiting_return'].each do |order_state|
          context "order is in the #{order_state} state" do
            let(:order_state) { order_state }

            it 'returns no content' 

          end
        end
      end
    end

    it 'can view their own order' 


    describe 'GET #show' do
      subject { api_get :show, id: order.to_param }

      let(:order)      { create :order_with_line_items }
      let(:adjustment) { FactoryBot.create(:adjustment, order: order) }

      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      context 'when inventory information is present' do
        it 'contains stock information on variant' 

      end

      context 'when shipment adjustments are present' do
        before do
          order.shipments.first.adjustments << adjustment
        end

        it 'contains adjustments on shipment' 

      end
    end

    it 'order contains the basic checkout steps' 


    # Regression test for #1992
    it 'can view an order not in a standard state' 


    it "can not view someone else's order" 


    it 'can view an order if the token is known' 


    it 'can view an order if the token is passed in header' 


    context 'with BarAbility registered' do
      before { Spree::Ability.register_ability(::BarAbility) }
      after  { Spree::Ability.remove_ability(::BarAbility) }

      it 'can view an order' 

    end

    it "cannot cancel an order that doesn't belong to them" 


    it 'can create an order' 


    it 'assigns email when creating a new order' 


    it 'cannot arbitrarily set the line items price' 


    context 'admin user imports order' do
      before do
        allow(current_api_user).to receive_messages has_spree_role?: true
        allow(current_api_user).to receive_message_chain :spree_roles, pluck: ['admin']
      end

      it 'is able to set any default unpermitted attribute' 

    end

    it 'can create an order without any parameters' 


    context 'working with an order' do
      let(:variant)        { create(:variant) }
      let!(:line_item)     { Spree::Cart::AddItem.call(order: order, variant: variant).value }
      let(:address_params) { { country_id: country.id } }
      let(:billing_address) do
        {
          firstname: 'Tiago', lastname: 'Motta', address1: 'Av Paulista',
          city: 'Sao Paulo', zipcode: '01310-300', phone: '12345678',
          country_id: country.id
        }
      end
      let(:shipping_address) do
        {
          firstname: 'Tiago', lastname: 'Motta', address1: 'Av Paulista',
          city: 'Sao Paulo', zipcode: '01310-300', phone: '12345678',
          country_id: country.id
        }
      end
      let(:country) { create(:country, name: 'Brazil', iso_name: 'BRAZIL', iso: 'BR', iso3: 'BRA', numcode: 76) }

      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
        order.next # Switch from cart to address
        order.bill_address = nil
        order.ship_address = nil
        order.save
        expect(order.state).to eq('address')
      end

      def clean_address(address)
        address.delete(:state)
        address.delete(:country)
        address
      end

      context 'line_items hash not present in request' do
        it 'responds successfully' 

      end

      it 'updates quantities of existing line items' 


      it 'adds an extra line item' 


      it 'cannot change the price of an existing line item' 


      it 'can add billing address' 


      it 'receives error message if trying to add billing address with errors' 


      it 'can add shipping address' 


      it 'receives error message if trying to add shipping address with errors' 


      it 'can set the user_id for the order' 


      context 'order has shipments' do
        before { order.create_proposed_shipments }

        it 'clears out all existing shipments on line item udpate' 

      end

      context 'with a line item' do
        let(:order_with_line_items) do
          order = create(:order_with_line_items)
          create(:adjustment, order: order, adjustable: order)
          order
        end

        it 'can empty an order' 


        it 'can list its line items with images' 


        it 'lists variants product id' 


        it 'includes the tax_total in the response' 


        it 'lists line item adjustments' 


        it 'lists payments source without gateway info' 


        context 'when in delivery' do
          let!(:shipping_method) do
            FactoryBot.create(:shipping_method).tap do |shipping_method|
              shipping_method.calculator.preferred_amount = 10
              shipping_method.calculator.save
            end
          end

          before do
            order.bill_address = FactoryBot.create(:address)
            order.ship_address = FactoryBot.create(:address)
            order.next!
            order.save
          end

          it 'includes the ship_total in the response' 


          it 'returns available shipments for an order' 

        end
      end
    end

    context 'as an admin' do
      sign_in_as_admin!

      context 'with no orders' do
        before { Spree::Order.delete_all }
        it 'still returns a root :orders key' 

      end

      it 'responds with orders updated_at with miliseconds precision' 


      context 'caching enabled' do
        before do
          ActionController::Base.perform_caching = true
          3.times { create(:order) }
        end

        it 'returns unique orders' 


        after { ActionController::Base.perform_caching = false }
      end

      it 'lists payments source with gateway info' 


      context 'with two orders' do
        before { create(:order) }

        it 'can view all orders' 


        # Test for #1763
        it 'can control the page size through a parameter' 

      end

      context 'search' do
        before do
          create(:order)
          Spree::Order.last.update_attribute(:email, 'spree@spreecommerce.com')
        end

        let(:expected_result) { Spree::Order.last }

        it 'can query the results through a parameter' 

      end

      context 'creation' do
        it 'can create an order without any parameters' 


        it 'can arbitrarily set the line items price' 


        it 'can set the user_id for the order' 

      end

      context 'updating' do
        it 'can set the user_id for the order' 

      end

      context 'can cancel an order' do
        before do
          order.completed_at = Time.current
          order.state = 'complete'
          order.shipment_state = 'ready'
          order.save!
        end

        specify do
          api_put :cancel, id: order.to_param
          expect(json_response['state']).to eq('canceled')
          expect(json_response['canceler_id']).to eq(current_api_user.id)
        end
      end

      context 'can approve an order' do
        before do
          order.completed_at = Time.current
          order.state = 'complete'
          order.shipment_state = 'ready'
          order.considered_risky = true
          order.save!
        end

        specify do
          api_put :approve, id: order.to_param
          order.reload
          expect(order.approver_id).to eq(current_api_user.id)
          expect(order.considered_risky).to eq(false)
        end
      end
    end

    context 'PUT remove_coupon_code' do
      let(:order) { create(:order_with_line_items) }

      it 'returns 404 status if promotion does not exist' 


      context 'order with discount promotion' do
        let!(:discount_promo_code) { 'discount' }
        let!(:discount_promotion) { create(:promotion_with_order_adjustment, code: discount_promo_code) }
        let(:order_with_discount_promotion) do
          create(:order_with_line_items, coupon_code: discount_promo_code).tap do |order|
            Spree::PromotionHandler::Coupon.new(order).apply
          end
        end

        it 'removes all order adjustments from order and return status 200' 

      end

      context 'order with line item discount promotion' do
        let!(:line_item_promo_code) { 'line_item_discount' }
        let!(:line_item_promotion) { create(:promotion_with_item_adjustment, code: line_item_promo_code) }
        let(:order_with_line_item_promotion) do
          create(:order_with_line_items, coupon_code: line_item_promo_code).tap do |order|
            Spree::PromotionHandler::Coupon.new(order).apply
          end
        end

        it 'removes line item adjustments from order and return status 200' 


        it 'removes line item adjustments only for promotable line item' 

      end
    end
  end
end

