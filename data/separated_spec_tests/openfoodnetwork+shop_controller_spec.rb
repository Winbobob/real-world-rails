require 'spec_helper'

describe ShopController, type: :controller do
  let!(:pm) { create(:payment_method) }
  let!(:sm) { create(:shipping_method) }
  let(:distributor) { create(:distributor_enterprise, payment_methods: [pm], shipping_methods: [sm]) }

  it "redirects to the home page if no distributor is selected" 


  describe "with a distributor in place" do
    before do
      controller.stub(:current_distributor).and_return distributor
    end

    describe "selecting an order cycle" do
      it "should select an order cycle when only one order cycle is open" 


      it "should not set an order cycle when multiple order cycles are open" 


      it "should allow the user to post to select the current order cycle" 


      context "JSON tests" do
        render_views

        it "should return the order cycle details when the OC is selected" 


        it "should return the current order cycle when hit with GET" 


        context "when the order cycle has already been set" do
          let(:oc1) { create(:simple_order_cycle, distributors: [distributor]) }
          let(:oc2) { create(:simple_order_cycle, distributors: [distributor]) }
          let(:order) { create(:order, order_cycle: oc1) }

          before { allow(controller).to receive(:current_order) { order } }

          it "returns the new order cycle details" 

        end
      end

      it "should not allow the user to select an invalid order cycle" 

    end


    describe "returning products" do
      let(:order_cycle) { create(:simple_order_cycle, distributors: [distributor]) }
      let(:exchange) { order_cycle.exchanges.to_enterprises(distributor).outgoing.first }

      describe "requests and responses" do
        let(:product) { create(:product) }

        before do
          exchange.variants << product.variants.first
        end

        it "returns products via JSON" 


        it "does not return products if no order cycle is selected" 

      end
    end

    describe "determining rule relevance" do
      let(:products_json) { double(:products_json) }
      let(:applicator) { double(:applicator) }

      before do
        allow(applicator).to receive(:rules) { tag_rules }
        allow(controller).to receive(:applicator) { applicator }
        allow(controller).to receive(:filter) { "some filtered json" }
      end

      context "when no relevant rules exist" do
        let(:tag_rules) { [] }

        it "does not attempt to apply any rules" 


        it "returns products as JSON" 

      end

      context "when relevant rules exist" do
        let(:tag_rule) { create(:filter_products_tag_rule, preferred_customer_tags: "tag1", preferred_variant_tags: "tag1", preferred_matched_variants_visibility: "hidden" ) }
        let(:tag_rules) { [tag_rule] }

        it "attempts to apply any rules" 


        it "returns filtered JSON" 

      end
    end

    describe "loading available order cycles" do
      let(:user) { create(:user) }
      before { allow(controller).to receive(:spree_current_user) { user } }

      context "when FilterProducts tag rules are in effect" do
        let(:customer) { create(:customer, user: user, enterprise: distributor) }
        let!(:tag_rule) { create(:filter_products_tag_rule,
          enterprise: distributor,
          preferred_customer_tags: "member",
          preferred_variant_tags: "members-only")
        }
        let!(:default_tag_rule) { create(:filter_products_tag_rule,
          enterprise: distributor,
          is_default: true,
          preferred_variant_tags: "members-only")
        }
        let(:product1) { { "id" => 1, "name" => 'product 1', "variants" => [{ "id" => 4, "tag_list" => ["members-only"] }] } }
        let(:product2) { { "id" => 2, "name" => 'product 2', "variants" => [{ "id" => 5, "tag_list" => ["members-only"] }, {"id" => 9, "tag_list" => ["something"]}] } }
        let(:product3) { { "id" => 3, "name" => 'product 3', "variants" => [{ "id" => 6, "tag_list" => ["something-else"] }] } }
        let(:product2_without_v5) { { "id" => 2, "name" => 'product 2', "variants" => [{"id" => 9, "tag_list" => ["something"]}] } }
        let!(:products_array) { [product1, product2, product3] }
        let!(:products_json) { JSON.unparse( products_array ) }

        before do
          allow(controller).to receive(:current_order) { order }
        end

        context "with a preferred visiblity of 'visible', default visibility of 'hidden'" do
          before { tag_rule.update_attribute(:preferred_matched_variants_visibility, 'visible') }
          before { default_tag_rule.update_attribute(:preferred_matched_variants_visibility, 'hidden') }

          let(:filtered_products) { JSON.parse(controller.send(:filter, products_json)) }

          context "when the customer is nil" do
            it "applies default action (hide)" 

          end

          context "when the customer's tags match" do
            before { customer.update_attribute(:tag_list, 'member') }

            it "applies the action (show)" 

          end

          context "when the customer's tags don't match" do
            before { customer.update_attribute(:tag_list, 'something') }

            it "applies the default action (hide)" 

          end
        end

        context "with a preferred visiblity of 'hidden', default visibility of 'visible'" do
          before { tag_rule.update_attribute(:preferred_matched_variants_visibility, 'hidden') }
          before { default_tag_rule.update_attribute(:preferred_matched_variants_visibility, 'visible') }

          let(:filtered_products) { JSON.parse(controller.send(:filter, products_json)) }

          context "when the customer is nil" do
            it "applies default action (show)" 

          end

          context "when the customer's tags match" do
            before { customer.update_attribute(:tag_list, 'member') }

            it "applies the action (hide)" 

          end

          context "when the customer's tags don't match" do
            before { customer.update_attribute(:tag_list, 'something') }

            it "applies the default action (show)" 

          end
        end
      end
    end
  end
end

