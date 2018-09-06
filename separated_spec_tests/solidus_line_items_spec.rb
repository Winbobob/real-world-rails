# frozen_string_literal: true

require 'spec_helper'

# Tests for https://github.com/spree/spree/issues/3958's features
describe "Order Line Items", type: :feature, js: true do
  stub_authorization!

  before do
    # Removing the delivery step causes the order page to render a different
    # partial, called _line_items, which shows line items rather than shipments
    allow(Spree::Order).to receive_messages checkout_step_names: [:address, :payment, :confirm, :complete]
  end

  let!(:order) do
    order = create(:order_with_line_items, line_items_count: 1)
    order.shipments.destroy_all
    order
  end

  it "can edit a line item's quantity" 


  it "can delete a line item" 

end

