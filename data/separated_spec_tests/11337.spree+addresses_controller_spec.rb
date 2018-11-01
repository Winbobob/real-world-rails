require 'spec_helper'

module Spree
  describe Api::V1::AddressesController, type: :controller do
    render_views

    before do
      stub_authentication!
      @address = create(:address)
      @order = create(:order, bill_address: @address)
    end

    context 'with their own address' do
      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      it 'gets an address' 


      it 'updates an address' 


      it 'receives the errors object if address is invalid' 

    end

    context 'on an address that does not belong to this order' do
      before do
        @order.bill_address_id = nil
        @order.ship_address = nil
      end

      it 'cannot retrieve address information' 


      it 'cannot update address information' 

    end
  end
end

