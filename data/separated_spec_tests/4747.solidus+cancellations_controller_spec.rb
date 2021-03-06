# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::CancellationsController do
  stub_authorization!

  describe "#index" do
    subject { get :index, params: { order_id: order.number } }

    let(:order) { create(:order_ready_to_ship, line_items_count: 1) }

    context "for an order with inventory" do
      render_views

      it "succeeds" 

    end
  end

  describe "#cancel" do
    subject { post :short_ship, params: { order_id: order.number, inventory_unit_ids: inventory_units.map(&:id) } }

    let(:order) { create(:order_ready_to_ship, number: "R100", state: "complete", line_items_count: 1) }
    let(:referer) { "order_admin_page" }

    context "no inventory unit ids are provided" do
      subject { post :short_ship, params: { order_id: order.number } }

      it "redirects back" 


      it "sets an error message" 

    end

    context "unable to find all the inventory" do
      let(:inventory_units) { [Spree::InventoryUnit.new(id: -1)] }

      it "redirects back" 


      it "sets an error message" 

    end

    context "successfully cancels inventory" do
      let(:inventory_units) { order.inventory_units.not_canceled }

      it "redirects to admin order edit" 


      it "sets an success message" 


      it "creates a unit cancel" 


      it "cancels the inventory" 

    end
  end
end

