require 'spec_helper'

describe 'Stock Management', type: :feature, js: true do
  stub_authorization!

  context 'given a product with a variant and a stock location' do
    let!(:stock_location) { create(:stock_location, name: 'Default') }
    let!(:product) { create(:product, name: 'apache baseball cap', price: 10) }
    let!(:variant) { product.master }

    before do
      stock_location.stock_item(variant).update_column(:count_on_hand, 10)
      visit spree.stock_admin_product_path(product)
    end

    context "toggle backorderable for a variant's stock item" do
      let(:backorderable) { find '.stock_item_backorderable' }

      before do
        expect(backorderable).to be_checked
        backorderable.set(false)
        wait_for_ajax
      end

      it 'persists the value when page reload' 

    end

    context "toggle track inventory for a variant's stock item" do
      let(:track_inventory) { find '.track_inventory_checkbox' }

      before do
        expect(track_inventory).to be_checked
        track_inventory.set(false)
        wait_for_ajax
      end

      it 'persists the value when page reloaded' 

    end

    # Regression test for #2896
    # The regression was that unchecking the last checkbox caused a redirect
    # to happen. By ensuring that we're still on an /admin/products URL, we
    # assert that the redirect is *not* happening.
    it 'can toggle backorderable for the second variant stock item' 


    it 'can create a new stock movement' 


    it 'can create a new negative stock movement' 


    context 'with multiple variants' do
      let!(:variant) { create(:variant, product: product, sku: 'SPREEC') }

      before do
        variant.stock_items.first.update_column(:count_on_hand, 30)
        visit current_url
      end

      it 'can create a new stock movement for the specified variant' 

    end

    # Regression test for #3304
    context 'with no stock location' do
      let(:product) { create(:product, name: 'apache baseball cap', price: 10) }
      let(:variant) { create(:variant, product: product, sku: 'FOOBAR') }

      before do
        Spree::StockLocation.delete_all

        visit spree.stock_admin_product_path(product)
      end

      it 'redirects to stock locations page', js: false do
        expect(page).to have_content(Spree.t(:stock_management_requires_a_stock_location))
        expect(page.current_url).to include('admin/stock_locations')
      end
    end
  end
end

