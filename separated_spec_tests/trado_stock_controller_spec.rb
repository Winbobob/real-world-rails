require 'rails_helper'

describe Admin::Products::StockController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:sku_1) { create(:sku, active: true) }
        let!(:sku_2) { create(:sku, active: true) }

        it "should populate an array of all skus" 

        it "should render the :index template" 

    end

    describe 'GET #show' do
        let(:sku) { create(:sku, active: true) }

        it "should assign the requested sku to @sku" 

        it "should render the :show template" 


        it "should assign a new instance of StockAdjustment to @stock_adjustment" 

    end
end

