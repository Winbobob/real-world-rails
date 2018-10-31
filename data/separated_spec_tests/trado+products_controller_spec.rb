require 'rails_helper'

describe ProductsController do

    store_setting

    describe 'GET #show' do
        let(:category) { create(:category) }
        let(:product) { create(:product_sku_attachment, active: true, category: category) }

        it "should assign the request product to @product" 


        it "should build a new cart item and assign it to @cart_item" 


        context "if the product has an accessory" do
            let(:product) { create(:product_accessory, active: true) }

            it "should build a new cart item accessory and assign it to @cart_item_accessory" 

        end

        context "if the product has no accessories" do
            let(:product) { create(:product_sku_attachment, active: true) }

            it "should set @cart_item_accessory as nil" 

        end

        it "should assign the requested product skus to @skus" 


        it "should render the :show template" 

    end
end

