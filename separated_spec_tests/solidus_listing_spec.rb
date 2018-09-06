# frozen_string_literal: true

require 'spec_helper'

describe "Orders Listing", type: :feature, js: true do
  stub_authorization!

  let!(:promotion) { create(:promotion_with_item_adjustment, code: "vnskseiw") }
  let(:promotion_code) { promotion.codes.first }

  before(:each) do
    allow_any_instance_of(Spree::OrderInventory).to receive(:add_to_shipment)
    @order1 = create(:order_with_line_items, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: "R100")
    @order2 = create(:order, created_at: 1.day.ago, completed_at: 1.day.ago, number: "R200")
    visit spree.admin_orders_path
  end

  it 'displays the new order button' 


  context 'without create permission' do
    custom_authorization! do |_user|
      can :manage, Spree::Order
      cannot :create, Spree::Order
    end

    it 'does not display the new order button' 

  end

  context "listing orders" do
    it "should list existing orders" 


    it "should be able to sort the orders listing" 

  end

  context "searching orders" do
    context "when there are multiple stores" do
      let(:stores) { FactoryBot.create_pair(:store) }

      before do
        stores.each do |store|
          FactoryBot.create(:completed_order_with_totals, number: "R#{store.id}999", store: store)
        end
      end

      it "can find the orders belonging to a specific store" 

    end

    context "when there's a single store" do
      it "should be able to search orders" 


      it "should be able to filter on variant_id" 


      context "when pagination is really short" do
        before do
          @old_per_page = Spree::Config[:orders_per_page]
          Spree::Config[:orders_per_page] = 1
        end

        after do
          Spree::Config[:orders_per_page] = @old_per_page
        end

        # Regression test for https://github.com/spree/spree/issues/4004
        it "should be able to go from page to page for incomplete orders" 

      end

      it "should be able to search orders using only completed at input" 


      context "filter on promotions" do
        before(:each) do
          @order1.order_promotions.build(
            promotion: promotion,
            promotion_code: promotion_code
          )
          @order1.save
          visit spree.admin_orders_path
        end

        it "only shows the orders with the selected promotion" 

      end

      context "when toggling the completed orders checkbox" do
        before do
          create(:order, number: 'R300', completed_at: nil, state: 'cart')
        end

        it "shows both complete and incomplete orders" 

      end
    end
  end
end

