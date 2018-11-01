require 'rails_helper'

describe OrdersController, broken: true do

    store_setting

    describe 'GET #confirm' do
        let!(:order) { create(:addresses_order, express_token: nil, express_payer_id: nil) }
        before(:each) do
            session[:payment_type] = 'paypal'
        end

        it "should assign the order record to @order" 


        it "should assign the order's delivery address to @delivery_address" 


        it "should assign the order's billing address to @billing_address" 


        it "should render the confirm template" 


        it "should update order's express_token attribute" 


        it "should update order's express_payer_id attribute" 


        context "if the payment_type attribute in the session store is nil" do
            before(:each) do
                session[:payment_type] = nil
            end

            it "should redirect to carts#checkout" 

        end

        context "if token parameter is nil" do

            it "should redirect to carts#checkout" 


            it "should render an error flash message" 

        end

        context "if PayerID parameter is nil" do

            it "should redirect to carts#checkout" 


            it "should render an error flash message" 

        end
    end

    describe 'POST #complete' do
        let!(:cart) { create(:full_cart) }
        let!(:order) { create(:order, cart_id: cart.id) }
        before(:each) do
            stub_current_cart(cart)
            Store::PayProvider.any_instance.stub(complete: '/')
        end

        it "should assign the order record to @order" 


        it "should transfer all cart items over to order items" 


        it "should transfer all cart item accessories over to order item accessories" 

    end

    describe 'GET #success' do
        let!(:order) { create(:pending_order) }

        it "should assign the order record to @order" 


        context "if the order's last transaction was pending" do

            it "should render the success template" 

        end

        context "if the order's last transaction was successful" do
            let!(:order) { create(:complete_order)}

            it "should render the success template" 

        end

        context "if the order's last transaction was a failure" do
            let!(:order) { create(:failed_order) }

            it "should redirect to store#home" 

        end
    end

    describe 'GET #failed' do
        let!(:order) { create(:failed_order) }

        it "should assign the order record to @order" 


        context "if the order's last transaction was successful" do
            let!(:order) { create(:complete_order) }

            it "should redirect to store#home" 

        end

        context "if the order's last transaction was pending" do
            let!(:order) { create(:pending_order) }

            it "should redirect to store#home" 

        end

        context "if the order's last transaction was a failure" do

            it "should render the failed template" 

        end
    end

    describe 'GET #retry' do
        let!(:cart) { create(:cart) }
        let!(:order) { create(:fatal_failed_order, cart_id: nil) }
        before(:each) do
            stub_current_cart(cart)
        end

        it "should assign the last transaction record's error_code attribute value to @error_code" 


        context "if the last transaction has a fatal error code" do

            it "should not reassign the cart_id attribute for the order" 

        end

        context "if the last transaction does not have a fatal error code" do
            let!(:order) { create(:failed_order, cart_id: nil) }

            it "should reassign the cart_id attribute for the order" 

        end

        it "should redirect to carts#mycart" 

    end

    describe 'DELETE #destroy' do
        let!(:cart) { create(:cart) }
        let!(:order) { create(:order, cart_id: cart.id) }

        it "should assign the order record to @order" 


        it "should update the cart_id attribute for the order to nil" 


        it "should redirect to the store#home" 

    end
end

