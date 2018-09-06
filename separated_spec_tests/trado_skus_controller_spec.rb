require 'rails_helper'

describe Admin::SkusController do

    store_setting
    login_admin

    describe 'GET #new' do
        let!(:product) { create(:product_sku, active: true) }

        it "should create a new Sku record" 


        it "should create a new SkuVariant record" 


        it "should render the new partial" 

    end

    describe 'POST #create' do
        let!(:product) { create(:product_sku, active: true) }

        context "with valid attributes" do

            it "should save the new sku in the database" 

            it "should render the create partial"  do
                xhr :post, :create, product_id: product.id, sku: attributes_for(:sku)
                expect(response).to render_template(partial: 'admin/products/skus/_single')
            end
        end
        context "with invalid attributes" do
            let(:errors) { ["Code can't be blank"] }

            it "should not save the new sku in the database" 


            it "should return a JSON object of errors" 


            it "should return a 422 status code" 

        end 
    end

    describe 'GET #edit' do
        let(:product) { create(:product) }
        let(:sku) { create(:sku, product_id: product.id) }

        it "should assign the requested SKU to @form_sku" 


        it "should render the edit partial" 

    end

    describe 'PATCH #update' do
        let!(:product) { create(:product, active: true) }
        let!(:sku) { create(:sku, code: 'sku123', active: true, product_id: product.id) }
        let(:new_sku) { attributes_for(:sku, active: true, product_id: product.id) }
        let(:order) { create(:order) }
        before(:each) do
            create(:sku_variant, sku_id: sku.id)
        end

        context "if the sku has associated orders" do
            before(:each) do
                create(:order_item, sku_id: sku.id, order_id: order.id)
            end

            it "should set the sku as inactive" 


            it "should assign new sku attributes to @sku" 


            it "should assign the inactive old sku to @old_sku" 


            it "should assign the old_sku product_id to @sku" 

        end

        context "with valid attributes" do
            let!(:stock_adjustment) { create(:stock_adjustment, sku_id: sku.id, description: 'New stock #1') }

            context "if the sku has associated orders" do
                before(:each) do
                    create(:order_item, sku_id: sku.id, order_id: order.id)
                    create_list(:cart_item, 3, sku_id: sku.id)
                end

                it "should delete an related cart items from the database" 


                it "should save a new sku to the database" 


                it "should duplicate and save all stock adjustment records" 


                it "should duplicate and save all sku variant records" 


                it "should have the correct stock adjustment data" 

            end

            context "if the sku has no associated orders" do
                let(:new_sku) { attributes_for(:sku, active: true) }

                it "should locate the requested @sku" 


                it "should update the sku in the database" 


                it "should not duplicate any stock adjustment records" 


                it "should not duplicate any sku variant records" 


                it "should not save a new sku to the database" 

            end
            
            it "should render the success partial" 

        end
        context "with invalid attributes" do 
            let(:new_sku) { attributes_for(:invalid_sku, active: true) }
            before(:each) do
                xhr :patch, :update, product_id: product.id, id: sku.id, sku: new_sku
            end

            it "should not update the sku" 


            it "should assign the old_sku to @form_sku" 


            it "should set the old_sku as active" 


            it "should assign the @form_sku attributes with the current params sku" 

        end 
    end

    describe 'DELETE #destroy' do
        let(:product) { create(:product) }
        let(:sku) { create(:sku, active: true, product_id: product.id) }
        let(:order) { create(:order) }
        let(:cart) { create(:cart) }

        context "if the parent product has more than one SKU" do
            before(:each) do
                create(:sku, active: true, product_id: sku.product.id)
            end

            context "if the sku has associated orders" do
                before(:each) do
                    create(:order_item, order_id: order.id, sku_id: sku.id)
                end

                it "should set the sku as inactive" 


                it "should not delete the SKU from the database" 

            end

            context "if the sku has no associated orders" do

                it "deletes the sku from the database"  do
                    expect {
                        xhr :delete, :destroy, product_id: product.id, id: sku.id
                    }.to change(Sku, :count).by(-1)
                end
            end

            context "if the sku has associated carts" do
                before(:each) do
                    create(:cart_item, cart_id: cart.id, sku_id: sku.id)
                end

                it "should delete all associated cart item skus from the database" 

            end

            it "should render the destroy partial" 

        end
    end
end

