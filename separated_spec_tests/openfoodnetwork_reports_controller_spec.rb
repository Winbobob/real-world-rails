require 'spec_helper'

describe Spree::Admin::ReportsController, type: :controller do

  # Given two distributors and two suppliers
  let(:ba) { create(:address) }
  let(:sa) { create(:address) }
  let(:si) { "pick up on thursday please" }
  let(:c1) { create(:distributor_enterprise) }
  let(:c2) { create(:distributor_enterprise) }
  let(:s1) { create(:supplier_enterprise) }
  let(:s2) { create(:supplier_enterprise) }
  let(:s3) { create(:supplier_enterprise) }
  let(:d1) { create(:distributor_enterprise) }
  let(:d2) { create(:distributor_enterprise) }
  let(:d3) { create(:distributor_enterprise) }
  let(:p1) { create(:product, price: 12.34, distributors: [d1], supplier: s1) }
  let(:p2) { create(:product, price: 23.45, distributors: [d2], supplier: s2) }
  let(:p3) { create(:product, price: 34.56, distributors: [d3], supplier: s3) }

  # Given two order cycles with both distributors
  let(:ocA) { create(:simple_order_cycle, coordinator: c1, distributors: [d1, d2], suppliers: [s1, s2, s3], variants: [p1.master, p3.master]) }
  let(:ocB) { create(:simple_order_cycle, coordinator: c2, distributors: [d1, d2], suppliers: [s1, s2, s3], variants: [p2.master]) }

  # orderA1 can only be accessed by s1, s3 and d1
  let!(:orderA1) do
    order = create(:order, distributor: d1, bill_address: ba, ship_address: sa, special_instructions: si, order_cycle: ocA)
    order.line_items << create(:line_item, variant: p1.master)
    order.line_items << create(:line_item, variant: p3.master)
    order.finalize!
    order.save
    order
  end
  # orderA2 can only be accessed by s2 and d2
  let!(:orderA2) do
    order = create(:order, distributor: d2, bill_address: ba, ship_address: sa, special_instructions: si, order_cycle: ocA)
    order.line_items << create(:line_item, variant: p2.master)
    order.finalize!
    order.save
    order
  end
  # orderB1 can only be accessed by s1, s3 and d1
  let!(:orderB1) do
    order = create(:order, distributor: d1, bill_address: ba, ship_address: sa, special_instructions: si, order_cycle: ocB)
    order.line_items << create(:line_item, variant: p1.master)
    order.line_items << create(:line_item, variant: p3.master)
    order.finalize!
    order.save
    order
  end
  # orderB2 can only be accessed by s2 and d2
  let!(:orderB2) do
    order = create(:order, distributor: d2, bill_address: ba, ship_address: sa, special_instructions: si, order_cycle: ocB)
    order.line_items << create(:line_item, variant: p2.master)
    order.finalize!
    order.save
    order
  end

  # Results
  let(:resulting_orders_prelim) { assigns(:report).search.result }
  let(:resulting_orders) { assigns(:report).table_items.map(&:order) }
  let(:resulting_products) { assigns(:report).table_items.map(&:product) }

  # As manager of a coordinator (c1)
  context "Coordinator Enterprise User" do
    before { login_as_enterprise_user [c1] }

    describe 'Orders & Fulfillment' do
      it "shows all orders in order cycles I coordinate" 

    end
  end

  # As a Distributor Enterprise user for d1
  context "Distributor Enterprise User" do
    before { login_as_enterprise_user [d1] }

    describe 'Orders and Distributors' do
      it "only shows orders that I have access to" 

    end

    describe 'Bulk Coop' do
      it "only shows orders that I have access to" 

    end

    describe 'Payments' do
      it "only shows orders that I have access to" 

    end

    describe 'Orders & Fulfillment' do
      it "only shows orders that I distribute" 


      it "only shows the selected order cycle" 

    end
  end

  # As a Supplier Enterprise user for s1
  context "Supplier" do
    before { login_as_enterprise_user [s1] }

    describe 'index' do
      it "loads reports relevant to producers" 

    end

    describe 'Bulk Coop' do
      context "where I have granted P-OC to the distributor" do
        before do
          create(:enterprise_relationship, parent: s1, child: d1, permissions_list: [:add_to_order_cycle])
        end

        it "only shows product line items that I am supplying" 

      end

      context "where I have not granted P-OC to the distributor" do
        it "shows product line items that I am supplying" 

      end
    end

    describe 'Orders & Fulfillment' do
      context "where I have granted P-OC to the distributor" do
        before do
          create(:enterprise_relationship, parent: s1, child: d1, permissions_list: [:add_to_order_cycle])
        end

        it "only shows product line items that I am supplying" 


        it "only shows the selected order cycle" 

      end

      context "where I have not granted P-OC to the distributor" do
        it "does not show me line_items I supply" 

      end
    end
  end

  context "Products & Inventory" do
    before { login_as_admin }

    it "should build distributors for the current user" 


    it "builds suppliers for the current user" 


    it "builds order cycles for the current user" 


    it "assigns report types" 


    it "creates a ProductAndInventoryReport" 

  end

  context "My Customers" do
    before { login_as_admin }

    it "should have report types for customers" 


    it "should build distributors for the current user" 


    it "builds suppliers for the current user" 


    it "builds order cycles for the current user" 


    it "assigns report types" 


    it "creates a CustomersReport" 

  end
end

