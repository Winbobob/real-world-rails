# frozen_string_literal: true

require 'spec_helper'

describe "Properties", type: :feature do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
    click_nav "Products"
  end

  context "Property index" do
    before do
      create(:property, name: 'shirt size', presentation: 'size')
      create(:property, name: 'shirt fit', presentation: 'fit')
      click_link "Property Types"
    end

    context "listing product properties" do
      it "should list the existing product properties" 

    end

    context "searching properties" do
      it 'should list properties matching search query', js: true do
        fill_in "q_name_cont", with: "size"
        click_button 'Search'

        expect(page).to have_content("shirt size")
        expect(page).not_to have_content("shirt fit")
      end
    end
  end

  context "creating a property" do
    it "should allow an admin to create a new product property", js: true do
      click_link "Property Types"
      click_link "new_property_link"
      within('#new_property') { expect(page).to have_content("New Property Type") }

      fill_in "property_name", with: "color of band"
      fill_in "property_presentation", with: "color"
      click_button "Create"
      expect(page).to have_content("successfully created!")
    end
  end

  context "editing a property type" do
    before(:each) do
      create(:property)
      click_link "Property Types"
      within_row(1) { click_icon :edit }
    end

    it "should allow an admin to edit an existing product property" 


    it "should show validation errors" 

  end

  context "linking a property to a product", js: true do
    before do
      create(:product)
      visit spree.admin_products_path
      click_icon :edit
      click_link "Product Properties"
    end

    # Regression test for https://github.com/spree/spree/issues/2279
    it "successfully create and then remove product property" 


    # Regression test for https://github.com/spree/spree/issues/4466
    it "successfully remove and create a product property at the same time" 


    def fill_in_property
      expect(page).to have_content('Products')
      fill_in "product_product_properties_attributes_0_property_name", with: "A Property"
      fill_in "product_product_properties_attributes_0_value", with: "A Value"
      click_button "Update"
      click_link "Product Properties"
    end

    def delete_product_property
      accept_alert do
        click_icon :trash
      end
      expect(page).to have_content 'successfully removed'
    end

    def check_property_row_count(expected_row_count)
      click_link "Product Properties"
      expect(page).to have_css("tbody#product_properties tr", count: expected_row_count)
    end
  end
end

