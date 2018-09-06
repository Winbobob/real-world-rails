require 'open_food_network/tag_rule_applicator'

module OpenFoodNetwork
  describe TagRuleApplicator do
    let!(:enterprise) { create(:distributor_enterprise) }
    let!(:oc_tag_rule) { create(:filter_order_cycles_tag_rule, enterprise: enterprise, priority: 6, preferred_customer_tags: "tag1", preferred_exchange_tags: "tag1", preferred_matched_order_cycles_visibility: "visible" )}
    let!(:product_tag_rule1) { create(:filter_products_tag_rule, enterprise: enterprise, priority: 5, preferred_customer_tags: "tag1", preferred_variant_tags: "tag1", preferred_matched_variants_visibility: "visible" ) }
    let!(:product_tag_rule2) { create(:filter_products_tag_rule, enterprise: enterprise, priority: 4, preferred_customer_tags: "tag1", preferred_variant_tags: "tag3", preferred_matched_variants_visibility: "hidden" ) }
    let!(:product_tag_rule3) { create(:filter_products_tag_rule, enterprise: enterprise, priority: 3, preferred_customer_tags: "tag2", preferred_variant_tags: "tag1", preferred_matched_variants_visibility: "visible" ) }
    let!(:default_product_tag_rule) { create(:filter_products_tag_rule, enterprise: enterprise, priority: 2, is_default: true, preferred_variant_tags: "tag1", preferred_matched_variants_visibility: "hidden" ) }
    let!(:sm_tag_rule) { create(:filter_shipping_methods_tag_rule, enterprise: enterprise, priority: 1, preferred_customer_tags: "tag1", preferred_shipping_method_tags: "tag1", preferred_matched_shipping_methods_visibility: "visible" )}

    describe "initialisation" do
      context "when enterprise is nil" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(nil, "FilterProducts", ["tag1"]) }
        it { expect{applicator}.to raise_error "Enterprise cannot be nil" }
      end

      context "when rule_type is nil" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, nil, ["tag1"]) }
        it { expect{applicator}.to raise_error "Rule Type cannot be nil" }
      end

      context "when rule_type does not match an existing rule type" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterSomething", ["tag1"]) }
        it { expect{applicator}.to raise_error NameError }
      end

      context "when enterprise and rule_type are present" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterProducts", customer_tags) }

        context "when the customer tags are nil" do
          let!(:customer_tags) { nil }

          it "sets customer tags to an empty array" 


          it "does not match rules without customer tags" 

        end

        context "when customer tags are empty" do
          let!(:customer_tags) { [] }

          it "sets customer tags to an empty array" 


          it "does not match rules without customer tags" 

        end

        context "when customer_tags are present" do
          let!(:customer_tags) { ["tag1"] }

          let(:rules) { applicator.send(:rules)}
          let(:customer_rules) { applicator.send(:customer_rules)}
          let(:default_rules) { applicator.send(:default_rules)}

          it "stores enterprise, rule_class and customer_tags as instance variables" 


          it "selects only rules of the specified type, in order of priority" 


          it "splits rules into those which match customer tags and those which don't, in order of priority" 


          it "splits out default rules" 

        end
      end
    end

    describe "filter!" do
      let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterProducts", []) }

      context "when the subject is nil" do
        let(:subject) { double(:subject, reject!: false) }

        it "returns immediately" 

      end

      context "when subject is empty" do
        let(:subject) { double(:subject, reject!: false) }

        it "returns immediately" 

      end

      context "when subject is an array" do
        let(:element) { double(:element, ) }
        let(:subject) { [element] }

        context "when rule_class reponds to tagged_children_for" do
          let(:child1) { double(:child) }
          let(:child2) { double(:child) }
          let(:children) { [child1, child2] }
          let(:rule_class) { double(:rule_class, tagged_children_for: children) }

          before{ allow(applicator).to receive(:rule_class) { rule_class } }

          context "when reject? returns true only for some children" do
            before do
              allow(applicator).to receive(:reject?).with(child1) { true }
              allow(applicator).to receive(:reject?).with(child2) { false }
              applicator.filter!(subject)
            end

            it "rejects the specified children from the array" 


            it "does not remove the element from the original subject" 

          end

          context "when reject? returns true for all children" do
            before do
              allow(applicator).to receive(:reject?).with(child1) { true }
              allow(applicator).to receive(:reject?).with(child2) { true }
              applicator.filter!(subject)
            end

            it "removes all children from the array" 


            it "removes the element from the original subject" 

          end
        end

        context "when rule_class doesn't respond to tagged_children_for" do
          let(:rule_class) { double(:rule_class) }

          before{ allow(applicator).to receive(:rule_class) { rule_class } }

          context "when reject? returns false for the element" do
            before do
              allow(applicator).to receive(:reject?).with(element) { false }
              applicator.filter!(subject)
            end

            it "does not remove the element from the original subject" 

          end

          context "when reject? returns true for the element" do
            before do
              allow(applicator).to receive(:reject?).with(element) { true }
              applicator.filter!(subject)
            end

            it "removes the element from the original subject" 

          end
        end
      end
    end

    describe "reject?" do
      let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterProducts", ["tag1"]) }
      let(:customer_rule) { double(:customer_rule, reject_matched?: "customer_rule.reject_matched?" )}
      let(:default_rule) { double(:customer_rule, reject_matched?: "default_rule.reject_matched?" )}
      let(:dummy) { double(:dummy) }

      before{ allow(applicator).to receive(:customer_rules) { [customer_rule] } }
      before{ allow(applicator).to receive(:default_rules) { [default_rule] } }

      context "when a customer rule matches the tags of the element" do
        before{ allow(customer_rule).to receive(:tags_match?).with(dummy) { true } }

        it "returns the value of customer_rule.reject_matched?" 

      end

      context "when no customer rules match the tags of the element" do
        before{ allow(customer_rule).to receive(:tags_match?) { false } }

        context "when a default rule matches the tags of the element" do
          before{ allow(default_rule).to receive(:tags_match?) { true } }

          it "returns the value of the default_rule.reject_matched?" 

        end

        context "when a default rule matches the tags of the element" do
          before{ allow(default_rule).to receive(:tags_match?) { false } }

          it "returns false" 

        end
      end
    end


    describe "smoke test for products" do
      let(:product1) { { id: 1, name: 'product 1', "variants" => [{ id: 4, "tag_list" => ["tag1"] }] } }
      let(:product2) { { id: 2, name: 'product 2', "variants" => [{ id: 5, "tag_list" => ["tag1"] }, {id: 9, "tag_list" => ["tag2"]}] } }
      let(:product3) { { id: 3, name: 'product 3', "variants" => [{ id: 6, "tag_list" => ["tag3"] }] } }
      let!(:products_array) { [product1, product2, product3] }

      context "when customer tags don't match any rules" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterProducts", ["lalalala"]) }

        it "applies the default rule" 

      end

      context "when customer tags match one or more rules" do
        let(:applicator) { OpenFoodNetwork::TagRuleApplicator.new(enterprise, "FilterProducts", ["tag1"]) }

        it "applies those rules" 

      end
    end
  end
end

