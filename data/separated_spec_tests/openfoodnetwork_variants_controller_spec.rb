require 'spec_helper'

module Spree
  module Admin
    describe VariantsController, type: :controller do
      before { login_as_admin }

      describe "search action" do
        let!(:p1) { create(:simple_product, name: 'Product 1') }
        let!(:p2) { create(:simple_product, name: 'Product 2') }
        let!(:v1) { p1.variants.first }
        let!(:v2) { p2.variants.first }
        let!(:vo) { create(:variant_override, variant: v1, hub: d, count_on_hand: 44) }
        let!(:d)  { create(:distributor_enterprise) }
        let!(:oc) { create(:simple_order_cycle, distributors: [d], variants: [v1]) }

        it "filters by distributor" 


        it "applies variant overrides" 


        it "filters by order cycle" 


        it "does not filter when no distributor or order cycle is specified" 

      end
    end
  end
end

