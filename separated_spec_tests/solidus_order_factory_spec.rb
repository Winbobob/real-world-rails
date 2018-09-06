# frozen_string_literal: true

require 'rails_helper'
require 'spree/testing_support/factories/order_factory'

RSpec.shared_examples "shipping methods are assigned" do
  context "given a shipping method" do
    let(:shipping_method) { create(:shipping_method) }

    it "assigns the shipping method when created" 


    it "assigns the shipping method when built" 

  end
end

RSpec.shared_examples "an order with line items factory" do |expected_order_state, expected_inventory_unit_state|
  # This factory cannot be built correctly because Shipment#set_up_inventory
  # requires records to be saved.
  context "when created" do
    let(:stock_location) { create(:stock_location) }
    let(:first_variant) { create(:variant) }
    let(:second_variant) { create(:variant) }
    let(:shipping_method) { create(:shipping_method) }
    let(:order) do
      create(
        factory,
        stock_location: stock_location,
        line_items_attributes: [
          { variant: first_variant, quantity: 1, price: 1 },
          { variant: second_variant, quantity: 2, price: 2 }
        ],
        shipment_cost: 3,
        shipping_method: shipping_method
      )
    end

    it "has the expected attributes" 

  end

  context 'when shipments should be taxed' do
    let!(:ship_address) { create(:address) }
    let!(:tax_zone) { create(:global_zone) } # will include the above address
    let!(:tax_rate) { create(:tax_rate, amount: 0.10, zone: tax_zone, tax_categories: [tax_category]) }

    let(:tax_category) { create(:tax_category) }
    let(:shipping_method) { create(:shipping_method, tax_category: tax_category, zones: [tax_zone]) }

    it 'shipments get a tax adjustment' 

  end
end
RSpec.describe 'order factory' do
  let(:factory_class) { Spree::Order }

  describe 'plain order' do
    let(:factory) { :order }

    it_behaves_like 'a working factory'

    shared_examples "it has the expected attributes" do
      it do
        aggregate_failures do
          expect(order.bill_address).to be_present
          expect(order.ship_address).to be_present
          expect(order.user).to be_present
          expect(order.email).to be_present
          expect(order.email).to eq(order.user.email)
          expect(order.state).to eq "cart"
          expect(order.store).to be_present
          expect(order).not_to be_completed
        end
      end
    end

    context "when built" do
      let(:order) { build(factory) }
      it_behaves_like "it has the expected attributes"
    end

    context "when created" do
      let(:order) { create(factory) }
      it_behaves_like "it has the expected attributes"
    end
  end

  describe 'order with totals' do
    let(:factory) { :order_with_totals }

    it_behaves_like 'a working factory'

    context "when built" do
      let(:order) { build(factory, line_items_price: 77) }

      it "has all the expected attributes but total" 

    end

    context "when created" do
      let(:order) { create(factory, line_items_price: 77) }

      it "has the expected attributes" 

    end
  end

  describe 'order with line items' do
    let(:factory) { :order_with_line_items }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "cart", "on_hand"
    it_behaves_like 'shipping methods are assigned'
  end

  describe 'completed order with promotion' do
    let(:factory) { :completed_order_with_promotion }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "complete", "on_hand"
    it_behaves_like 'shipping methods are assigned'

    it "has the expected attributes" 


    context 'with a promotion with an action' do
      let(:promotion) { create(:promotion, :with_line_item_adjustment) }
      it "has the expected attributes" 

    end
  end

  describe 'order ready to complete' do
    let(:factory) { :order_ready_to_complete }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "confirm", "on_hand"
    it_behaves_like 'shipping methods are assigned'

    it "is completable" 

  end

  describe 'completed order with totals' do
    let(:factory) { :completed_order_with_totals }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "complete", "on_hand"
    it_behaves_like 'shipping methods are assigned'

    it "has the expected attributes" 

  end

  describe 'completed order with pending payment' do
    let(:factory) { :completed_order_with_pending_payment }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "complete", "on_hand"
    it_behaves_like 'shipping methods are assigned'

    it "has the expected attributes" 

  end

  describe 'order ready to ship' do
    let(:factory) { :order_ready_to_ship }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "complete", "on_hand"
    it_behaves_like 'shipping methods are assigned'

    it "has the expected attributes" 


    it "can be shipped" 

  end

  describe 'shipped order' do
    let(:factory) { :shipped_order }

    it_behaves_like 'a working factory'
    it_behaves_like 'an order with line items factory', "complete", "shipped"
    it_behaves_like 'shipping methods are assigned'

    it "has the expected attributes" 

  end
end

