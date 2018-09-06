# frozen_string_literal: true

require 'spec_helper'

feature 'Promotion with product rule', js: true do
  stub_authorization!

  given!(:product) { create :product, name: "BlamCo Mac & Cheese", sku: "PRODUCT_SKU" }
  given!(:variant) { create :variant, sku: "VARIANT_SKU", product: product }
  given!(:option_value) { variant.option_values.first }

  given(:promotion) { create :promotion }

  def add_promotion_rule_of_type(type)
    select type, from: "Add rule of type"
    within("#rules_container") { click_button "Add" }
  end

  background do
    visit spree.edit_admin_promotion_path(promotion)
    add_promotion_rule_of_type("Product(s)")
  end

  it "can select by product sku" 


  it "can select by variant sku" 


  it "can select by product name" 

end
