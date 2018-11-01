require 'spec_helper'

module OpenFoodNetwork
  describe CustomersReport do
    context "as a site admin" do
      let(:user) do
        user = create(:user)
        user.spree_roles << Spree::Role.find_or_create_by_name!("admin")
        user
      end
      subject { CustomersReport.new user, {}, true }

      describe "mailing list report" do
        before do
          subject.stub(:params).and_return(report_type: "mailing_list")
        end

        it "returns headers for mailing_list" 


        it "builds a table from a list of variants" 

      end

      describe "addresses report" do
        before do
          subject.stub(:params).and_return(report_type: "addresses")
        end

        it "returns headers for addresses" 


        it "builds a table from a list of variants" 

      end

      describe "fetching orders" do
        it "fetches completed orders" 


        it "does not show cancelled orders" 

      end
    end

    context "as an enterprise user" do
      let(:user) do
        user = create(:user)
        user.spree_roles = []
        user.save!
        user
      end

      subject { CustomersReport.new user, {}, true }

      describe "fetching orders" do
        let(:supplier) { create(:supplier_enterprise) }
        let(:product) { create(:simple_product, supplier: supplier) }
        let(:order) { create(:order, completed_at: 1.day.ago) }

        it "only shows orders managed by the current user" 


        it "does not show orders through a hub that the current user does not manage" 

      end

      describe "filtering orders" do
        let(:orders) { Spree::Order.scoped }
        let(:supplier) { create(:supplier_enterprise) }

        it "returns all orders sans-params" 


        it "returns orders with a specific supplier" 


        it "filters to a specific distributor" 


        it "filters to a specific cycle" 

      end
    end
  end
end

