# frozen_string_literal: true

require 'spec_helper'

module Spree
  module Admin
    describe StockItemsController, type: :controller do
      stub_authorization!

      describe "#create" do
        let!(:variant) { create(:variant) }
        let!(:stock_location) { variant.stock_locations.first }
        let(:stock_item) { variant.stock_items.first }
        let!(:user) { create :user }

        before { expect(controller).to receive(:spree_current_user).and_return(user) }
        before { request.env["HTTP_REFERER"] = "product_admin_page" }

        subject do
          post :create, params: { variant_id: variant, stock_location_id: stock_location, stock_movement: { quantity: 1, stock_item_id: stock_item.id } }
        end

        it "creates a stock movement with originator" 

      end

      describe "#index" do
        let!(:variant_1) { create(:variant) }
        let!(:variant_2) { create(:variant) }

        context "with product_slug param" do
          it "scopes the variants by the product" 

        end

        context "without product_slug params" do
          it "allows all accessible variants to be returned" 

        end
      end
    end
  end
end
