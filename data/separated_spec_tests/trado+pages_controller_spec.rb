require 'rails_helper'

describe P::PagesController do

    store_setting

    describe 'GET #standard' do
        let!(:page) { create(:standard_page) }

        it 'should assign the requested page to @page' 


        it "should render the :standard template" 

    end

    describe 'GET #contact' do
        let!(:page) { create(:contact_page) }

        it 'should assign the requested page to @page' 


        it 'should render the :contact template' 

    end 

    describe 'POST #send_contact_message' do
        context "with valid attributes" do
            
            it "should send a new email", broken: true do
                expect{
                    xhr :post, :send_contact_message, contact_message: attributes_for(:contact_message)
                }.to change {
                    ActionMailer::Base.deliveries.count
                }.by(1)
            end

            it "should return a 200 status code" 

        end

        context "with invalid attributes" do
            let(:errors) { "{\"email\":[\"is required\",\"is invalid\"]}" }

            it "should not send a new email" 


            it "should return a JSON object of errors" 


            it "should return a 422 status code" 

        end
    end
end

