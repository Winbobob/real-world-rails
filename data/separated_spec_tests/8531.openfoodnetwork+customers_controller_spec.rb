require 'spec_helper'

describe Admin::CustomersController, type: :controller do
  include AuthenticationWorkflow

  describe "index" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:another_enterprise) { create(:distributor_enterprise) }

    context "html" do
      before do
        allow(controller).to receive(:spree_current_user) { enterprise.owner }
      end

      it "returns an empty @collection" 

    end

    context "json" do
      let!(:customer) { create(:customer, enterprise: enterprise) }

      context "where I manage the enterprise" do
        before do
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
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
          allow(controller).to receive(:spree_current_user) { another_enterprise.owner }
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
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
        end

        it "allows me to update the customer" 

      end

      context "where I don't manage the customer's enterprise" do
        before do
          allow(controller).to receive(:spree_current_user) { another_enterprise.owner }
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
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
        end

        it "allows me to create the customer" 

      end

      context "where I don't manage the customer's enterprise" do
        before do
          allow(controller).to receive(:spree_current_user) { another_enterprise.owner }
        end

        it "prevents me from creating the customer" 

      end

      context "where I am the admin user" do
        before do
          allow(controller).to receive(:spree_current_user) { create(:admin_user) }
        end

        it "allows admins to create the customer" 

      end
    end
  end

  describe "show" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:another_enterprise) { create(:distributor_enterprise) }

    context "json" do
      let!(:customer) { create(:customer, enterprise: enterprise) }

      context "where I manage the customer's enterprise" do
        render_views

        before do
          allow(controller).to receive(:spree_current_user) { enterprise.owner }
        end

        it "renders the customer as json" 

      end

      context "where I don't manage the customer's enterprise" do
        before do
          allow(controller).to receive(:spree_current_user) { another_enterprise.owner }
        end

        it "prevents me from updating the customer" 

      end
    end
  end
end

