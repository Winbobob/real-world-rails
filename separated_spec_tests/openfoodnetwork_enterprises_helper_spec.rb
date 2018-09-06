require 'spec_helper'

describe EnterprisesHelper, type: :helper do
  let(:user) { create(:user) }
  let(:distributor) { create(:distributor_enterprise) }
  let(:some_other_distributor) { create(:distributor_enterprise) }

  before { allow(helper).to receive(:spree_current_user) { user } }

  describe "loading available shipping methods" do
    let!(:sm1) { create(:shipping_method, require_ship_address: false, distributors: [distributor]) }
    let!(:sm2) { create(:shipping_method, require_ship_address: false, distributors: [some_other_distributor]) }

    context "when the order has no current_distributor" do
      before do
        allow(helper).to receive(:current_distributor) { nil }
      end

      it "returns an empty array" 

    end

    context "when no tag rules are in effect" do
      before { allow(helper).to receive(:current_distributor) { distributor } }

      it "finds the shipping methods for the current distributor" 

    end

    context "when FilterShippingMethods tag rules are in effect" do
      let(:customer) { create(:customer, user: user, enterprise: distributor) }
      let!(:tag_rule) { create(:filter_shipping_methods_tag_rule,
        enterprise: distributor,
        preferred_customer_tags: "local",
        preferred_shipping_method_tags: "local-delivery") 
      }
      let!(:default_tag_rule) { create(:filter_shipping_methods_tag_rule,
        enterprise: distributor,
        is_default: true,
        preferred_shipping_method_tags: "local-delivery") 
      }
      let!(:tagged_sm) { sm1 }
      let!(:untagged_sm) { sm2 }

      before do
        tagged_sm.update_attribute(:tag_list, 'local-delivery')
        distributor.shipping_methods = [tagged_sm, untagged_sm]
        allow(helper).to receive(:current_distributor) { distributor }
      end

      context "with a preferred visiblity of 'visible', default visibility of 'hidden'" do
        before { tag_rule.update_attribute(:preferred_matched_shipping_methods_visibility, 'visible') }
        before { default_tag_rule.update_attribute(:preferred_matched_shipping_methods_visibility, 'hidden') }

        context "when the customer is nil" do
          it "applies default action (hide)" 

        end

        context "when the customer's tags match" do
          before { customer.update_attribute(:tag_list, 'local') }

          it "applies the action (show)" 

        end

        context "when the customer's tags don't match" do
          before { customer.update_attribute(:tag_list, 'something') }

          it "applies the default action (hide)" 

        end
      end

      context "with a preferred visiblity of 'hidden', default visibility of 'visible'" do
        before { tag_rule.update_attribute(:preferred_matched_shipping_methods_visibility, 'hidden') }
        before { default_tag_rule.update_attribute(:preferred_matched_shipping_methods_visibility, 'visible') }

        context "when the customer is nil" do
          it "applies default action (show)" 

        end

        context "when the customer's tags match" do
          before { customer.update_attribute(:tag_list, 'local') }

          it "applies the action (hide)" 

        end

        context "when the customer's tags don't match" do
          before { customer.update_attribute(:tag_list, 'something') }

          it "applies the default action (show)" 

        end
      end
    end
  end

  describe "loading available payment methods" do
    let!(:pm1) { create(:payment_method, distributors: [distributor])}
    let!(:pm2) { create(:payment_method, distributors: [some_other_distributor])}

    context "when the order has no current_distributor" do
      before do
        allow(helper).to receive(:current_distributor) { nil }
      end

      it "returns an empty array" 

    end

    context "when no tag rules are in effect" do
      before { allow(helper).to receive(:current_distributor) { distributor } }

      it "finds the payment methods for the current distributor" 

    end

    context "when FilterPaymentMethods tag rules are in effect" do
      let(:customer) { create(:customer, user: user, enterprise: distributor) }
      let!(:tag_rule) { create(:filter_payment_methods_tag_rule,
        enterprise: distributor,
        preferred_customer_tags: "trusted",
        preferred_payment_method_tags: "trusted") 
      }
      let!(:default_tag_rule) { create(:filter_payment_methods_tag_rule,
        enterprise: distributor,
        is_default: true,
        preferred_payment_method_tags: "trusted") 
      }
      let(:tagged_pm) { pm1 }
      let(:untagged_pm) { pm2 }

      before do
        tagged_pm.update_attribute(:tag_list, 'trusted')
        distributor.payment_methods = [tagged_pm, untagged_pm]
        allow(helper).to receive(:current_distributor) { distributor }
      end

      context "with a preferred visiblity of 'visible', default visibility of 'hidden'" do
        before { tag_rule.update_attribute(:preferred_matched_payment_methods_visibility, 'visible') }
        before { default_tag_rule.update_attribute(:preferred_matched_payment_methods_visibility, 'hidden') }

        context "when the customer is nil" do
          it "applies default action (hide)" 

        end

        context "when the customer's tags match" do
          before { customer.update_attribute(:tag_list, 'trusted') }

          it "applies the action (show)" 

        end

        context "when the customer's tags don't match" do
          before { customer.update_attribute(:tag_list, 'something') }

          it "applies the default action (hide)" 

        end
      end

      context "with a preferred visiblity of 'hidden', default visibility of 'visible'" do
        before { tag_rule.update_attribute(:preferred_matched_payment_methods_visibility, 'hidden') }
        before { default_tag_rule.update_attribute(:preferred_matched_payment_methods_visibility, 'visible') }

        context "when the customer is nil" do
          it "applies default action (show)" 

        end

        context "when the customer's tags match" do
          before { customer.update_attribute(:tag_list, 'trusted') }

          it "applies the action (hide)" 

        end

        context "when the customer's tags don't match" do
          before { customer.update_attribute(:tag_list, 'something') }

          it "applies the default action (show)" 

        end
      end
    end

    context "when StripeConnect payment methods are present" do
      let!(:pm3) { create(:stripe_payment_method, distributors: [distributor], preferred_enterprise_id: distributor.id) }
      let!(:pm4) { create(:stripe_payment_method, distributors: [distributor], preferred_enterprise_id: some_other_distributor.id) }
      let(:available_payment_methods) { helper.available_payment_methods }

      before do
        allow(helper).to receive(:current_distributor) { distributor }
      end

      context "and Stripe Connect is disabled" do
        before { Spree::Config.set(stripe_connect_enabled: false) }

        it "ignores Stripe payment methods" 

      end

      context "and Stripe Connect is enabled" do
        let!(:stripe_account) { create(:stripe_account, enterprise_id: distributor.id) }

        before do
          Spree::Config.set(stripe_connect_enabled: true)
          allow(Stripe).to receive(:publishable_key) { "some_key" }
        end

        it "includes Stripe payment methods with a valid stripe accounts" 

      end
    end
  end
end

