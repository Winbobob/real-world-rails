require 'spec_helper'

describe 'Adjustments', type: :feature do
  stub_authorization!

  let!(:order) { create(:completed_order_with_totals, line_items_count: 5) }
  let!(:line_item) do
    line_item = order.line_items.first
    # so we can be sure of a determinate price in our assertions
    line_item.update_column(:price, 10)
    line_item
  end

  before do
    create(:tax_adjustment,
            adjustable: line_item,
            state: 'closed',
            order: order,
            label: 'VAT 5%',
            amount: 10)

    order.adjustments.create!(order: order, label: 'Rebate', amount: 10)

    # To ensure the order totals are correct
    order.update_totals
    order.persist_totals

    visit spree.admin_orders_path
    within_row(1) { click_on order.number }
    click_on 'Adjustments'
  end

  after do
    order.reload.all_adjustments.each do |adjustment|
      expect(adjustment.order_id).to equal(order.id)
    end
  end

  context 'admin managing adjustments' do
    it 'displays the correct values for existing order adjustments' 


    it 'only shows eligible adjustments' 

  end

  context 'admin creating a new adjustment' do
    before do
      click_link 'New Adjustment'
    end

    context 'successfully' do
      it 'creates a new adjustment' 

    end

    context 'with validation errors' do
      it 'does not create a new adjustment' 

    end
  end

  context 'admin editing an adjustment', js: true do
    before do
      within_row(2) { click_icon :edit }
    end

    context 'successfully' do
      it 'updates the adjustment' 

    end

    context 'with validation errors' do
      it 'does not update the adjustment' 

    end
  end

  context 'deleting an adjustment' do
    it 'updates the total', js: true do
      spree_accept_alert do
        within_row(2) do
          click_icon(:delete)
          wait_for_ajax
        end
      end

      expect(page).to have_content(/Total: ?\$170\.00/)
    end
  end
end

