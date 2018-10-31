require 'spec_helper'

include AuthenticationWorkflow

module OpenFoodNetwork
  describe OrderCycleManagementReport do
    context "as a site admin" do
      let(:user) do
        user = create(:user)
        user.spree_roles << Spree::Role.find_or_create_by_name!("admin")
        user
      end
      subject { OrderCycleManagementReport.new user }

      describe "fetching orders" do
        it "fetches completed orders" 


        it "does not show cancelled orders" 

      end
    end

    context "as an enterprise user" do
      let!(:user) { create_enterprise_user }

      subject { OrderCycleManagementReport.new user }

      describe "fetching orders" do
        let(:supplier) { create(:supplier_enterprise) }
        let(:product) { create(:simple_product, supplier: supplier) }
        let(:order) { create(:order, completed_at: 1.day.ago) }

        it "only shows orders managed by the current user" 



        it "does not show orders through a hub that the current user does not manage" 

      end

      describe "filtering orders" do
        let!(:orders) { Spree::Order.scoped }
        let!(:supplier) { create(:supplier_enterprise) }

        let!(:oc1) { create(:simple_order_cycle) }
        let!(:pm1) { create(:payment_method, name: "PM1") }
        let!(:sm1) { create(:shipping_method, name: "ship1") }
        let!(:order1) { create(:order, shipping_method: sm1, order_cycle: oc1) }
        let!(:payment1) { create(:payment, order: order1, payment_method: pm1) }

        it "returns all orders sans-params" 


        it "filters to a specific order cycle" 


        it "filters to a payment method" 


        it "filters to a shipping method" 


        it "should do all the filters at once" 

      end
    end
  end
end

