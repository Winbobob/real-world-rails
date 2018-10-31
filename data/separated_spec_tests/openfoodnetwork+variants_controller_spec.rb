require 'spec_helper'

module Spree
  describe Spree::Api::VariantsController, type: :controller do
    render_views

    let(:supplier) { FactoryBot.create(:supplier_enterprise) }
    let!(:variant1) { FactoryBot.create(:variant) }
    let!(:variant2) { FactoryBot.create(:variant) }
    let!(:variant3) { FactoryBot.create(:variant) }
    let(:attributes) { [:id, :options_text, :price, :on_hand, :unit_value, :unit_description, :on_demand, :display_as, :display_name] }

    before do
      allow(controller).to receive(:spree_current_user) { current_api_user }
    end

    context "as a normal user" do
      sign_in_as_user!

      it "retrieves a list of variants with appropriate attributes" 


      it "is denied access when trying to delete a variant" 

    end

    context "as an enterprise user" do
      sign_in_as_enterprise_user! [:supplier]
      let(:supplier_other) { create(:supplier_enterprise) }
      let(:product) { create(:product, supplier: supplier) }
      let(:variant) { product.master }
      let(:product_other) { create(:product, supplier: supplier_other) }
      let(:variant_other) { product_other.master }

      it "soft deletes a variant" 


      it "is denied access to soft deleting another enterprises' variant" 

    end

    context "as an administrator" do
      sign_in_as_admin!

      it "soft deletes a variant" 

    end
  end
end

