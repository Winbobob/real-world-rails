# frozen_string_literal: true

require "spec_helper"
require "cancan"

describe Spree::Admin::Orders::CustomerDetailsController, type: :controller do
  context "with authorization" do
    stub_authorization!

    let(:order) { create(:order, number: "R123456789") }

    before { allow(Spree::Order).to receive_message_chain(:includes, :find_by!) { order } }

    context "#update" do
      it "updates + progresses the order" 


      it "does refresh the shipment rates with all shipping methods" 


      # Regression spec
      context 'completed order' do
        let(:order) { create(:shipped_order) }
        let(:attributes) do
          {
            order_id: order.number,
            guest_checkout: 'false',
            user_id: order.user_id,
            order: { email: "foo@bar.com" }
          }
        end

        it 'allows the updating of an email address' 

      end

      context "false guest checkout param" do
        let!(:assigned_user){ create :user }
        it "attempts to associate the user" 

      end

      context "not false guest checkout param" do
        it "does not attempt to associate the user" 

      end
    end
  end
end

