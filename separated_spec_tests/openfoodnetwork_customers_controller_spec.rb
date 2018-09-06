require 'spec_helper'

describe Admin::CustomersController, type: :controller do
  include AuthenticationWorkflow

  describe "index" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:another_enterprise) { create(:distributor_enterprise) }

    context "html" do
      before do
        controller.stub spree_current_user: enterprise.owner
      end

      it "returns an empty @collection" 

    end

    context "json" do
      let!(:customer) { create(:customer, enterprise: enterprise) }

      context "where I manage the enterprise" do
        before do
          controller.stub spree_current_user: enterprise.owner
        end

        context "and enterprise_id is given in params" do
          let(:params) { { format: :json, enterprise_id: enterprise.id } }

          it "scopes @collection to customers of that enterprise" 


          it "serializes the data" 

        end

        context "and enterprise_id is not given in params" do
          it "returns an empty collection" 

        end
      end

      context "and I do not manage the enterprise" do
        before do
          controller.stub spree_current_user: another_enterprise.owner
        end

        it "returns an empty collection" 

      end
    end
  end

  describe "update" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:another_enterprise) { create(:distributor_enterprise) }

    context "json" do
      let!(:customer) { create(:customer, enterprise: enterprise) }

      context "where I manage the customer's enterprise" do
        render_views

        before do
          controller.stub spree_current_user: enterprise.owner
        end

        it "allows me to update the customer" 

      end

      context "where I don't manage the customer's enterprise" do
        before do
          controller.stub spree_current_user: another_enterprise.owner
        end

        it "prevents me from updating the customer" 

      end
    end
  end

  describe "create" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:another_enterprise) { create(:distributor_enterprise) }

    def create_customer(enterprise)
      spree_put :create, format: :json, customer: { email: 'new@example.com', enterprise_id: enterprise.id }
    end

    context "json" do
      context "where I manage the customer's enterprise" do
        before do
          controller.stub spree_current_user: enterprise.owner
        end

        it "allows me to create the customer" 

      end

      context "where I don't manage the customer's enterprise" do
        before do
          controller.stub spree_current_user: another_enterprise.owner
        end

        it "prevents me from creating the customer" 

      end

      context "where I am the admin user" do
        before do
          controller.stub spree_current_user: create(:admin_user)
        end

        it "allows admins to create the customer" 

      end
    end
  end

  describe "#addresses" do
    let!(:enterprise) { create(:enterprise) }
    let(:bill_address) { create(:address, firstname: "Dominic", address1: "123 Lala Street" ) }
    let(:ship_address) { create(:address, firstname: "Dom", address1: "123 Sesame Street") }
    let(:managed_customer) { create(:customer, enterprise: enterprise, bill_address: bill_address, ship_address: ship_address) }
    let(:unmanaged_customer) { create(:customer) }
    let(:params) { { format: :json } }

    before { login_as_enterprise_user [enterprise] }

    context "when I manage the customer" do
      before { params.merge!(id: managed_customer.id) }

      it "returns with serialized addresses for the customer" 

    end

    context "when I don't manage the customer" do
      before { params.merge!(customer_id: unmanaged_customer.id) }

      it "redirects to unauthorised" 

    end

    context "when no customer with a matching id exists" do
      before { params.merge!(customer_id: 1) }

      it "redirects to unauthorised" 

    end
  end

  describe "#cards" do
    let(:user) { create(:user) }
    let!(:enterprise) { create(:enterprise) }
    let!(:credit_card1) { create(:credit_card, user: user) }
    let!(:credit_card2) { create(:credit_card) }
    let(:managed_customer) { create(:customer, enterprise: enterprise) }
    let(:unmanaged_customer) { create(:customer) }
    let(:params) { { format: :json } }

    before { login_as_enterprise_user [enterprise] }

    context "when I manage the customer" do
      before { params.merge!(id: managed_customer.id) }

      context "when the customer is not associated with a user" do
        it "returns with an empty array" 

      end

      context "when the customer is associated with a user" do
        before { managed_customer.update_attributes(user_id: user.id) }

        it "returns with serialized cards for the customer" 

      end
    end

    context "when I don't manage the customer" do
      before { params.merge!(customer_id: unmanaged_customer.id) }

      it "redirects to unauthorised" 

    end

    context "when no customer with a matching id exists" do
      before { params.merge!(customer_id: 1) }

      it "redirects to unauthorised" 

    end
  end
end

