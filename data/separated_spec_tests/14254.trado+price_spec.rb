require 'rails_helper'

describe Store::Price do

    store_setting

    describe "When converting a price for third party services" do

        context "if the args array has a 'gross' string value" do
            let(:sku) { create(:sku, price: '11.50') }
            
            it "should return a decimal price with tax" 

        end

        context "if the args array does not have a 'gross' string value" do
            let(:sku) { create(:sku, price: '22.67') }
            
            it "should return a decimal price without tax" 

        end
    end

    describe "When rendering a single price for a view" do

        context "if the args array has a 'gross' string value" do
            let(:sku) { create(:sku, price: '11.50') }
            
            it "should return a formatted decimal price with tax" 

        end

        context "if the args array does not have a 'gross' string value" do
            let(:sku) { create(:sku, price: '22.67') }
            
            it "should return a formatted decimal price without tax" 

        end
    end

    describe "When rendering the range of a price for a view" do
        let!(:product) { create(:product, active: true) }
        let!(:sku) { create(:sku, price: '109.93', active: true, product_id: product.id) }
        let!(:sku_2) { create(:sku, active: true, product_id: product.id) }

        context "if the tax breakdown Store setting is true" do            
            before(:each) do
                StoreSetting.destroy_all
                create(:store_setting, tax_breakdown: true, tax_name: 'VAT')
                Store.settings
            end

            it "should have the correct elements" 

        end

        context "if the tax breakdown Store setting is false" do
            before(:each) do
                StoreSetting.destroy_all
                create(:store_setting, tax_breakdown: false, tax_name: 'VAT')
                Store.settings
            end

            it "should have the correct elements" 

        end
    end

    describe "When rendering the markup of a price for a view" do
        let!(:sku) { create(:sku, price: '48.93') }

        context "if the tax breakdown Store setting is true" do
            before(:each) do
                StoreSetting.destroy_all
                create(:store_setting, tax_breakdown: true, tax_name: 'VAT')
                Store.settings
            end

            it "should have the correct elements" 

        end

        context "if the tax breakdown Store setting is false" do

            it "should have the correct elements" 

        end
    end
end

