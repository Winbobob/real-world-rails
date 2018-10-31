require 'spec_helper'

module Api
  describe CustomersController, type: :controller do
    include AuthenticationWorkflow
    include OpenFoodNetwork::ApiHelper
    render_views

    let(:user) { create(:user) }

    describe "index" do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }

      before do
        user.customers << customer1
        allow(controller).to receive(:spree_current_user) { user }
      end

      it "lists customers associated with the current user" 


      context "when the accounts distributor id has been set" do
        before do
          Spree::Config.set(accounts_distributor_id: customer1.enterprise.id)
        end

        it "ignores the customer for that enterprise (if it exists)" 

      end
    end

    describe "#update" do
      let(:customer) { create(:customer, user: user) }
      let(:params) { { format: :json, id: customer.id, customer: { code: '123' } } }

      context "as a user who is not associated with the customer" do
        before do
          allow(controller).to receive(:spree_current_user) { create(:user) }
        end

        it "returns unauthorized" 

      end

      context "as the user associated with the customer" do
        before do
          allow(controller).to receive(:spree_current_user) { user }
        end

        context "when the update request is successful" do
          it "returns the id of the updated customer" 

        end

        context "when the update request fails" do
          before { params[:customer][:email] = '' }

          it "returns a 422, with an error message" 

        end
      end
    end
  end
end

