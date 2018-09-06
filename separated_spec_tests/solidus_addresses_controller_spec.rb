# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::AddressesController, type: :request do
    before do
      stub_authentication!
      @address = create(:address)
      @order = create(:order, bill_address: @address)
    end

    context "with order" do
      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      context "with their own address" do
        it "gets an address" 


        it "update replaces the readonly Address associated to the Order" 


        it "receives the errors object if address is invalid" 

      end
    end

    context "on an address that does not belong to this order" do
      before do
        @order.bill_address_id = nil
        @order.ship_address = nil
      end

      it "cannot retrieve address information" 


      it "cannot update address information" 

    end
  end
end

