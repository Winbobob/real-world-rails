require 'rails_helper'

describe Admin::Skus::StockAdjustmentsController do

    store_setting
    login_admin

    describe 'GET #new' do
        let(:product) { create(:product) }
        let(:sku) { create(:sku, product_id: product.id) }

        it "should assign the requested SKU to @sku" 


        it "should render a new partial" 

    end

    describe 'POST #create' do
        let(:product) { create(:product) }
        let!(:sku) { create(:sku, product_id: product.id) }

        context "with valid attributes" do

            it "should save a new stock adjustment to the database" 


            it "should render the success partial" 

        end

        context "with invalid attributes" do
            let(:errors) { ["Adjustment can't be blank"] }

            it "should not save the stock adjustment to the database" 


            it "should return a JSON object of errors" 


            it "should return a 422 status code" 

        end
    end
end

