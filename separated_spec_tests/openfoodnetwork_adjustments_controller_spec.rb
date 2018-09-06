require 'spec_helper'

module Spree
  describe Admin::AdjustmentsController, type: :controller do
    include AuthenticationWorkflow

    before { login_as_admin }

    describe "setting included tax" do
      let(:order) { create(:order) }
      let(:tax_rate) { create(:tax_rate, amount: 0.1, calculator: Spree::Calculator::DefaultTax.new) }

      describe "creating an adjustment" do
        it "sets included tax to zero when no tax rate is specified" 


        it "calculates included tax when a tax rate is provided" 

      end

      describe "updating an adjustment" do
        let(:adjustment) { create(:adjustment, adjustable: order, amount: 1100, included_tax: 100) }

        it "sets included tax to zero when no tax rate is specified" 


        it "calculates included tax when a tax rate is provided" 

      end
    end
  end
end

