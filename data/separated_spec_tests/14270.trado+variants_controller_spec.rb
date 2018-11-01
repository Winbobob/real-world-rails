require 'rails_helper'

describe Admin::Skus::VariantsController do

    store_setting
    login_admin

    describe 'GET #new' do
        let!(:product) { create(:product, active: true) }
        let!(:variant_type) { create(:variant_type) }

        it "should assign the associated product to @product" 


        it "should assign all variant types to @variant_types" 


        it "should render the new partial" 

    end

    describe 'POST #create' do
        let!(:product) { create(:product_sku, active: true) }
        let!(:colour_variant_type) { create(:variant_type, name: 'Colour') }
        let!(:size_variant_type) { create(:variant_type, name: 'Size') }

        context "if there are no variants in the parameters array" do

            it "should return an error" 


            it "should return a 422 status code" 

        end

            it "should create the correct number of sku records" 


            it "should create the correct number of sku variant records" 


            it "should have the correct data for the sku variants" 


            it "should render the create partial" 

    end

    describe 'POST #update' do
        let!(:product) { create(:product_sku, active: true) }
        let!(:sku) { create(:sku, active: true, product_id: product.id) }
        let!(:colour_variant_type) { create(:variant_type, name: 'Colour') }
        let!(:size_variant_type) { create(:variant_type, name: 'Size') }
        let!(:variant_500) {create(:sku_variant, name: '500g', sku_id: product.skus.first.id, variant_type_id: size_variant_type.id) }
        let!(:variant_red) { create(:sku_variant, name: 'Red', sku_id: sku.id, variant_type_id: colour_variant_type.id) }
        let!(:variant_1000) { create(:sku_variant, name: '1kg', sku_id: sku.id, variant_type_id: size_variant_type.id) }
        let!(:variant_blue) { create(:sku_variant, name: 'Blue', sku_id: product.skus.first.id, variant_type_id: colour_variant_type.id) }

        it "should remove skus which are associated with variants which need to be deleted" 


        it "should remove variants which are not present in parameters array" 


        it "should have the correct sku variants remaining" 


        it "should render the update partial" 

    end

    describe 'DELETE #destroy' do
        let!(:product) { create(:product_sku, active: true) }

        context "if the skus have associated orders" do
            before(:each) do
                create(:order_item, sku_id: product.skus.first.id)
            end

            it "should active archive all the associated skus" 

        end

        context "if the skus have no associated orders" do

            it "should remove the associated skus from the database" 

        end

        it "should render the destroy partial" 

    end
end

