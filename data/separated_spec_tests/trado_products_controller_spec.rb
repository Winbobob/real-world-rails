require 'rails_helper'

describe Admin::ProductsController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:category_1) { create(:category, sorting: 1) }
        let!(:category_2) { create(:category, sorting: 0) }
        let!(:product_1) { create(:product_sku, weighting: 2000, active: true, category_id: category_1.id) }
        let!(:product_2) { create(:product_sku, weighting: 1000, active: true, category_id: category_2.id) }
        let!(:product_3) { create(:product_sku, weighting: 3000, active: false, category_id: category_1.id) }

        it "should populate an array of all products" 


        it "should populate an array of all categories" 


        it "should render the :index template" 

    end

    describe 'GET #new' do
        
        it "should create a new product" 


        it "should redirect to the edit product path" 

    end

    describe 'GET #edit' do
        let(:product) { create(:product_sku, active: true) }

        it "should assign the requested product to @product" 


        it "should render the :edit template" 

    end

    describe 'PATCH #update' do
        let!(:category) { create(:category) }
        let!(:product) { create(:product_sku_attachment, name: 'Product #1', featured: false) }
        let!(:product_attributes) { attributes_for(:product_sku_attachment, category_id: category.id) }

        it "should assign the requested product to @product" 


        context "if the commit type was 'Save'" do

            it "should set the product status to 'draft'" 


            it "should set the correct string for the @message variable" 

        end

        context "if the commit type was 'Publish'" do

            it "should set the product status to 'published'" 


            it "should set the correct string for the message variable" 

        end

        context "with valid attributes" do

            it "should update the associated tags" 



            it "should save the product" 


            it "should redirect to products#index" 

        end

        context "with invalid attributes" do

            it "should not update the product" 


            it "should render the :edit template" 

        end
    end

    describe 'PATCH #autosave' do
        let!(:category) { create(:category) }
        let!(:product) { create(:product_sku_attachment, name: 'Product #1', featured: false) }
        let!(:product_attributes) { attributes_for(:product_sku_attachment, category_id: category.id) }

        it "should assign the requested product to @product" 


        context "with valid attributes" do

            it "should save the product" 


            it "should return 200 status code" 

        end

        context "with invalid attributes" do

            it "should not update the product" 


            it "should return 422 status code" 

        end
    end

    # describe 'DELETE #destroy' do
    #     let!(:product) { create(:product_skus, active: true) }
    #     let(:order) { create(:order) }
    #     let(:cart) { create(:cart) }

    #     it "should assign the requested product to @product" do
    #         delete :destroy, id: product.id
    #         expect(assigns(:product)).to eq product
    #     end

    #     context "if the product has associated orders" do
    #         before(:each) do
    #             product.reload
    #             create(:order_item, sku_id: product.skus.first.id, order_id: order.id)
    #         end

    #         it "should set the product as inactive" do
    #             expect{
    #                 delete :destroy, id: product.id
    #                 product.reload
    #             }.to change{
    #                 product.active
    #             }.from(true).to(false)
    #         end

    #         it "should not delete the product from the database" do
    #             expect{
    #                 delete :destroy, id: product.id
    #             }.to change(Product, :count).by(0)
    #         end

    #         it "should not delete any associated SKUs from the database" do
    #             expect{
    #                 delete :destroy, id: product.id
    #             }.to change(Sku, :count).by(0)
    #         end

    #         it "should set the associated SKUs as inactive" do
    #             delete :destroy, id: product.id
    #             product.reload
    #             expect(product.skus.map(&:active)).to eq [false, false, false]
    #         end
    #     end

    #     context "if the product has no associated orders" do

    #         it "should delete the product from the database"  do
    #             expect {
    #                 delete :destroy, id: product.id
    #             }.to change(Product, :count).by(-1)
    #         end

    #         it "should delete associated SKUs from the database" do
    #             expect{
    #                 delete :destroy, id: product.id
    #             }.to change(Sku, :count).by(-3)
    #         end
    #     end

    #     context "if the product has associated carts" do
    #         before(:each) do
    #             product.reload
    #             create_list(:cart_item, 2, sku_id: product.skus.first.id, cart_id: cart.id)
    #         end

    #         it "should delete all associated cart item products from the database" do
    #             expect{
    #                 delete :destroy, id: product.id
    #             }.to change(CartItem, :count).by(-2)
    #         end
    #     end

    #     it "should redirect to products#index" do
    #         delete :destroy, id: product.id
    #         expect(response).to redirect_to admin_products_url
    #     end
    # end
end

