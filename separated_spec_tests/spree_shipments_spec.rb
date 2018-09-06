require 'spec_helper'

describe 'Shipments', type: :feature do
  stub_authorization!

  let!(:order) { create(:order_ready_to_ship, number: 'R100', state: 'complete', line_items_count: 5) }

  # Regression test for #4025
  context 'a shipment without a shipping method' do
    before do
      order.shipments.each do |s|
        # Deleting the shipping rates causes there to be no shipping methods
        s.shipping_rates.delete_all
      end
    end

    it 'can still be displayed' 

  end

  context 'shipping an order', js: true do
    before do
      visit spree.admin_orders_path
      within_row(1) do
        click_link 'R100'
      end
    end

    it 'can ship a completed order' 

  end

  context 'moving variants between shipments', js: true do
    before do
      create(:stock_location, name: 'LA')
      visit spree.admin_orders_path
      within_row(1) do
        click_link 'R100'
      end
    end

    it 'can move a variant to a new and to an existing shipment' 

  end
end
