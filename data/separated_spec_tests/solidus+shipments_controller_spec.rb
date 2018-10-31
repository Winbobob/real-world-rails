# frozen_string_literal: true

require 'spec_helper'

describe Spree::Api::ShipmentsController, type: :request do
  include ActiveSupport::Testing::TimeHelpers

  let!(:shipment) { create(:shipment, inventory_units: [build(:inventory_unit, shipment: nil)]) }
  let!(:attributes) { [:id, :tracking, :tracking_url, :number, :cost, :shipped_at, :stock_location_name, :order_id, :shipping_rates, :shipping_methods] }

  before do
    stub_authentication!
  end

  let!(:resource_scoping) { { id: shipment.to_param, shipment: { order_id: shipment.order.to_param } } }

  context "as a non-admin" do
    it "cannot make a shipment ready" 


    it "cannot make a shipment shipped" 


    it "cannot remove order contents from shipment" 


    it "cannot add contents to the shipment" 


    it "cannot update the shipment" 

  end

  context "as an admin" do
    let!(:order) { shipment.order }
    let!(:stock_location) { create(:stock_location_with_items) }
    let!(:variant) { create(:variant) }

    sign_in_as_admin!

    # Start writing this spec a bit differently than before....
    describe 'POST #create' do
      let(:params) do
        {
          variant_id: stock_location.stock_items.first.variant.to_param,
          shipment: { order_id: order.number },
          stock_location_id: stock_location.to_param
        }
      end

      subject do
        post spree.api_shipments_path, params: params
      end

      [:variant_id, :stock_location_id].each do |field|
        context "when #{field} is missing" do
          before do
            params.delete(field)
          end

          it 'should return proper error' 

        end
      end

      it 'should create a new shipment' 

    end

    it 'can update a shipment' 


    it "can make a shipment ready" 


    it "cannot make a shipment ready if the order is unpaid" 


    context 'for completed orders' do
      let(:order) { create :completed_order_with_totals }
      let(:shipment) { order.shipments.first }

      it 'adds a variant to a shipment' 


      it 'removes a variant from a shipment' 


      it 'removes a destroyed variant from a shipment' 

    end

    context 'for ready shipments' do
      let(:order) { create :order_ready_to_ship, line_items_attributes: [{ variant: variant, quantity: 1 }] }
      let(:shipment) { order.shipments.first }

      it 'adds a variant to a shipment' 


      it 'removes a variant from a shipment' 

    end

    context "for shipped shipments" do
      let(:order) { create :shipped_order }
      let(:shipment) { order.shipments.first }

      it 'adds a variant to a shipment' 


      it 'cannot remove a variant from a shipment' 

    end

    describe '#mine' do
      subject do
        get spree.mine_api_shipments_path, params: params
      end

      let(:params) { {} }

      context "the current api user is authenticated and has orders" do
        let(:current_api_user) { shipped_order.user }
        let!(:shipped_order) { create(:shipped_order) }

        it 'succeeds' 


        describe 'json output' do
          let(:rendered_shipment_ids) { json_response['shipments'].map { |s| s['id'] } }

          it 'contains the shipments' 


          context "credit card payment" do
            before { subject }

            it 'contains the id and cc_type of the credit card' 

          end

          context "store credit payment" do
            let(:current_api_user) { shipped_order.user }
            let(:shipped_order)    { create(:shipped_order, payment_type: :store_credit_payment) }

            before { subject }

            it 'only contains the id of the payment source' 

          end

          context "check payment" do
            let(:current_api_user) { shipped_order.user }
            let(:shipped_order)    { create(:shipped_order, payment_type: :check_payment) }

            before { subject }

            it 'does not try to render a nil source' 

          end
        end

        context 'with filtering' do
          let(:params) { { q: { order_completed_at_not_null: 1 } } }

          let!(:incomplete_order) { create(:order_with_line_items, user: current_api_user) }

          it 'filters' 

        end
      end

      context "the current api user does not exist" do
        let(:current_api_user) { nil }

        it "returns a 401" 

      end
    end
  end

  describe "#estimated_rates" do
    let!(:user_shipping_method) { shipment.shipping_method }
    let!(:admin_shipping_method) { create(:shipping_method, available_to_users: false, name: "Secret") }

    sign_in_as_admin!

    subject do
      get spree.estimated_rates_api_shipment_path(shipment)
    end

    it "returns success" 


    it "returns rates available to user" 


    it "returns rates available to admin" 

  end

  describe "#ship" do
    let(:shipment) { create(:order_ready_to_ship).shipments.first }

    let(:send_mailer) { nil }

    subject do
      put spree.ship_api_shipment_path(shipment), params: { send_mailer: send_mailer }
    end

    context "the user is allowed to ship the shipment" do
      sign_in_as_admin!
      it "ships the shipment" 


      describe 'sent emails' do
        subject { perform_enqueued_jobs { super() } }

        context "send_mailer not present" do
          it "sends the shipped shipments mailer" 

        end

        context "send_mailer set to false" do
          let(:send_mailer) { 'false' }
          it "does not send the shipped shipments mailer" 

        end

        context "send_mailer set to true" do
          let(:send_mailer) { 'true' }
          it "sends the shipped shipments mailer" 

        end
      end
    end

    context "the user is not allowed to ship the shipment" do
      sign_in_as_admin!

      before do
        ability = Spree::Ability.new(current_api_user)
        ability.cannot :ship, Spree::Shipment
        allow_any_instance_of(Spree::Api::ShipmentsController).to receive(:current_ability) { ability }
      end

      it "does nothing" 


      it "responds with a 401" 

    end

    context "the user is not allowed to view the shipment" do
      it "does nothing" 


      it "responds with a 401" 

    end
  end

  describe "transfers" do
    let(:user) { create(:admin_user, spree_api_key: 'abc123') }
    let(:current_api_user) { user }
    let(:stock_item) { create(:stock_item, backorderable: false) }
    let(:variant) { stock_item.variant }

    let(:order) do
      create(
        :completed_order_with_totals,
        user: user,
        line_items_attributes: [
          {
            variant: variant
          }
        ]
      )
    end

    let(:shipment) { order.shipments.first }

    describe "POST /api/shipments/transfer_to_location" do
      let(:stock_location) { create(:stock_location) }
      let(:source_shipment) { order.shipments.first }
      let(:parsed_response) { JSON.parse(response.body) }
      let(:stock_location_id) { stock_location.id }

      subject do
        post "/api/shipments/transfer_to_location.json",
          params: {
            original_shipment_number: source_shipment.number,
            stock_location_id: stock_location_id,
            quantity: 1,
            variant_id: variant.id,
            token: user.spree_api_key
          }
      end

      context "for a successful transfer" do
        before do
          stock_location.restock(variant, 1)
        end

        it "returns the correct message" 

      end

      context "for an unsuccessful transfer" do
        before do
          source_shipment
          variant
          stock_location.stock_items.update_all(backorderable: false)
        end

        it "returns the correct message" 

      end

      context "if the source shipment can not be found" do
        let(:stock_location_id) { 9999 }

        it "returns a 404" 

      end

      context "if the user can not update shipments" do
        let(:user) { create(:user, spree_api_key: 'abc123') }

        custom_authorization! do |_|
          can :read, Spree::Shipment
          cannot :update, Spree::Shipment
          can :create, Spree::Shipment
          can :destroy, Spree::Shipment
        end

        it "is not authorized" 

      end

      context "if the user can not destroy shipments" do
        let(:user) { create(:user, spree_api_key: 'abc123') }

        custom_authorization! do |_|
          can :read, Spree::Shipment
          can :update, Spree::Shipment
          cannot :destroy, Spree::Shipment
          can :create, Spree::Shipment
        end

        it "is not authorized" 

      end
    end

    describe "POST /api/shipments/transfer_to_shipment" do
      let(:stock_location) { create(:stock_location) }
      let(:source_shipment) { order.shipments.first }
      let(:target_shipment) { order.shipments.create(stock_location: stock_location) }
      let(:parsed_response) { JSON.parse(response.body) }
      let(:source_shipment_number) { source_shipment.number }

      subject do
        post "/api/shipments/transfer_to_shipment.json",
          params: {
            original_shipment_number: source_shipment_number,
            target_shipment_number: target_shipment.number,
            quantity: 1,
            variant_id: variant.id,
            token: user.spree_api_key
          }
      end

      context "for a successful transfer" do
        before do
          stock_location.restock(variant, 1)
        end

        it "returns the correct message" 

      end

      context "if the source shipment can not be found" do
        let(:source_shipment_number) { 9999 }

        it "returns a 404" 

      end
    end
  end
end

