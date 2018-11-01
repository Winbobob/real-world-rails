require 'spec_helper'

describe Spree::Admin::ProductsController, type: :controller do
  describe 'bulk_update' do
    context "updating a product we do not have access to" do
      let(:s_managed) { create(:enterprise) }
      let(:s_unmanaged) { create(:enterprise) }
      let(:product) do
        create(:simple_product, supplier: s_unmanaged, name: 'Peas')
      end

      before do
        login_as_enterprise_user [s_managed]
        spree_post :bulk_update, {
          "products" => [{"id" => product.id, "name" => "Pine nuts"}]
        }
      end

      it "denies access" 


      it "does not update any product" 

    end

    context "when changing a product's variant_unit" do
      let(:producer) { create(:enterprise) }
      let!(:product) do
        create(
          :simple_product,
          supplier: producer,
          variant_unit: 'items',
          variant_unit_scale: nil,
          variant_unit_name: 'bunches',
          unit_value: nil,
          unit_description: 'some description'
        )
      end

      before { login_as_enterprise_user([producer]) }

      it 'fails' 


      it 'does not redirect to bulk_products' 

    end
  end

  context "creating a new product" do
    before { login_as_admin }

    it "redirects to products when the user hits 'create'" 


    it "redirects to new when the user hits 'add_another'" 

  end

  describe "updating" do
    describe "product properties" do
      context "as an enterprise user" do
        let(:producer) { create(:enterprise) }
        let!(:product) { create(:simple_product, supplier: producer) }
        let!(:property) { create(:property, name: "A nice name") }

        before do
          @request.env['HTTP_REFERER'] = 'http://test.com/'
          login_as_enterprise_user [producer]
        end

        context "when a submitted property does not already exist" do
          it "does not create a new property, or product property" 

        end

        context "when a submitted property exists" do
          it "adds a product property" 

        end
      end
    end
  end
end

