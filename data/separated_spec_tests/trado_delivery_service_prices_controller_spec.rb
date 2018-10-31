require 'rails_helper'

describe Admin::DeliveryServicePricesController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:delivery_service) { create(:delivery_service, active: true) }
        let!(:delivery_service_price_1) { create(:delivery_service_price, delivery_service_id: delivery_service.id) }
        let!(:delivery_service_price_2) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }
        let!(:delivery_service_price_3) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }

        it "populates an array of active delivery_service_prices" 

        it "renders the :index template" 

    end

    describe 'GET #new' do
        let(:delivery_service) { create(:delivery_service, active: true) }

        it "assigns a new delivery_service_price to @delivery_service_price" 

        it "renders the :new template" 

    end

    describe 'GET #edit' do
        let!(:delivery_service) { create(:delivery_service, active: true) }
        let(:delivery_service_price) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }

        it "assigns the requested delivery service to @delivery_service_price" 

        it "renders the :edit template" 

    end
    
    describe "POST #create" do
        let!(:delivery_service) { create(:delivery_service, active: true) }

        context "with valid attributes" do
            it "saves the new delivery service in the database" 

            it "redirects to delivery_service_price#index"  do
                post :create, delivery_service_id: delivery_service.id, delivery_service_price: attributes_for(:delivery_service_price, active: true)
                expect(response).to redirect_to admin_delivery_service_delivery_service_prices_url
            end
        end
        context "with invalid attributes" do
            it "does not save the new delivery_service_price in the database" 

            it "re-renders the :new template" 

        end 
    end

    describe 'PATCH #update' do
        let!(:delivery_service) { create(:delivery_service, active: true) }
        let!(:delivery_service_price) { create(:delivery_service_price, code: 'delivery_service_price #1', active: true, delivery_service_id: delivery_service.id) }
        let(:new_delivery_service_price) { attributes_for(:delivery_service_price, active: true) }

        context "if the delivery_service_price has associated orders" do
            before(:each) do
                create(:order, delivery_id: delivery_service_price.id)
            end

            it "should set the delivery_service_price as inactive" 


            it "should assign new delivery_service_price attributes to @delivery_service_price" 


            it "should assign the inactive old delivery_service_price to @old_delivery_service_price" 


            it "should assign the old_delivery_service_price delivery_service_id to @delivery_service_price" 

        end

        context "with valid attributes" do

            context "if the delivery_service_price has associated orders" do
                let(:new_delivery_service_price) { attributes_for(:delivery_service_price, active: true) }
                before(:each) do
                    create(:order, delivery_id: delivery_service_price.id)
                end

                it "should save a new delivery_service_price to the database" 

            end

            context "if the delivery_service_price has no associated orders" do

                it "should locate the requested @delivery_service_price" 


                it "should update the delivery_service_price in the database" 

            end
            
            it "redirects to the delivery_service_prices#index" 

        end
        context "with invalid attributes" do 
            let(:new_delivery_service_price) { attributes_for(:invalid_delivery_service_price, active: true) }
            before(:each) do
                patch :update, id: delivery_service_price.id, delivery_service_id: delivery_service.id, delivery_service_price: new_delivery_service_price
            end

            it "should not update the delivery_service_price" 


            it "should assign the old_delivery_service_price to @form_delivery_service_price" 


            it "should set the old_delivery_service_price as active" 


            it "should assign the @form_delivery_service_price attributes with the current params delivery_service_price" 


            it "should re-render the #edit template" 

        end 
    end
    
    describe 'DELETE #destroy' do
        let!(:delivery_service) { create(:delivery_service, active: true) }
        let!(:delivery_service_price) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }

        context "if there are no associated orders" do
        
            context "if there is more than one delivery_service_price in the database" do
                before :each do
                    create(:delivery_service_price, active: true)
                end

                it "should flash a success message" 


                it "should delete the delivery_service_price from the database"  do
                    expect {
                        delete :destroy, id: delivery_service_price.id, delivery_service_id: delivery_service.id
                    }.to change(DeliveryServicePrice, :count).by(-1)
                end
            end

            context "if there is only one delivery_service_price in the database" do

                it "should flash a error message" 


                it "should not delete the delivery_service_price from the database"  do
                    expect {
                        delete :destroy, id: delivery_service_price.id, delivery_service_id: delivery_service.id
                    }.to change(DeliveryServicePrice, :count).by(0)
                end
            end
        end

        context "if there are associated orders" do
            before(:each) do
                create(:order, delivery_id: delivery_service_price.id)
            end

            it "should flash a success message" 


            it "should set the delivery_service_price as inactive" 

            
            it "should not delete the delivery_service_price from the database"  do
                expect {
                    delete :destroy, id: delivery_service_price.id, delivery_service_id: delivery_service.id
                }.to change(DeliveryServicePrice, :count).by(0)
            end
        end

        it "should redirect to delivery_service_prices#index" 

    end
end

