require 'rails_helper'

describe CartItemsController, broken: true do

    store_setting

    describe 'POST #create' do
        let!(:sku) { create(:sku) }
        let!(:cart) { create(:cart) }
        before(:each) do
            # session[:payment_type] = 'paypal'
            stub_current_cart(cart)
        end

        it "should assign the related SKU to @sku" 


        it "should assign the updated cart item to @cart_item" do 
            xhr :post, :create, cart_id: cart.id, cart_item: attributes_for(:cart_item, quantity: 4, sku_id: sku.id)
            expect(assigns(:cart_item).sku).to eq sku
            expect(assigns(:cart_item).quantity).to eq 4
        end

        it "should save a new cart item to the database" 


        context "with valid attributes" do

            it "should render the update partial" 

        end

        context "if the product has an accessory" do
            let!(:accessory) { create(:accessory) }

            it "should save a new cart item accessory to the database" 

        end

        context "if the cart item quantity is less than the SKU stock count" do
            let!(:sku) { create(:sku, stock: 15) }

            it "should render the update partial" 

        end

        context "if the cart item quantity is more than the SKU stock count" do
            let!(:sku) { create(:sku, stock: 15) }

            it "should render the cart items validate failed partial" 

        end

        # it "should set the payment_type session store value to nil" do
        #     xhr :post, :create, cart_id: cart.id, cart_item: attributes_for(:cart_item, sku_id: sku.id)
        #     expect(session[:payment_type]).to eq nil
        # end
    end

    describe 'PATCH #update' do
        let!(:cart) { create(:cart) }
        let!(:cart_item) { create(:cart_item, cart: cart) }
        before(:each) do
            stub_current_cart(cart)
        end

        context "if the cart item has an associated cart item accessory" do
            let!(:cart_item) { create(:accessory_cart_item, cart: cart) }

            it "should assign it's accessory to @accessory" 

        end

        context "if the cart item has no associated cart item accessory" do

            it "should assign @accessory to be nil" 

        end

        it "should update the weight of the cart item" 


        it "should update the quantity of the cart item" 


        context "if the cart item quantity is zero" do
            let!(:cart_item) { create(:cart_item, quantity: 4, cart: cart) }

            it "should destroy the cart item" 

        end

        context "if the cart item quantity is more than zero and the cart item updates successfully" do
            let!(:cart_item) { create(:cart_item, quantity: 8, cart: cart) }

            it "should render the update partial" 

        end

        context "if the cart item quantity is less than the SKU stock count" do
            let!(:sku) { create(:sku, stock: 15) }
            let!(:cart_item) { create(:cart_item, sku_id: sku.id, quantity: 14, cart: cart) }

            it "should render the update partial" 

        end

        context "if the cart item quantity is more than the SKU stock count" do
            let!(:sku) { create(:sku, stock: 15) }
            let!(:cart_item) { create(:cart_item, sku_id: sku.id, quantity: 14, cart: cart) }

            it "should render the cart items validate failed partial" 

        end 
    end

    describe 'DELETE #destroy' do
        let!(:cart) { create(:cart) }
        let!(:cart_item) { create(:cart_item, cart: cart) }

        it "should delete the cart item" do            
            expect{
                xhr :delete, :destroy, cart_id: cart.id, id: cart_item.id
            }.to change(CartItem, :count).by(-1)
        end

        it "should render the update partial" 

    end
end

