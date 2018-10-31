# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::StockLocationsController, type: :request do
    let!(:stock_location) { create(:stock_location) }
    let!(:attributes) { [:id, :name, :address1, :address2, :city, :state_id, :state_name, :country_id, :zipcode, :phone, :active] }

    before do
      stub_authentication!
    end

    context "as a user" do
      describe "#index" do
        it "can see active stock locations" 


        it "cannot see inactive stock locations" 

      end

      describe "#show" do
        it "can see active stock locations" 


        it "cannot see inactive stock locations" 

      end

      describe "#create" do
        it "cannot create a new stock location" 

      end

      describe "#update" do
        it "cannot update a stock location" 

      end

      describe "#destroy" do
        it "cannot delete a stock location" 

      end
    end

    context "as an admin" do
      sign_in_as_admin!

      describe "#index" do
        it "can see active stock locations" 


        it "can see inactive stock locations" 


        it "gets stock location information" 


        it 'can control the page size through a parameter' 


        it 'can query the results through a paramter' 

      end

      describe "#show" do
        it "can see active stock locations" 


        it "can see inactive stock locations" 

      end

      describe "#create" do
        it "can create a new stock location" 

      end

      describe "#update" do
        it "can update a stock location" 

      end

      describe "#destroy" do
        it "can delete a stock location" 

      end
    end
  end
end

