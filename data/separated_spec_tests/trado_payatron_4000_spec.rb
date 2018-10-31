require 'rails_helper'

describe Payatron4000 do

    describe "After creating a transaction record for the associated order" do
        let!(:order) { create(:complete_order) }
        let(:update) { Payatron4000.update_stock(order) }
        before(:each) do
            create(:stock_adjustment, sku_id: order.skus.first.id, stock_total: 20, adjusted_at: 1.day.ago, duplicate: true)
        end

        it "should set the correct stock_total for the new stock_adjustment record" 


        it "should update the relevant SKU's stock" 


        it "should create a new StockAdjustment record" 


        it "should have the correct adjustment in the StockAdjustment record" 


        context "if the order item has no accessory" do
            let(:order) { create(:complete_order) }

            it "should have only the order id in the description" 

        end

        context "if the order item has an accessory" do
            let(:order) { create(:complete_accessory_order) }

            it "should have the order id and accessory name in the description" 

        end
    end

    describe "After successfully completing an order" do
        let!(:cart) { create(:cart) }
        let!(:complete_order) { create(:pending_order, cart_id: cart.id) }
        let(:session) { Hash({:cart_id => cart.id}) }
        let(:destroy_cart) { Payatron4000.destroy_cart(session) }

        it "should destroy the originating cart and it's cart items" 


        it "should set the session[:cart_id] to nil" 


        it "should update all the associated products order count attribute value" 


        it "should decommission an order by setting the cart_id attribute to nil" 

    end

    # describe "When checking if a transaction has a fatal error code" do

    #     it "should return true if the error code is listed as fatal" do
    #         expect(Payatron4000::Paypal.fatal_error_code?(10415)).to eq true
    #     end

    #     it "should return false if the error code is not listed as fatal" do
    #         expect(Payatron4000::Paypal.fatal_error_code?(10413)).to eq false
    #     end
    # end
end

