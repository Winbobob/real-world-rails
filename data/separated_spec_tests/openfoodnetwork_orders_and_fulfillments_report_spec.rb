require 'spec_helper'

include AuthenticationWorkflow

module OpenFoodNetwork
  describe OrdersAndFulfillmentsReport do
    describe "fetching orders" do
      let(:d1) { create(:distributor_enterprise) }
      let(:oc1) { create(:simple_order_cycle) }
      let(:o1) { create(:order, completed_at: 1.day.ago, order_cycle: oc1, distributor: d1) }
      let(:li1) { build(:line_item) }

      before { o1.line_items << li1 }

      context "as a site admin" do
        let(:user) { create(:admin_user) }
        subject { PackingReport.new user }

        it "fetches completed orders" 


        it "does not show cancelled orders" 

      end

      context "as a manager of a supplier" do
        let!(:user) { create(:user) }
        subject { OrdersAndFulfillmentsReport.new user }

        let(:s1) { create(:supplier_enterprise) }

        before do
          s1.enterprise_roles.create!(user: user)
        end

        context "that has granted P-OC to the distributor" do
          let(:o2) { create(:order, distributor: d1, completed_at: 1.day.ago, bill_address: create(:address), ship_address: create(:address)) }
          let(:li2) { build(:line_item, product: create(:simple_product, supplier: s1)) }

          before do
            o2.line_items << li2
            create(:enterprise_relationship, parent: s1, child: d1, permissions_list: [:add_to_order_cycle])
          end

          it "shows line items supplied by my producers, with names hidden" 

        end

        context "that has not granted P-OC to the distributor" do
          let(:o2) { create(:order, distributor: d1, completed_at: 1.day.ago, bill_address: create(:address), ship_address: create(:address)) }
          let(:li2) { build(:line_item, product: create(:simple_product, supplier: s1)) }

          before do
            o2.line_items << li2
          end

          it "shows line items supplied by my producers, with names hidden" 

        end
      end

      context "as a manager of a distributor" do
        let!(:user) { create(:user) }
        subject { OrdersAndFulfillmentsReport.new user }

        before do
          d1.enterprise_roles.create!(user: user)
        end

        it "only shows line items distributed by enterprises managed by the current user" 


        it "only shows the selected order cycle" 

      end
    end

    describe "columns are aligned" do
      let(:d1) { create(:distributor_enterprise) }
      let(:oc1) { create(:simple_order_cycle) }
      let(:o1) { create(:order, completed_at: 1.day.ago, order_cycle: oc1, distributor: d1) }
      let(:li1) { build(:line_item) }
      let(:user) { create(:admin_user)}

      before { o1.line_items << li1 }

      it 'has aligned columsn' 

    end
  end
end

