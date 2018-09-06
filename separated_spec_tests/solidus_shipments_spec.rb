# frozen_string_literal: true

require 'spec_helper'

describe "Shipments", type: :feature do
  include OrderFeatureHelper

  stub_authorization!

  let!(:order) { create(:order_ready_to_ship, number: "R100", state: "complete", line_items_count: 5) }

  # Regression test for https://github.com/spree/spree/issues/4025
  context "a shipment without a shipping method" do
    before do
      order.shipments.each do |s|
        # Deleting the shipping rates causes there to be no shipping methods
        s.shipping_rates.delete_all
      end
    end

    it "can still be displayed" 

  end

  context "shipping an order", js: true do
    before(:each) do
      visit spree.admin_path
      click_link "Orders"
      within_row(1) do
        click_link "R100"
      end
    end

    def ship_shipment
      find(".ship-shipment-button").click

      expect(page).to have_content("Shipped package")
      expect(order.reload.shipment_state).to eq("shipped")
    end

    it "can ship a completed order" 


    it "doesn't send a shipping confirmation email when ask to suppress the mailer" 

  end

  context "moving variants between shipments", js: true do
    let!(:order) { create(:completed_order_with_pending_payment, number: "R100", state: "complete", line_items_count: 5) }
    let!(:la) { create(:stock_location, name: "LA") }
    before(:each) do
      visit spree.admin_path
      click_link "Orders"
      within_row(1) do
        click_link "R100"
      end
    end

    it "can move a variant to a new and to an existing shipment" 


    context "with a ready-to-ship order" do
      let(:variant) { create(:variant) }
      let!(:order) do
        create(
          :order_ready_to_ship,
          number: "R100",
          line_items_attributes: [{ variant: variant, quantity: 5 }]
        )
      end

      it "can transfer all items to a new location" 

    end
  end
end

