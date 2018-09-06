require 'spec_helper'

feature 'Tag Rules', js: true do
  include AuthenticationWorkflow
  include WebHelper

  let!(:enterprise) { create(:distributor_enterprise) }

  context "creating" do
    before do
      login_to_admin_section
      visit main_app.edit_admin_enterprise_path(enterprise)
    end

    it "allows creation of rules of each type" 

  end

  context "updating" do
    let!(:default_fsm_tag_rule) { create(:filter_shipping_methods_tag_rule, enterprise: enterprise, preferred_matched_shipping_methods_visibility: "visible", is_default: true, preferred_shipping_method_tags: "local" ) }
    let!(:fp_tag_rule) { create(:filter_products_tag_rule, enterprise: enterprise, preferred_matched_variants_visibility: "visible", preferred_customer_tags: "member", preferred_variant_tags: "member" ) }
    let!(:fpm_tag_rule) { create(:filter_payment_methods_tag_rule, enterprise: enterprise, preferred_matched_payment_methods_visibility: "hidden", preferred_customer_tags: "trusted", preferred_payment_method_tags: "trusted" ) }
    let!(:foc_tag_rule) { create(:filter_order_cycles_tag_rule, enterprise: enterprise, preferred_matched_order_cycles_visibility: "visible", preferred_customer_tags: "wholesale", preferred_exchange_tags: "wholesale" ) }
    let!(:fsm_tag_rule) { create(:filter_shipping_methods_tag_rule, enterprise: enterprise, preferred_matched_shipping_methods_visibility: "hidden", preferred_customer_tags: "local", preferred_shipping_method_tags: "local" ) }
    # let!(:do_tag_rule) { create(:tag_rule, enterprise: enterprise, preferred_customer_tags: "member" ) }

    before do
      login_to_admin_section
      visit main_app.edit_admin_enterprise_path(enterprise)
    end

    it "saves changes to rules of each type" 

  end

  context "deleting" do
    let!(:tag_rule) { create(:filter_products_tag_rule, enterprise: enterprise, preferred_customer_tags: "member" ) }
    let!(:default_rule) { create(:filter_products_tag_rule, is_default: true, enterprise: enterprise ) }

    before do
      login_to_admin_section
      visit main_app.edit_admin_enterprise_path(enterprise)
    end

    it "deletes both default and customer rules from the database" 

  end
end

