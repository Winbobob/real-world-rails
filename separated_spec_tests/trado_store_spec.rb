require 'rails_helper'

describe Store do

    before(:each) { Store.class_variable_set :@@store_settings, nil }

    describe "When utilising store wide settings" do
        let!(:settings) { create(:store_setting) }

        it "should assign a store_settings object to a class variable and return" 

    end

    describe "After modifying store wide settings" do
        let!(:settings) { create(:store_setting) }
        it "should set the store_settings class variable to nil" 

    end

    describe "When using the store tax_rate in calculations" do
        let!(:settings) { create(:store_setting, tax_rate: "15.4") }

        it "should divide the tax_rate value by 100" 

    end

    describe "When calculating positive and negative numbers" do

        context "if its a positive value" do

            it "should return true" 

        end

        context "if its a negative value" do

            it "should return false" 

        end
    end

    describe "When a redundant record is updated or deleted" do
        let(:product) { create(:product, active: true) }

        it "should set the record as inactive" 

    end

    describe "When archiving child records" do
        let!(:product) { create(:product) }
        let!(:skus) { create_list(:sku, 3, product_id: product.id) }

        it "should set all the records as inactive" 

    end

    describe "When the record fails to update" do
        let(:product) { create(:product) }

        it "should set the record as active" 

    end

    describe "When rendering an object's parent class name" do
        let(:variant_type) { create(:variant_type) }

        it "should return a string" 

    end

    describe "When deleting a record" do

        context "if it is the last record" do
            let!(:category) { create(:category) }

            it "should return a failed string message" 


            it "should not delete the record" 

        end

        context "if it is not the last record" do
            let!(:category) { create_list(:category, 3) }

            it "should return a success string message" 

            it "should delete the record" 

        end
    end

    describe "When creating/updating a page" do

        it "should parameterize it's slug attribute, including removing underscores" 

    end

    describe 'When archiving a record' do
        let!(:sku) { create(:sku, active: true) }


        context "if the record has associated carts" do
            before(:each) do
                create(:cart_item, sku_id: sku.id)
            end

            it "should delete the assocaited cart item records" 

        end

        context "if the record has assocaited orders" do
            before(:each) do
                create(:order_item, sku_id: sku.id)
            end

            it "should change the record's active attribute to false" 

        end

        context "if the record does not have associated orders" do

            it "should destroy the record" 

        end
    end

    describe "When building the tracking url" do

        it "should replace the regular expression" 

    end
end

