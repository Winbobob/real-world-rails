require 'rails_helper'

describe Admin::DeliveryServicesController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:delivery_service_1) { create(:delivery_service) }
        let!(:delivery_service_2) { create(:delivery_service, active: true) }
        let!(:delivery_service_3) { create(:delivery_service, active: true) }

        it "populates an array of active delivery_services" 

        it "renders the :index template" 

    end

    describe 'GET #new' do
        it "assigns a new delivery_service to @delivery_service" 

        it "renders the :new template" 

    end

    describe 'GET #edit' do
        let(:delivery_service) { create(:delivery_service, active: true) }

        it "assigns the requested delivery service to @delivery_service" 

        it "renders the :edit template" 

    end
    
    describe "POST #create" do
        context "with valid attributes" do
            it "saves the new delivery service in the database" 

            it "redirects to delivery_service#index"  do
                post :create, delivery_service: attributes_for(:delivery_service, active: true)
                expect(response).to redirect_to admin_delivery_services_url
            end
        end
        context "with invalid attributes" do
            it "does not save the new delivery_service in the database" 

            it "re-renders the :new template" 

        end 
    end

    describe 'PATCH #update' do
        let!(:delivery_service) { create(:delivery_service, name: 'delivery_service #1', active: true) }
        let!(:delivery_service_price) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }
        let(:new_delivery_service) { attributes_for(:delivery_service, active: true) }

        context "if the delivery_service has associated orders" do
            before(:each) do
                create(:order, delivery_id: delivery_service_price.id)
            end

            it "should set the delivery_service as inactive" 


            it "should assign new delivery_service attributes to @delivery_service" 


            it "should assign the inactive old delivery_service to @old_delivery_service" 

        end

        context "with valid attributes" do

            context "if the delivery_service has associated orders" do
                let!(:delivery_service_price_2) { create(:delivery_service_price, delivery_service_id: delivery_service.id) }
                let!(:delivery_service_price_3) { create(:delivery_service_price, delivery_service_id: delivery_service.id) }
                before(:each) do
                    create(:order, delivery_id: delivery_service_price.id)
                    create(:order, delivery_id: delivery_service_price_3.id)
                end

                it "should save a new delivery_service to the database" 


                it "should transfer any active delivery service prices to the new delivery service record" 


                it "should set all the old delivery service prices as inactive" 


                it "should remove any delivery service prices which do not have associated orders from the old delivery service record" 

            end

            context "if the delivery_service has no associated orders" do

                it "should locate the requested @delivery_service" 


                it "should update the delivery_service in the database" 


                it "should not save a new delivery_service to the database" 

            end
            
            it "redirects to the delivery_services#index" 

        end
        context "with invalid attributes" do 
            let(:new_delivery_service) { attributes_for(:invalid_delivery_service, active: true) }
            before(:each) do
                patch :update, id: delivery_service.id, delivery_service: new_delivery_service
            end

            it "should not update the delivery_service" 


            it "should assign the old_delivery_service to @form_delivery_service" 


            it "should set the old_delivery_service as active" 


            it "should assign the @form_delivery_service attributes with the current params delivery_service" 


            it "should re-render the #edit template" 

        end 
    end
    
    describe 'DELETE #destroy' do
        let!(:delivery_service) { create(:delivery_service, active: true) }
        let!(:delivery_service_price) { create(:delivery_service_price, active: true, delivery_service_id: delivery_service.id) }

        context "if there are no associated orders" do
        
            context "if there is more than one delivery_service in the database" do
                before :each do
                    create(:delivery_service, active: true)
                end

                it "should flash a success message" 


                it "should delete the delivery_service from the database"  do
                    expect {
                        delete :destroy, id: delivery_service.id
                    }.to change(DeliveryService, :count).by(-1)
                end
            end

            context "if there is only one delivery_service in the database" do

                it "should flash a error message" 


                it "should not delete the delivery_service from the database"  do
                    expect {
                        delete :destroy, id: delivery_service.id
                    }.to change(DeliveryService, :count).by(0)
                end
            end
        end

        context "if there are associated orders" do
            before(:each) do
                create(:order, delivery_id: delivery_service_price.id)
            end

            it "should flash a success message" 


            it "should set the delivery_service as inactive" 


            it "should not delete the delivery_service from the database"  do
                expect {
                    delete :destroy, id: delivery_service.id
                }.to change(DeliveryService, :count).by(0)
            end
        end

        it "should redirect to delivery_services#index" 

    end
end

