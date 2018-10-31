require 'spec_helper'

module OpenFoodNetwork
  describe ProductsAndInventoryReport do
    context "As a site admin" do
      let(:user) do
        user = create(:user)
        user.spree_roles << Spree::Role.find_or_create_by_name!("admin")
        user
      end
      subject do
        ProductsAndInventoryReport.new user, {}, true
      end

      it "Should return headers" 


      it "should build a table from a list of variants" 


      it "fetches variants for some params" 

    end

    context "As an enterprise user" do
      let(:supplier) { create(:supplier_enterprise) }
      let(:enterprise_user) do
        user = create(:user)
        user.enterprise_roles.create(enterprise: supplier)
        user.spree_roles = []
        user.save!
        user
      end

      subject do
        ProductsAndInventoryReport.new enterprise_user, {}, true
      end

      describe "fetching child variants" do
        it "returns some variants" 


        it "should only return variants managed by the user" 

      end

      describe "Filtering variants" do
        let(:variants) { Spree::Variant.scoped.joins(:product).where(is_master: false) }
        it "should return unfiltered variants sans-params" 

        it "should filter deleted products" 

        describe "based on report type" do
          it "returns only variants on hand" 

        end
        it "filters to a specific supplier" 

        it "filters to a specific distributor" 

        it "filters to a specific order cycle" 


        it "should do all the filters at once" 

      end

      describe "fetching SKU for a variant" do
        let(:variant) { create(:variant) }
        let(:product) { variant.product }

        before { product.update_attribute(:sku, "Product SKU") }

        context "when the variant has an SKU set" do
          before { variant.update_attribute(:sku, "Variant SKU") }
          it "returns it" 

        end

        context "when the variant has bo SKU set" do
          before { variant.update_attribute(:sku, "") }

          it "returns the product's SKU" 

        end
      end
    end
  end
end

