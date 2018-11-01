require 'rails_helper'

describe Admin::OrdersController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:order_1) { create(:complete_order, created_at: 2.hours.ago) }
        let!(:order_2) { create(:complete_order, created_at: Time.current) }

        it "should populate an array of all orders" 

        it "should render the :index template" 

    end

    describe 'GET #show' do
        let(:order) { create(:complete_order) }

        it "should assign the requested order to @order" 

    end

    describe 'GET #edit' do
        let!(:order) { create(:complete_order) }

        it "should assign the requested order to @order" 

    end

    describe 'PUT #update' do
        let!(:order) { create(:complete_order, actual_shipping_cost: '2.55') }

        it "should assign the requested order to @order" 


        context "with valid attributes" do

            it "should update the order" 


            it "should send a new tracking email", broken: true do
                expect{
                    xhr :patch, :update, id: order.id, order: attributes_for(:order, consignment_number: '1111TT5566')
                }.to change {
                    ActionMailer::Base.deliveries.count
                }.by(1)
            end
        end

        context "with invalid attributes" do
            let!(:order) { create(:complete_order, shipping_date: Time.current) }
            let(:errors) { ["Shipping date can't be blank"] }

            it "should not update the order" 


            it "should return a JSON object of errors" 


            it "should return a 422 status code" 

        end
    end

    describe "DELETE #cancel" do
        let(:order) { create(:complete_order) }
        let(:sku) { create(:sku, stock: 100) }
        before(:each) do
            create(:order_item, sku: sku, order: order, quantity: 5)
        end

        it "should assign the requested order to @order" 


        it "should set the order status as 'cancelled'" 


        it "should restore stock to associated skus" 

    end
end

