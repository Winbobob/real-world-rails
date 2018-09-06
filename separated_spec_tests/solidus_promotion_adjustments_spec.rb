# frozen_string_literal: true

require 'spec_helper'

describe "Promotion Adjustments", type: :feature, js: true do
  stub_authorization!

  context "creating a new promotion", js: true do
    before(:each) do
      visit spree.new_admin_promotion_path
      expect(page).to have_title("New Promotion - Promotions")
    end

    it "should allow an admin to create a flat rate discount coupon promo" 


    it "should allow an admin to create a single user coupon promo with flat rate discount" 


    it "should allow an admin to create an automatic promo with flat percent discount" 


    it "should allow an admin to create an product promo with percent per item discount" 


    it "should allow an admin to create an automatic promotion with free shipping (no code)" 


    it "should allow an admin to create an automatic promotion" 


    it "should allow an admin to create a promo requiring a landing page to be visited" 


    it "should allow an admin to create a promo with generated codes" 


    it "ceasing to be eligible for a promotion with item total rule then becoming eligible again" 


    context 'creating a promotion with promotion action that has a calculator with complex preferences' do
      before do
        class ComplexCalculator < Spree::Calculator
          preference :amount, :decimal
          preference :currency, :string
          preference :mapping, :hash
          preference :list, :array

          def self.description
            "Complex Calculator"
          end
        end
        @calculators = Rails.application.config.spree.calculators.promotion_actions_create_item_adjustments
        Rails.application.config.spree.calculators.promotion_actions_create_item_adjustments = [ComplexCalculator]
      end

      after do
        Rails.application.config.spree.calculators.promotion_actions_create_item_adjustments = @calculators
      end

      it "does not show array and hash form fields" 

    end
  end
end

