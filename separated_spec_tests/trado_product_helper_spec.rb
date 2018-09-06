require 'rails_helper'

describe ProductHelper do

    store_setting

    describe '#accessory_details' do
        let(:accessory) { create(:accessory, name: 'Accessory #1', price: '8.67') }
        let(:store_setting) { create(:store_setting, tax_breakdown: false) }
        before(:each) do
            StoreSetting.destroy_all
            store_setting
            Store.settings
        end

        it "should return a html_safe string" 

    end

    describe '#product_filter_classes' do

        context "if the product has a category" do
            let!(:category) { create(:category) }
            let(:product) { create(:product, active: true, category_id: category.id) }

            it "should return a string of classes, including product category name" 

        end

        context "if the product is set to featured" do
            let(:product) { create(:product, active: true, featured: true, category_id: nil) }

            it "should return a string of classes, including 'product-featured'" 

        end

        context "if the product has no category and is not set to featured" do
            let(:product) { create(:product, category_id: nil) }

            it "should return a only the product-status class" 

        end
    end

    describe '#render_variants' do
        let!(:sku) { create(:sku) }

        it "should return a string containing all the associated variants to a sku" 

    end

    describe "#check_stock" do

        context "if product is in stock" do
            let!(:product) { create(:product_sku) }

            it "should render in stock text" 

        end

        context "if product is out of stock" do
            let!(:product) { create(:product) }
            let!(:sku) { create(:sku, stock: 5, stock_warning_level: 1, product: product, active: true) }
            before(:each) do
                sku.update(stock: 0)
            end

            it "should render out of stock text" 

        end
    end
end

