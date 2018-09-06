# frozen_string_literal: true

require 'spec_helper'

describe "Shipping Methods", type: :feature do
  stub_authorization!
  let!(:zone) { create(:global_zone) }
  let!(:shipping_method) { create(:shipping_method, zones: [zone]) }

  before do
    visit spree.admin_path
    click_link "Settings"
    click_link "Shipping"
  end

  context "show" do
    it "should display existing shipping methods" 

  end

  context "create", js: true do
    it "should be able to create a new shipping method" 


    context 'with shipping method having a calculator with array or hash preference type' do
      before do
        class ComplexShipments < Spree::ShippingCalculator
          preference :amount, :decimal
          preference :currency, :string
          preference :mapping, :hash
          preference :list, :array

          def self.description
            "Complex Shipments"
          end
        end
        @calculators = Rails.application.config.spree.calculators.shipping_methods
        Rails.application.config.spree.calculators.shipping_methods = [ComplexShipments]
      end

      after do
        Rails.application.config.spree.calculators.shipping_methods = @calculators
      end

      it "does not show array and hash form fields" 

    end
  end

  # Regression test for https://github.com/spree/spree/issues/1331
  context "update" do
    it "can update the existing calculator", js: true do
      within("#listing_shipping_methods") do
        click_icon :edit
      end

      fill_in 'Amount', with: 20

      click_button "Update"

      expect(page).to have_content 'successfully updated'
      expect(page).to have_field 'Amount', with: '20.0'
    end

    it "can change the calculator", js: true do
      within("#listing_shipping_methods") do
        click_icon :edit
      end

      select 'Flexible Rate per package item', from: 'Base Calculator'

      fill_in 'First Item', with: 10
      fill_in 'Additional Item', with: 20

      click_button "Update"

      expect(page).to have_content 'successfully updated'
      expect(page).to have_field 'First Item', with: '10.0'
      expect(page).to have_field 'Additional Item', with: '20.0'
    end
  end
end

