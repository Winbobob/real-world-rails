# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::OrdersController, type: :request do
    let!(:order) { create(:order) }
    let(:variant) { create(:variant) }
    let(:line_item) { create(:line_item) }

    let(:attributes) {
      [:number, :item_total, :display_total, :total,
       :state, :adjustment_total,
       :user_id, :created_at, :updated_at,
       :completed_at, :payment_total, :shipment_state,
       :payment_state, :email, :special_instructions,
       :total_quantity, :display_item_total, :currency]
    }

    let(:address_params) { { country_id: Country.first.id, state_id: State.first.id } }

    let(:current_api_user) do
      user = Spree.user_class.new(email: "spree@example.com")
      user.generate_spree_api_key!
      user
    end

    before do
      stub_authentication!
    end

    describe "POST create" do
      let(:target_user) { create :user }
      let(:date_override) { Time.parse('2015-01-01') }
      let(:attributes) { { user_id: target_user.id, created_at: date_override, email: target_user.email } }

      subject do
        post spree.api_orders_path, params: { order: attributes }
        response
      end

      context "when the current user cannot administrate the order" do
        custom_authorization! do |_|
          can :create, Spree::Order
        end

        it "does not include unpermitted params, or allow overriding the user" 


        it { is_expected.to be_successful }

        context 'creating payment' do
          let(:attributes) { super().merge(payments_attributes: [{ payment_method_id: payment_method.id }]) }

          context "with allowed payment method" do
            let!(:payment_method) { create(:check_payment_method, name: "allowed" ) }
            it { is_expected.to be_successful }
            it "creates a payment" 

          end

          context "with disallowed payment method" do
            let!(:payment_method) { create(:check_payment_method, name: "forbidden", available_to_users: false) }
            it { is_expected.to be_not_found }
            it "creates no payments" 

          end
        end

        context "with existing promotion" do
          let(:discount) { 2 }
          before do
            create(:promotion, :with_line_item_adjustment, apply_automatically: true, adjustment_rate: discount )
          end

          it "activates the promotion" 

        end
      end

      context "when the current user can administrate the order" do
        custom_authorization! do |_|
          can [:admin, :create], Spree::Order
        end

        it "it permits all params and allows overriding the user" 


        it { is_expected.to be_successful }
      end

      context 'when the line items have custom attributes' do
        it "can create an order with line items that have custom permitted attributes", :pending do
          PermittedAttributes.line_item_attributes << { options: [:some_option] }
          expect_any_instance_of(Spree::LineItem).to receive(:some_option=).once.with('4')
          post spree.api_orders_path, params: { order: { line_items: { "0" => { variant_id: variant.to_param, quantity: 5, options: { some_option: 4 } } } } }
          expect(response.status).to eq(201)
          order = Order.last
          expect(order.line_items.count).to eq(1)
        end
      end
    end

    describe "PUT update" do
      let(:user) { create :user }
      let(:order_params) { { number: "anothernumber", user_id: user.id, email: "foo@foobar.com" } }
      let(:can_admin) { false }
      subject do
        put spree.api_order_path(order), params: { order: order_params }
        response
      end

      context "when the user cannot administer the order" do
        custom_authorization! do |_|
          can [:update], Spree::Order
        end

        it "updates the user's email" 


        it { is_expected.to be_successful }

        it "does not associate users" 


        it "does not change forbidden attributes" 


        context 'creating payment' do
          let(:order_params) { super().merge(payments_attributes: [{ payment_method_id: payment_method.id }]) }

          context "with allowed payment method" do
            let!(:payment_method) { create(:check_payment_method, name: "allowed" ) }
            it { is_expected.to be_successful }
            it "creates a payment" 

          end

          context "with disallowed payment method" do
            let!(:payment_method) { create(:check_payment_method, name: "forbidden", available_to_users: false) }
            it { is_expected.to be_not_found }
            it "creates no payments" 

          end
        end
      end

      context "when the user can administer the order" do
        custom_authorization! do |_|
          can [:admin, :update], Spree::Order
        end

        it "will associate users" 


        it "updates the otherwise forbidden attributes" 

      end
    end

    it "cannot view all orders" 


    context "the current api user does not exist" do
      let(:current_api_user) { nil }

      it "returns a 401" 

    end

    context "the current api user is authenticated" do
      let(:current_api_user) { order.user }
      let(:store) { create(:store) }
      let(:order) { create(:order, line_items: [line_item], store: store) }

      it "can view all of their own orders for the current store" 


      it "cannot view orders for a different store" 


      it "can filter the returned results" 


      it "returns orders in reverse chronological order by completed_at" 

    end

    describe 'current' do
      let(:current_api_user) { order.user }
      let!(:order) { create(:order, line_items: [line_item]) }

      it "uses the user's last_incomplete_spree_order logic with the current store" 

    end

    it "can view their own order" 


    describe 'GET #show' do
      let(:order) { create :order_with_line_items }
      let(:adjustment) { FactoryBot.create(:adjustment, adjustable: order, order: order) }

      subject { get spree.api_order_path(order) }

      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      context 'when inventory information is present' do
        it 'contains stock information on variant' 

      end

      context 'when an item does not track inventory' do
        before do
          order.line_items.first.variant.update_attributes!(track_inventory: false)
        end

        it 'contains stock information on variant' 

      end

      context 'when shipment adjustments are present' do
        before do
          order.shipments.first.adjustments << adjustment
        end

        it 'contains adjustments on shipment' 

      end

      context 'when credit cards are present' do
        let!(:payment) { create(:credit_card_payment, order: order, source: credit_card) }
        let(:credit_card) { create(:credit_card, address: create(:address)) }

        it 'contains the credit cards' 


        it 'renders the payment source view for gateway' 

      end

      context 'when store credit is present' do
        let!(:payment) { create(:store_credit_payment, order: order, source: store_credit) }
        let(:store_credit) { create(:store_credit) }

        it 'renders the payment source view for store credit' 

      end
    end

    it "orders contain the basic checkout steps" 


    it "can not view someone else's order" 


    it "can view an order if the token is known" 


    it "can view an order if the token is passed in header" 


    it "cannot cancel an order that doesn't belong to them" 


    it "can create an order" 


    it "assigns email when creating a new order" 


    # Regression test for https://github.com/spree/spree/issues/3404
    it "can specify additional parameters for a line item" 


    it "cannot arbitrarily set the line items price" 


    context "admin user imports order" do
      let!(:current_api_user) { create :admin_user }

      it "is able to set any default unpermitted attribute" 

    end

    it "can create an order without any parameters" 


    context "working with an order" do
      let(:variant) { create(:variant) }
      let!(:line_item) { order.contents.add(variant, 1) }
      let!(:payment_method) { create(:check_payment_method) }

      let(:address_params) { { country_id: country.id } }
      let(:billing_address) {
        { firstname: "Tiago", lastname: "Motta", address1: "Av Paulista",
                                city: "Sao Paulo", zipcode: "01310-300", phone: "12345678",
                                country_id: country.id }
      }
      let(:shipping_address) {
        { firstname: "Tiago", lastname: "Motta", address1: "Av Paulista",
                                 city: "Sao Paulo", zipcode: "01310-300", phone: "12345678",
                                 country_id: country.id }
      }
      let(:country) { create(:country, { name: "Brazil", iso_name: "BRAZIL", iso: "BR", iso3: "BRA", numcode: 76 }) }

      before { allow_any_instance_of(Order).to receive_messages user: current_api_user }

      it "updates quantities of existing line items" 


      it "adds an extra line item" 


      it "cannot change the price of an existing line item" 


      it "can add billing address" 


      it "receives error message if trying to add billing address with errors" 


      it "can add shipping address" 


      it "receives error message if trying to add shipping address with errors" 


      it "cannot set the user_id for the order" 


      context "order has shipments" do
        before { order.create_proposed_shipments }

        it "clears out all existing shipments on line item update" 

      end

      context "with a line item" do
        let(:order) { create(:order_with_line_items) }
        let(:line_item) { order.line_items.first }

        it "can empty an order" 


        it "can list its line items with images" 


        it "lists variants product id" 


        it "includes the tax_total in the response" 


        it "lists line item adjustments" 


        it "lists payments source without gateway info" 


        context "when in delivery" do
          let!(:shipping_method) do
            FactoryBot.create(:shipping_method).tap do |shipping_method|
              shipping_method.calculator.preferred_amount = 10
              shipping_method.calculator.save
            end
          end

          before do
            order.next!
            order.next!
            order.save
          end

          it "includes the ship_total in the response" 


          it "returns available shipments for an order" 

        end
      end
    end

    context "as an admin" do
      sign_in_as_admin!

      context "with no orders" do
        before { Spree::Order.delete_all }
        it "still returns a root :orders key" 

      end

      context "caching enabled" do
        before do
          ActionController::Base.perform_caching = true
          3.times { Order.create }
        end

        it "returns unique orders" 


        after { ActionController::Base.perform_caching = false }
      end

      it "lists payments source with gateway info" 


      context "with two orders" do
        before { create(:order) }

        it "can view all orders" 


        # Test for https://github.com/spree/spree/issues/1763
        it "can control the page size through a parameter" 

      end

      context "search" do
        before do
          create(:order)
          Spree::Order.last.update_attribute(:email, 'spree@spreecommerce.com')
        end

        let(:expected_result) { Spree::Order.last }

        it "can query the results through a parameter" 

      end

      context "creation" do
        it "can create an order without any parameters" 


        it "can arbitrarily set the line items price" 


        it "can set the user_id for the order" 

      end

      context "updating" do
        it "can set the user_id for the order" 

      end

      context "can cancel an order" do
        before do
          Spree::Config[:mails_from] = "spree@example.com"

          order.completed_at = Time.current
          order.state = 'complete'
          order.shipment_state = 'ready'
          order.save!
        end

        specify do
          put spree.cancel_api_order_path(order)
          expect(json_response["state"]).to eq("canceled")
          expect(json_response["canceler_id"]).to eq(current_api_user.id)
        end
      end
    end

    describe '#apply_coupon_code' do
      let(:promo) { create(:promotion_with_item_adjustment, code: 'abc') }
      let(:promo_code) { promo.codes.first }

      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      context 'when successful' do
        let(:order) { create(:order_with_line_items) }

        it 'applies the coupon' 

      end

      context 'when unsuccessful' do
        let(:order) { create(:order) } # no line items to apply the code to

        it 'returns an error' 

      end
    end
  end
end

