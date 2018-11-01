require 'spec_helper'

describe Spree::Admin::Orders::CustomerDetailsController, type: :controller do
  include AuthenticationWorkflow

  describe "#update" do
    context "adding customer details via newly created admin order" do
      let!(:user) { create(:user) }
      let(:address) { create(:address) }
      let!(:distributor) { create(:distributor_enterprise) }
      let!(:shipping_method) { create(:shipping_method) }
      let!(:order) {
        create(
            :order_with_totals_and_distribution,
            state: 'cart',
            shipping_method: shipping_method,
            distributor: distributor,
            user: nil,
            email: nil,
            bill_address: nil,
            ship_address: nil,
        )
      }
      let(:address_params) {
        {
          firstname: address.firstname,
          lastname: address.lastname,
          address1: address.address1,
          address2: address.address2,
          city: address.city,
          zipcode: address.zipcode,
          country_id: address.country_id,
          state_id: address.state_id,
          phone: address.phone
        }
      }

      before do
        login_as_enterprise_user [order.distributor]
      end

      context "when adding details of a registered user" do
        it "redirects to shipments on success" 

      end

      context "when adding details of an unregistered user" do
        it "redirects to shipments on success" 

      end
    end
  end
end

