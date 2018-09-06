require 'spec_helper'

describe 'Order - State Changes', type: :feature do
  stub_authorization!

  let!(:order) { create(:order_with_line_items) }

  context 'for completed order' do
    before do
      order.next!
      visit spree.admin_order_state_changes_path(order)
    end
    it 'are viewable' 

  end
end

