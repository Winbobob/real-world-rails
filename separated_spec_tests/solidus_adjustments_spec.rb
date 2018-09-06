# frozen_string_literal: true

require 'spec_helper'

describe "Adjustments", type: :feature do
  stub_authorization!

  let!(:ship_address) { create(:address) }
  let!(:tax_zone) { create(:global_zone) } # will include the above address
  let!(:tax_rate) { create(:tax_rate, amount: 0.20, zone: tax_zone, tax_categories: [tax_category]) }

  let!(:order) do
    create(
      :completed_order_with_totals,
      line_items_attributes: [{ price: 10, variant: variant }] * 5,
      ship_address: ship_address,
    )
  end
  let!(:line_item) { order.line_items[0] }

  let(:tax_category) { create(:tax_category) }
  let(:variant) { create(:variant, tax_category: tax_category) }

  let!(:adjustment) { order.adjustments.create!(order: order, label: 'Rebate', amount: 10) }

  before(:each) do
    order.recalculate

    visit spree.admin_path
    click_link "Orders"
    within_row(1) { click_icon :edit }
    click_link "Adjustments"
  end

  context "admin managing adjustments" do
    it "should display the correct values for existing order adjustments" 


    it "only shows eligible adjustments" 

  end

  context "admin creating a new adjustment" do
    before(:each) do
      click_link "New Adjustment"
    end

    context "successfully" do
      it "should create a new adjustment" 

    end

    context "with validation errors" do
      it "should not create a new adjustment" 

    end
  end

  context "admin editing an adjustment" do
    before(:each) do
      within('table tr', text: 'Rebate') do
        click_icon :edit
      end
    end

    context "successfully" do
      it "should update the adjustment" 

    end

    context "with validation errors" do
      it "should not update the adjustment" 

    end
  end

  context "deleting an adjustment" do
    context 'when the adjustment is finalized' do
      let!(:adjustment) { super().tap(&:finalize!) }

      it 'should not be possible' 

    end

    it "should update the total", js: true do
      accept_alert do
        within('table tr', text: 'Rebate') do
          click_icon(:trash)
        end
      end

      expect(page).to have_content(/Total: ?\$170\.00/)
    end
  end
end

