require 'rails_helper'

describe SearchController, broken: true do

    store_setting

    describe 'GET #result' do
        let!(:product) { create(:product_sku_attachment, name: 'product #1', active: true) }

        it "should assign the query search results to @products" 


        it "should render the :result template" 

    end

    describe 'GET #autocomplete' do
        let!(:product) { create(:product_sku_attachment, name: 'product #1', active: true) }

        it "should assign the query search results to @json_products" 

        
        it "should return a 200 status code" 

    end
end

