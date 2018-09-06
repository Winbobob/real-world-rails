require 'spec_helper'

describe 'Properties', type: :feature, js: true do
  stub_authorization!

  before do
    visit spree.admin_products_path
  end

  context 'Property index' do
    before do
      create(:property, name: 'shirt size', presentation: 'size')
      create(:property, name: 'shirt fit', presentation: 'fit')
      visit spree.admin_properties_path
    end

    context 'listing product properties' do
      it 'lists the existing product properties' 

    end

    context 'searching properties' do
      it 'lists properties matching search query' 

    end
  end

  context 'creating a property' do
    it 'allows an admin to create a new product property' 

  end

  context 'editing a property' do
    before do
      create(:property)
      visit spree.admin_properties_path
      within_row(1) { click_icon :edit }
    end

    it 'allows an admin to edit an existing product property' 


    it 'shows validation errors' 

  end

  context 'linking a property to a product' do
    before do
      create(:product)
      visit spree.admin_products_path
      click_icon :edit
      within('#sidebar') do
        click_link 'Properties'
      end
    end

    # Regression test for #2279
    it 'successfully create and then remove product property' 


    # Regression test for #4466
    it 'successfully remove and create a product property at the same time' 


    def fill_in_property
      fill_in 'product_product_properties_attributes_0_property_name', with: 'A Property'
      fill_in 'product_product_properties_attributes_0_value', with: 'A Value'
      click_button 'Update'
      within('#sidebar') do
        click_link 'Properties'
      end
    end

    def delete_product_property
      spree_accept_alert do
        click_icon :delete
        wait_for_ajax
      end
    end

    def check_property_row_count(expected_row_count)
      within('#sidebar') do
        click_link 'Properties'
      end
      expect(page).to have_css('tbody#product_properties')
      expect(all('tbody#product_properties tr').count).to eq(expected_row_count)
    end
  end
end

