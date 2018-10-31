# frozen_string_literal: true

require 'spec_helper'

module Spree::Api
  describe OrdersController, type: :request do
    before do
      stub_authentication!
    end

    context "with an available promotion" do
      let!(:order) { create(:order_with_line_items, line_items_count: 1) }
      let!(:promotion) do
        promotion = create(:promotion, name: "10% off", code: "10off")
        calculator = Spree::Calculator::FlatPercentItemTotal.create(preferred_flat_percent: "10")
        action = Spree::Promotion::Actions::CreateItemAdjustments.create(calculator: calculator)
        promotion.actions << action
        promotion
      end

      it "can apply a coupon code to the order" 


      context "with an expired promotion" do
        before do
          promotion.starts_at = 2.weeks.ago
          promotion.expires_at = 1.week.ago
          promotion.save
        end

        it "fails to apply" 

      end
    end
  end
end

