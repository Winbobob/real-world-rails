require 'rails_helper'

describe Admin::AccessoriesController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:accessory_1) { create(:accessory, active: false) }
        let!(:accessory_2) { create(:accessory, active: true) }
        let!(:accessory_3) { create(:accessory, active: true) }

        it "should populate an array of active accessories" 

        it "should render the :index template" 

    end

    describe 'GET #new' do
        it "should assign a new accessory to @accessory" 

        it "should render the :new template" 

    end

    describe 'GET #edit' do
        let(:accessory) { create(:accessory) }

        it "should assign the requested accessory to @accessory" 

        it "should render the :edit template" 

    end
    
    describe "POST #create" do
        context "with valid attributes" do
            it "should save the new accessory in the database" 

            it "should redirect to accessories#index"  do
                post :create, accessory: attributes_for(:accessory)
                expect(response).to redirect_to admin_accessories_url
            end
        end
        context "with invalid attributes" do
            it "should not save the new accessory in the database" 

            it "should re-render the :new template" 

        end 
    end

    describe 'PATCH #update' do
        let!(:accessory) { create(:accessory, name: 'accessory #1', active: true) }
        let(:new_accessory) { attributes_for(:accessory, active: true) }
        let(:order) { create(:order) }
        let(:order_item) { create(:order_item, order_id: order.id) }

        context "if the accessory has associated orders" do
            before(:each) do
                create(:order_item_accessory, accessory_id: accessory.id, order_item_id: order_item.id)
            end

            it "should set the accessory as inactive" 


            it "should assign new accessory attributes to @accessory" 


            it "should assign the inactive old accessory to @old_accessory" 

        end

        context "with valid attributes" do

            context "if the accessory has associated orders" do
                before(:each) do
                    create(:order_item_accessory, accessory_id: accessory.id, order_item_id: order_item.id)
                    create_list(:accessorisation, 3, accessory_id: accessory.id)
                    create_list(:cart_item_accessory, 4, accessory_id: accessory.id)
                end

                it "should save new tiereds to the database" 


                it "should delete any related cart item accessories from the database" 


                it "should save a new accessory to the database" 

            end

            context "if the accessory has no associated orders" do

                it "should locate the requested @accessory" 


                it "should update the accessory in the database" 


                it "should not save a new accessory to the database" 

            end
            
            it " should redirect to the accessories#index" 

        end
        context "with invalid attributes" do 
            let(:new_accessory) { attributes_for(:invalid_accessory, active: true) }
            before(:each) do
                patch :update, id: accessory.id, accessory: new_accessory
            end

            it "should not update the accessory" 


            it "should assign the old_accessory to @form_accessory" 


            it "should set the old_accessory as active" 


            it "should assign the @form_accessory attributes with the current params accessory" 


            it "should re-render the #edit template" 

        end 
    end
    
    describe 'DELETE #destroy' do
        let!(:accessory) { create(:accessory) }
        let(:order) { create(:order) }
        let(:order_item) { create(:order_item, order_id: order.id) }
        let(:cart) { create(:cart) }
        let(:cart_item) { create(:cart_item, cart_id: cart.id) }

        it "should assign the requested accessory to @accessory" 


        context "if the accessory has associated orders" do
            before(:each) do
                create(:order_item_accessory, accessory_id: accessory.id, order_item_id: order_item.id)
            end

            it "should set the accessory as inactive" 


            it "should not delete the accessory from the database" 

        end

        context "if the accessory has no associated orders" do

            it "should delete the accessory from the database"  do
                expect {
                    delete :destroy, id: accessory.id
                }.to change(Accessory, :count).by(-1)
            end
        end

        context "if the accessory has associated carts" do
            before(:each) do
                create(:cart_item_accessory, accessory_id: accessory.id, cart_item_id: cart_item.id)
            end

            it "should delete all associated cart item accessories from the database" 

        end

        it "should redirect to accessories#index" 

    end
end

