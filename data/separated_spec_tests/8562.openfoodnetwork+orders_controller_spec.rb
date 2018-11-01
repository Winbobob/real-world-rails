require 'spec_helper'

describe Spree::Admin::OrdersController, type: :controller do
  include AuthenticationWorkflow

  context "updating an order with line items" do
    let!(:order) { create(:order) }
    let(:line_item) { create(:line_item) }
    before { login_as_admin }

    it "updates distribution charges" 

  end

  describe "#index" do
    render_views

    let(:order_attributes) { [:id, :full_name, :email, :phone, :completed_at, :distributor, :order_cycle, :number] }

    def self.make_simple_data!
      let!(:dist1) { FactoryBot.create(:distributor_enterprise) }
      let!(:order1) { FactoryBot.create(:order, state: 'complete', completed_at: Time.zone.now, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
      let!(:order2) { FactoryBot.create(:order, state: 'complete', completed_at: Time.zone.now, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
      let!(:order3) { FactoryBot.create(:order, state: 'complete', completed_at: Time.zone.now, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
      let!(:line_item1) { FactoryBot.create(:line_item, order: order1) }
      let!(:line_item2) { FactoryBot.create(:line_item, order: order2) }
      let!(:line_item3) { FactoryBot.create(:line_item, order: order2) }
      let!(:line_item4) { FactoryBot.create(:line_item, order: order3) }
      let(:line_item_attributes) { [:id, :quantity, :max_quantity, :supplier, :units_product, :units_variant] }
    end

    context "as a normal user" do
      before { controller.stub spree_current_user: create_enterprise_user }

      make_simple_data!

      it "should deny me access to the index action" 

    end

    context "as an administrator" do
      make_simple_data!

      before do
        controller.stub spree_current_user: quick_login_as_admin
        spree_get :index, :format => :json
      end

      it "retrieves a list of orders with appropriate attributes, including line items with appropriate attributes" 


      it "sorts orders in descending id order" 


      it "formats completed_at to 'yyyy-mm-dd hh:mm'" 


      it "returns distributor object with id key" 


      it "retrieves the order number" 

    end

    context "as an enterprise user" do
      let(:supplier) { create(:supplier_enterprise) }
      let(:distributor1) { create(:distributor_enterprise) }
      let(:distributor2) { create(:distributor_enterprise) }
      let(:coordinator) { create(:distributor_enterprise) }
      let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator) }
      let!(:order1) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor1, billing_address: FactoryBot.create(:address) ) }
      let!(:line_item1) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
      let!(:line_item2) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
      let!(:order2) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor2, billing_address: FactoryBot.create(:address) ) }
      let!(:line_item3) { FactoryBot.create(:line_item, order: order2, product: FactoryBot.create(:product, supplier: supplier)) }

      context "producer enterprise" do

        before do
          controller.stub spree_current_user: supplier.owner
          spree_get :index, :format => :json
        end

        it "does not display line items for which my enterprise is a supplier" 

      end

      context "coordinator enterprise" do
        before do
          controller.stub spree_current_user: coordinator.owner
          spree_get :index, :format => :json
        end

        it "retrieves a list of orders" 

      end

      context "hub enterprise" do
        before do
          controller.stub spree_current_user: distributor1.owner
          spree_get :index, :format => :json
        end

        it "retrieves a list of orders" 

      end
    end
  end

  describe "#invoice" do
    let!(:user) { create(:user) }
    let!(:enterprise_user) { create(:user) }
    let!(:order) { create(:order_with_distributor, bill_address: create(:address), ship_address: create(:address)) }
    let!(:distributor) { order.distributor }
    let(:params) { { id: order.number } }

    context "as a normal user" do
      before { controller.stub spree_current_user: user }

      it "should prevent me from sending order invoices" 

    end

    context "as an enterprise user" do
      context "which is not a manager of the distributor for an order" do
        before { controller.stub spree_current_user: user }
        it "should prevent me from sending order invoices" 

      end

      context "which is a manager of the distributor for an order" do
        before { controller.stub spree_current_user: distributor.owner }
        context "when the distributor's ABN has not been set" do
          before { distributor.update_attribute(:abn, "") }
          it "should allow me to send order invoices" 

        end

        context "when the distributor's ABN has been set" do
          before { distributor.update_attribute(:abn, "123") }
          before do
            Spree::MailMethod.create!(
              environment: Rails.env,
              preferred_mails_from: 'spree@example.com'
            )
          end
          it "should allow me to send order invoices" 

        end
      end
    end
  end

  describe "#print" do
    let!(:user) { create(:user) }
    let!(:enterprise_user) { create(:user) }
    let!(:order) { create(:order_with_distributor, bill_address: create(:address), ship_address: create(:address)) }
    let!(:distributor) { order.distributor }
    let(:params) { { id: order.number } }

    context "as a normal user" do
      before { controller.stub spree_current_user: user }

      it "should prevent me from sending order invoices" 

    end

    context "as an enterprise user" do
      context "which is not a manager of the distributor for an order" do
        before { controller.stub spree_current_user: user }
        it "should prevent me from sending order invoices" 

      end

      context "which is a manager of the distributor for an order" do
        before { controller.stub spree_current_user: distributor.owner }
        it "should allow me to send order invoices" 

      end
    end
  end
end

