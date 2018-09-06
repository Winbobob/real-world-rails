require 'spec_helper'

describe 'Orders Listing', type: :feature do
  stub_authorization!

  let(:order1) do
    create :order_with_line_items,
           created_at: 1.day.from_now,
           completed_at: 1.day.from_now,
           considered_risky: true,
           number: 'R100'
  end

  let(:order2) do
    create :order,
           created_at: 1.day.ago,
           completed_at: 1.day.ago,
           number: 'R200'
  end

  before do
    allow_any_instance_of(Spree::OrderInventory).to receive(:add_to_shipment)
    # create the order instances after stubbing the `add_to_shipment` method
    order1
    order2
    visit spree.admin_orders_path
  end

  describe 'listing orders' do
    it 'lists existing orders' 


    it 'is able to sort the orders listing' 

  end

  describe 'searching orders' do
    it 'is able to search orders' 


    it 'returns both complete and incomplete orders when only complete orders is not checked' 


    it 'is able to filter risky orders' 


    it 'is able to filter on variant_sku' 


    context 'when pagination is really short' do
      before do
        @old_per_page = Spree::Config[:admin_orders_per_page]
        Spree::Config[:admin_orders_per_page] = 1
      end

      after do
        Spree::Config[:admin_orders_per_page] = @old_per_page
      end

      # Regression test for #4004
      it 'is able to go from page to page for incomplete orders' 

    end

    it 'is able to search orders using only completed at input' 


    context 'filter on promotions' do
      let!(:promotion) { create(:promotion_with_item_adjustment) }

      before do
        order1.promotions << promotion
        order1.save
        visit spree.admin_orders_path
      end

      it 'only shows the orders with the selected promotion' 

    end

    it 'is able to apply a ransack filter by clicking a quickfilter icon', js: true do
      label_pending = page.find '.label-pending'
      parent_td = label_pending.find(:xpath, '..')

      # Click the quick filter Pending for order #R100
      within(parent_td) do
        find('.js-add-filter').click
      end

      expect(page).to have_content('R100')
      expect(page).not_to have_content('R200')
    end

    context 'filter on shipment state' do
      it 'only shows the orders with the selected shipment state' 

    end

    context 'filter on payment state' do
      it 'only shows the orders with the selected payment state' 

    end

    # regression tests for https://github.com/spree/spree/issues/6888
    context 'per page dropdown', js: true do
      before do
        select '45', from: 'per_page'
        wait_for_ajax
        expect(page).to have_select('per_page', selected: '45')
        expect(page).to have_selector(:css, 'select.per-page-selected-45')
      end

      it 'adds per_page parameter to url' 


      it 'can be used with search filtering' 

    end
  end
end

